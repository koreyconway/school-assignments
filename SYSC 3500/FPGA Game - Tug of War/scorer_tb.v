// Scorer testbench example
// Gord Allan, Carleton University, Feb 2004

`timescale 1ns/1ns

module scorer_tb;
	
	reg  leds_on,winrnd, rst, right, clk;		// all inputs to the device are regs
	wire [6:0] score;							// output from the device is a wire
	reg tie;
	
	// Instantiate the scorer
	scorer uut (.clk(clk), .rst(rst), .leds_on(leds_on), .right(right), .winrnd(winrnd), .score(score), .tie(tie));

	// THE GOLDEN 2 RULES of testbenches!
	//	1) Never change an input on a clock edge
	//	2) Only look at outputs when they are valid

	// We'll get to rule 1 a little further down.
	// To help with rule 2, recall that the output of a sequential circuit is 
	// only valid at (or just before) the active (positive) clock edge.  
	// By sampling the output with an 'imaginary' register in the
	// testbench, it becomes much easier to evaluate the outputs
	reg [6:0] score_reg;						// a SAMPLED version of the device output
	always @(posedge clk or posedge rst)
		if(rst) score_reg <= 0;
		else 	score_reg <= score;

	// set up a clock that toggles every 10 ns
	always #10 clk <= ~clk;
	
	// write the main sequence of the test
	initial begin
		// initialize all inputs
		clk = 0;		rst = 0; tie = 0;
		right = 0;	leds_on = 0;	winrnd = 0;
		
		// Again, THE GOLDEN 2 RULES of testbenches!
		//	1) Never change an input on a clock edge
		//	2) Only look at outputs when they are valid
		
		// to follow rule 1, we wait until the clock edge, 
		// and then move just past it before modifying the input
		
		// EVEN with the reset the system we must follow RULE 1
		@(posedge clk); #1;		// waits for a clock edge, then moves just past it
		rst = 1;				// put the system in reset
		
		// =======================
		@(posedge clk); #1;		
		rst = 0;									// remove the system from reset
		right = 0;	leds_on = 0;	winrnd = 0;		// FIRST test setup
		$display("%t - Setting up for first test. @ next clock edge Score should be 7'b0001000", $time);

		// =======================
		@(posedge clk); #1;
		// Check the result from the last test
		if(score_reg == 7'b0001000) $display("%t - SUCCESS. Score was %b", $time, score_reg);
		else						$display("%t - ERROR. Score was %b", $time, score_reg);
		
		
		// === Test left pushes first from L2  ===
		// 1. Get into state L2 (first L1, then L2)
		@(posedge clk); #1;
		$display("%t - Going into state L2.", $time);
		right = 0; leds_on = 1; winrnd = 1;	
		wait(score_reg == 7'b0010000); $display("%t - In state L1 %b", $time, score_reg);
		#2; winrnd = 0; #30;
		@(posedge clk); #1;
		right = 0; leds_on = 1; winrnd = 1;	
		wait(score_reg == 7'b0100000); $display("%t - In state L2 %b", $time, score_reg);
		winrnd = 0;
		
		// 2. Test left pushing first
		@(posedge clk); #1;
		right = 0; leds_on = 1; winrnd = 1;	
		wait(score_reg == 7'b1000000); $display("%t - Success. In state L3 %b", $time, score_reg);
		winrnd = 0;

		// === Test right pushes first from L2  ===
		// 1. Get into state L2 (currently in L3)
		@(posedge clk); #1;
		$display("%t - Going into state L2.", $time);
		right = 1; leds_on = 1; winrnd = 1;	
		wait(score_reg == 7'b0100000); $display("%t - In state L1 %b", $time, score_reg);
		winrnd = 0;
		
		// 2. Test right pushing first
		@(posedge clk); #1;
		right = 1; leds_on = 1; winrnd = 1;	
		wait(score_reg == 7'b0010000); $display("%t - Success. In state L1 %b", $time, score_reg);
		winrnd = 0;
		
		// === Test left pushes first from R3  ===
		// 1. Get into state R3 (currently in L1)
		@(posedge clk); #1;
		$display("%t - Going into state N.", $time);
		right = 1; leds_on = 1; winrnd = 1;	
		wait(score_reg == 7'b0001000); $display("%t - In state N %b", $time, score_reg);
		winrnd = 0;

		@(posedge clk); #1;
		$display("%t - Going into state R1.", $time);
		right = 1; leds_on = 1; winrnd = 1;	
		wait(score_reg == 7'b0000100); $display("%t - In state R1 %b", $time, score_reg);
		winrnd = 0;
		
		@(posedge clk); #1;
		$display("%t - Going into state R2.", $time);
		right = 1; leds_on = 1; winrnd = 1;	
		wait(score_reg == 7'b0000010); $display("%t - In state R2 %b", $time, score_reg);
		winrnd = 0;

		@(posedge clk); #1;
		$display("%t - Going into state R3.", $time);
		right = 1; leds_on = 1; winrnd = 1;	
		wait(score_reg == 7'b0000001); $display("%t - In state R3 %b", $time, score_reg);
		winrnd = 0;
		
		// 2. Test left pushing first
		@(posedge clk); #1;
		right = 0; leds_on = 1; winrnd = 1;	
		wait(score_reg == 7'b0000010); $display("%t - Success. In state R2 %b", $time, score_reg);
		winrnd = 0;
		
		// === Test right jumping light from R3  ===
		// 1. Get into state R3 (currently in R2)
		@(posedge clk); #1;
		$display("%t - Going into state R3.", $time);
		right = 1; leds_on = 1; winrnd = 1;	
		wait(score_reg == 7'b0000001); $display("%t - In state R3 %b", $time, score_reg);
		winrnd = 0;
		
		// 2. Test right jumping light
		@(posedge clk); #1;
		right = 1; leds_on = 0; winrnd = 1;	
		wait(score_reg == 7'b0000010); $display("%t - Success. In state R2 %b", $time, score_reg);
		winrnd = 0;

		// === Test right first from R3  ===
		// 1. Get into state R3 (currently in R2)
		@(posedge clk); #1;
		$display("%t - Going into state R3.", $time);
		right = 1; leds_on = 1; winrnd = 1;	
		wait(score_reg == 7'b0000001); $display("%t - In state R3 %b", $time, score_reg);
		winrnd = 0;
		
		// 2. Test right pushed first (and wins)
		@(posedge clk); #1;
		right = 1; leds_on = 1; winrnd = 1;	
		wait(score_reg == 7'b0000111); $display("%t - Success. In state WR %b", $time, score_reg);
		winrnd = 0;
		
		// =======================
		
		// continue on from here
		// you must test at least the following cases...
		// 	left pushing first from L2
		// 	right pushing first from L2
		// 	left pushing first from R3
		// 	right jumping the light from R3, 
		// 	right pushing first from R3
		
		$finish;
	end

endmodule
