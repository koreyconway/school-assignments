`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Korey Conway
// Create Date:    10:30:58 03/18/2013 
// Module Name:    div256 
//////////////////////////////////////////////////////////////////////////////////
module div256(clk, rst, slowenable);
	 input clk;
	 input rst;
    output slowenable;

reg [7:0] count;


always @(posedge clk or posedge rst)
	if (rst)
		count <= 0;
	else 
		count <= count + 1;

assign slowenable = &count;


endmodule

