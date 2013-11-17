`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Engineer: Korey Conway
// Create Date:   11:05:41 03/25/2013
// Design Name:   top
////////////////////////////////////////////////////////////////////////////////

module top_tb;

	// Inputs
	reg pbr;
	reg pbl;
	reg clk;
	reg rst;

	// Outputs
	wire [6:0] leds_out;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.pbr(pbr), 
		.pbl(pbl), 
		.clk(clk), 
		.rst(rst), 
		.leds_out(leds_out)
	);
	
	always #976563 clk = ~clk;

	initial begin
		// Initialize Inputs
		pbr = 0;
		pbl = 0;
		clk = 0;
		rst = 0;
		
		// Reset
		$display("%t - Resetting ", $time);
		@(posedge clk); #976563; rst = 1;
		@(posedge clk); #976563; rst = 0;
		
		
		// Right Push (not jump the gun)
		wait(leds_out == 7'b0000000); // wait for the dark state
		wait(leds_out != 7'b0000000); // wait for play state
		$display("Right pushes first (at correct time)");
		#1 pbr = 1; pbl = 0;
		repeat(5) @(posedge clk); // wait for a slowenable signal to trigger
		#1 pbr = 0; pbl = 0; // reset back to 0
		
		// Right Push (not jump the gun)
		wait(leds_out == 7'b0000000); // wait for the dark state
		wait(leds_out != 7'b0000000); // wait for play state
		$display("Right pushes first (at correct time)");
		#1 pbr = 1; pbl = 0;
		repeat(5) @(posedge clk); // wait for a slowenable signal to trigger
		#1 pbr = 0; pbl = 0; // reset back to 0

		// Right Push (not jump the gun)
		wait(leds_out == 7'b0000000); // wait for the dark state
		wait(leds_out != 7'b0000000); // wait for play state
		$display("Right pushes first (at correct time)");
		#1 pbr = 1; pbl = 0;
		repeat(5) @(posedge clk); // wait for a slowenable signal to trigger
		#1 pbr = 0; pbl = 0; // reset back to 0

		// Right Push (not jump the gun)
		wait(leds_out == 7'b0000000); // wait for the dark state
		wait(leds_out != 7'b0000000); // wait for play state
		$display("Right pushes first (at correct time)");
		#1 pbr = 1; pbl = 0;
		repeat(5) @(posedge clk); // wait for a slowenable signal to trigger
		#1 pbr = 0; pbl = 0; // reset back to 0
		
		wait(leds_out == 7'b0000000); // wait for the dark state
		$display("%t - Resetting ", $time);
		@(posedge clk); #976563; rst = 1;
		@(posedge clk); #976563; rst = 0;
		
		

		// Left Push (not jump the gun)
		wait(leds_out == 7'b0000000); // wait for the dark state
		wait(leds_out != 7'b0000000); // wait for play state
		$display("Left pushes first (at correct time)");
		#1 pbr = 0; pbl = 1;
		repeat(5) @(posedge clk); // wait for a slowenable signal to trigger
		#1 pbr = 0; pbl = 0; // reset back to 0
		
		// Left Push (not jump the gun)
		wait(leds_out == 7'b0000000); // wait for the dark state
		wait(leds_out != 7'b0000000); // wait for play state
		$display("Left pushes first (at correct time)");
		#1 pbr = 0; pbl = 1;
		repeat(5) @(posedge clk); // wait for a slowenable signal to trigger
		#1 pbr = 0; pbl = 0; // reset back to 0

		// Left Push (not jump the gun)
		wait(leds_out == 7'b0000000); // wait for the dark state
		wait(leds_out != 7'b0000000); // wait for play state
		$display("Left pushes first (at correct time)");
		#1 pbr = 0; pbl = 1;
		repeat(5) @(posedge clk); // wait for a slowenable signal to trigger
		#1 pbr = 0; pbl = 0; // reset back to 0

		// Left Push (not jump the gun)
		wait(leds_out == 7'b0000000); // wait for the dark state
		wait(leds_out != 7'b0000000); // wait for play state
		$display("Left pushes first (at correct time)");
		#1 pbr = 0; pbl = 1;
		repeat(5) @(posedge clk); // wait for a slowenable signal to trigger
		#1 pbr = 0; pbl = 0; // reset back to 0
		
		// Right should have won


		wait(leds_out == 7'b0000000); // wait for the dark state
		$display("%t - Resetting ", $time);
		@(posedge clk); #976563; rst = 1;
		@(posedge clk); #976563; rst = 0;

		// 0000100
		// Right Push (not jump the gun)
		wait(leds_out == 7'b0000000); // wait for the dark state
		wait(leds_out != 7'b0000000); // wait for play state
		$display("Right pushes first (at correct time)");
		#1 pbr = 1; pbl = 0;
		repeat(5) @(posedge clk); // wait for a slowenable signal to trigger
		#1 pbr = 0; pbl = 0; // reset back to 0

		// 0001000
		// Right Push (jump the gun)
		wait(leds_out == 7'b0000000); // wait for dark state
		$display("Right pushes first (jump the gun)");
		#1 pbr = 1; pbl = 0;
		repeat(5) @(posedge clk); // wait for a slowenable signal to trigger
		#1 pbr = 0; pbl = 0; // reset back to 0
		wait(leds_out != 7'b0000000); // to get out of dark state

		// 0010000
		// Left Push (not jump the gun)
		wait(leds_out == 7'b0000000); // wait for the dark state
		wait(leds_out != 7'b0000000); // wait for play state
		$display("Left pushes first (at correct time)");
		#1 pbr = 0; pbl = 1;
		repeat(5) @(posedge clk); // wait for a slowenable signal to trigger
		#1 pbr = 0; pbl = 0; // reset back to 0
		
		// 0100000
		// Left Push (not jump the gun)
		wait(leds_out == 7'b0000000); // wait for the dark state
		wait(leds_out != 7'b0000000); // wait for play state
		$display("%t - Left pushes first (at correct time)", $time);
		#1 pbr = 0; pbl = 1;
		repeat(5) @(posedge clk); // wait for a slowenable signal to trigger
		#1 pbr = 0; pbl = 0; // reset back to 0

		// 1000000
		// Left Push (not jump the gun)
		wait(leds_out == 7'b0000000); // wait for the dark state
		#5;
		wait(leds_out != 7'b0000000); // wait for play state
		$display("%t - Left pushes first (at correct time)", $time);
		#1 pbr = 0; pbl = 1;
		repeat(5) @(posedge clk); // wait for a slowenable signal to trigger
		#1 pbr = 0; pbl = 0; // reset back to 0
		
		
		// 0100000
		// Left Push (jump the gun)
		wait(leds_out == 7'b0000000); // wait for dark state
		$display("Left pushes first (jump the gun)");
		#1 pbr = 0; pbl = 1;
		repeat(5) @(posedge clk); // wait for a slowenable signal to trigger
		#1 pbr = 0; pbl = 0; // reset back to 0
		wait(leds_out != 7'b0000000); // to get out of dark state

		// 1000000
		// Left Push (not jump the gun)
		wait(leds_out == 7'b0000000); // wait for the dark state
		wait(leds_out != 7'b0000000); // wait for play state
		$display("Left pushes first (at correct time)");
		#1 pbr = 0; pbl = 1;
		repeat(5) @(posedge clk); // wait for a slowenable signal to trigger
		#1 pbr = 0; pbl = 0; // reset back to 0
		
		// 0010000
		// Right Push (not jump the gun)
		wait(leds_out == 7'b0000000); // wait for the dark state
		wait(leds_out != 7'b0000000); // wait for play state
		$display("Right pushes first (at correct time)");
		#1 pbr = 1; pbl = 0;
		repeat(5) @(posedge clk); // wait for a slowenable signal to trigger
		#1 pbr = 0; pbl = 0; // reset back to 0

		// 0100000
		// Left Push (not jump the gun)
		wait(leds_out == 7'b0000000); // wait for the dark state
		wait(leds_out != 7'b0000000); // wait for play state
		$display("Left pushes first (at correct time)");
		#1 pbr = 0; pbl = 1;
		repeat(5) @(posedge clk); // wait for a slowenable signal to trigger
		#1 pbr = 0; pbl = 0; // reset back to 0
		
		// 1000000
		// Left Push (not jump the gun)
		wait(leds_out == 7'b0000000); // wait for the dark state
		wait(leds_out != 7'b0000000); // wait for play state
		$display("Left pushes first (at correct time)");
		#1 pbr = 0; pbl = 1;
		repeat(5) @(posedge clk); // wait for a slowenable signal to trigger
		#1 pbr = 0; pbl = 0; // reset back to 0

		// 1110000
		// Left Push (not jump the gun)
		wait(leds_out == 7'b0000000); // wait for the dark state
		wait(leds_out != 7'b0000000); // wait for play state
		$display("Left pushes first (at correct time)");
		#1 pbr = 0; pbl = 1;
		repeat(5) @(posedge clk); // wait for a slowenable signal to trigger
		#1 pbr = 0; pbl = 0; // reset back to 0

		wait(leds_out == 7'b0000000); // wait for the dark state

		// Wait 100 ns for global reset to finish
		#100000;

	end
     
endmodule

