`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:50:10 03/11/2013
// Design Name:   Synchronizer
// Module Name:   W:/ELEC3500/Lab 7/xilinx/Synchronizer_tb.v
// Project Name:  xilinx
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Synchronizer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Synchronizer_tb;

	// Inputs
	reg push;
	reg clk;
	reg rst;

	// Outputs
	wire sypush;

	// Instantiate the Unit Under Test (UUT)
	Synchronizer uut (
		.push(push), 
		.clk(clk), 
		.rst(rst), 
		.sypush(sypush)
	);
	
	always #10 clk <= ~clk;

	initial begin
		// Initialize Inputs
		push = 0;
		clk = 0;
		rst = 0;

		// test reset
		#50;
		@(posedge clk) #1;
		rst = 1;
		@(posedge clk) #1;
		rst = 0;
		#20;

		// test async push high
		@(posedge clk) #1;
		push = 1;
		repeat (5) @(posedge clk) #1;
		push = 0;
		#20;
		
		// Add stimulus here

	end
      
endmodule

