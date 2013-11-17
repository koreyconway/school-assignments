`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:33:51 03/11/2013
// Design Name:   PBL
// Module Name:   W:/ELEC3500/Lab 7/xilinx/PBL_tb.v
// Project Name:  xilinx
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PBL
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PBL_tb;

	// Inputs
	reg pbl;
	reg pbr;
	reg clear;
	reg rst;

	// Outputs
	wire push;
	wire tie;
	wire right;

	// Instantiate the Unit Under Test (UUT)
	PBL uut (
		.pbl(pbl), 
		.pbr(pbr), 
		.clear(clear), 
		.rst(rst), 
		.push(push), 
		.tie(tie), 
		.right(right)
	);

	initial begin
		// Initialize Inputs
		pbl = 0;
		pbr = 0;
		clear = 0;
		rst = 0;

		#5;
		rst = 1; #10;
		rst = 0; #10;
		
		// test right push
		pbr = 1; pbl = 0; #10;
		pbr = 0; pbl = 0; clear = 1; #2; clear = 0;
		
		// test left push
		pbr = 0; pbl = 1; #10;
		pbr = 0; pbl = 0; clear = 1; #2; clear = 0;
		
		// test tie
		pbr = 1; pbl = 1; #10;
		pbr = 0; pbl = 0; clear = 1; #2; clear = 0;
		
		// test no push
		pbr = 0; pbl = 0; #10;
		pbr = 0; pbl = 0; clear = 1; #2; clear = 0;

	end
      
endmodule

