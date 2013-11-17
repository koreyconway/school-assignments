`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Engineer:
// Create Date:   11:43:25 03/18/2013
// Design Name:   div256
////////////////////////////////////////////////////////////////////////////////

module div256_tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire slowenable;
	reg [12:0] count = 0;

	// Instantiate the Unit Under Test (UUT)
	div256 uut (
		.clk(clk), 
		.rst(rst), 
		.slowenable(slowenable)
	);
	
	always #1 clk = ~clk;
	
	always @(posedge clk)
		count <= count + 1;

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		
		#20 rst = 1;
		#20 rst = 0; count = 0;

		// Wait 100 ns for global reset to finish
		#20000;
        
		// Add stimulus here

	end
      
endmodule

