`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:36:10 03/18/2013
// Design Name:   random
// Module Name:   W:/ELEC3500/Lab 8/xilinx/random_tb.v
// Project Name:  xilinx
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: random
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module random_tb;

	// Inputs
	reg slowenable;
	reg rst;

	// Outputs
	wire rout;

	// Instantiate the Unit Under Test (UUT)
	random uut (
		.slowenable(slowenable), 
		.rst(rst),
		.rout(rout)
	);
	
	always #1 slowenable = ~slowenable;

	initial begin
		// Initialize Inputs
		rst = 0;
		slowenable = 0;
		
		#20; rst = 1;
		#20; rst = 0;

		// Wait 100 ns for global reset to finish
		#100000000;
        
		// Add stimulus here

	end
      
endmodule

