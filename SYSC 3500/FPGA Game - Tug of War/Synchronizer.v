`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Korey Conway
// Create Date:    10:26:49 03/11/2013 
// Module Name:    Synchronizer 
//////////////////////////////////////////////////////////////////////////////////
module Synchronizer(
    input push,
    input clk,
    input rst,
    output sypush
    );

reg regsyspush;

assign sypush = regsyspush;

always @(posedge clk or posedge rst)
	if (rst) regsyspush <= 0;
	else regsyspush <= push;
endmodule
