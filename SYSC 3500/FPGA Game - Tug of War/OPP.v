`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Engineer:  Korey Conway
// Create Date:    10:33:16 03/11/2013 
// Module Name:    OPP 
//////////////////////////////////////////////////////////////////////////////////
module OPP(
    input sypush,
    input clk,
    input rst,
    output winrnd
    );


reg regwinrnd;

assign winrnd = ~regwinrnd & sypush;

always @(posedge clk or posedge rst)
	if ( rst ) regwinrnd <= 1;
	else regwinrnd <= sypush;
endmodule

/*

assign winrnd = sypush & regwinrnd & ~went_high;

always @(posedge clk or posedge rst)
	if (rst | ~sypush) went_high <= 0;
	else if (sypush)   went_high <= 1;
	
always @(posedge clk or posedge rst)
	if (rst | ~sypush) regwinrnd <= 0;
	else regwinrnd <= 1;
*/


/*
reg went_high;
reg regwinrnd;

assign winrnd = regwinrnd;

always @(posedge clk or posedge rst)
	if (rst | ~sypush)
		begin
			went_high <= 0;
			regwinrnd <= 0;
		end
	else
		begin
			if (sypush) went_high <= 1;
			regwinrnd <= sypush & ~regwinrnd & ~went_high;
		end
endmodule
*/

