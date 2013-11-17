`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:36:46 03/25/2013 
// Design Name: 
// Module Name:    ledmux 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ledmux(
    input [1:0] leds_ctrl,
    input [6:0] score,
    output [6:0] leds_out
    );
	 
reg [6:0] leds_out_reg;

assign leds_out = leds_out_reg;

//`define ALL_OFF   0  // all leds off
//`define ALL_ON   1  // all leds on
//`define RESET_CODE   2  // error/reset code
//`define SCORE  3  // score

always @(leds_ctrl or score)
	case (leds_ctrl)
		0:	leds_out_reg = 7'b0000000;
		1:	leds_out_reg = 7'b1111111;
		2:	leds_out_reg = 7'b1001001;
		3:	leds_out_reg = score;
		default: leds_out_reg = 7'b1010101;
	endcase
endmodule
