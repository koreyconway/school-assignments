`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:43:17 03/11/2013
// Design Name:   OPP
// Module Name:   W:/ELEC3500/Lab 7/xilinx/OPP_tb.v
// Project Name:  xilinx
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: OPP
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module OPP_tb;

	// Inputs
	reg sypush;
	reg clk;
	reg rst;

	// Outputs
	wire winrnd;

	// Instantiate the Unit Under Test (UUT)
	OPP uut (
		.sypush(sypush), 
		.clk(clk), 
		.rst(rst), 
		.winrnd(winrnd)
	);
	
	always #10 clk <= ~clk;

	initial begin
		// Initialize Inputs
		sypush = 0;
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;

		// test reset
		@(posedge clk) #1;
		rst = 1;
		@(posedge clk) #1;
		rst = 0;
		#20;
		
		// test syspush async high
		@(posedge clk) #1;
		sypush = 1;
		@(posedge clk) #1;
		sypush = 0;
		#20;
		
		// test syspush async high
		@(posedge clk) #1;
		sypush = 1;
		repeat (5) @(posedge clk) #1;
		sypush = 0;
		
		// test syspush async high again
		@(posedge clk) #1;
		sypush = 1;
		repeat (5) @(posedge clk) #1;
		sypush = 0;

		#20;
		
        
		// Add stimulus here

	end
      
endmodule

