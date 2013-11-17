`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Korey Conway
// Create Date:    10:30:58 03/18/2013 
// Module Name:    random 
//////////////////////////////////////////////////////////////////////////////////
module random(
    input slowenable,
	 input rst,
    output rout
    );

reg [9:0] lfsr;
assign rout = lfsr[9];

always @(posedge slowenable or posedge rst)
	if (rst) lfsr[9:0] <= 1;
	else
		begin
			lfsr[8:0] <= lfsr[9:1];
			lfsr[9] <= lfsr[0] ^ lfsr[3];
		end
endmodule
