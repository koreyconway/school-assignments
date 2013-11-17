`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:38:24 03/25/2013
// Design Name:   ledmux
// Module Name:   W:/ELEC3500/Lab 9/xilinx/ledmux_tb.v
// Project Name:  xilinx
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ledmux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ledmux_tb;

	// Inputs
	reg [1:0] leds_ctrl;
	reg [6:0] score;

	// Outputs
	wire [6:0] leds_out;

	// Instantiate the Unit Under Test (UUT)
	ledmux uut (
		.leds_ctrl(leds_ctrl), 
		.score(score), 
		.leds_out(leds_out)
	);

	initial begin
		// Initialize Inputs
		leds_ctrl = 0;
		score = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

