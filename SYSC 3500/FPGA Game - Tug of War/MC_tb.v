`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:22:20 03/18/2013
// Design Name:   MC
// Module Name:   W:/ELEC3500/Lab 8/xilinx/MC_tb.v
// Project Name:  xilinx
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MC_tb;

	// Inputs
	reg slowenable;
	reg rout;
	reg winrnd;
	reg clk;
	reg rst;

	// Outputs
	wire leds_on;
	wire leds_ctrl;
	wire clear;

	// Instantiate the Unit Under Test (UUT)
	MC uut (
		.slowenable(slowenable), 
		.rout(rout), 
		.winrnd(winrnd), 
		.clk(clk), 
		.rst(rst), 
		.leds_on(leds_on), 
		.leds_ctrl(leds_ctrl), 
		.clear(clear)
	);
	
	

	initial begin
		// Initialize Inputs
		slowenable = 0;
		rout = 0;
		winrnd = 0;
		clk = 0;
		rst = 0;
		
		
		#20 rst = 1;
		#20 rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

