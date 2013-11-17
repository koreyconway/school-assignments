`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Korey Conway
// Create Date:    10:15:03 03/11/2013 
// Module Name:    RSLatch 
//////////////////////////////////////////////////////////////////////////////////
module RSLatch(
    input trigger,
    input clear,
    input rst,
    output q
    );

wire qx;

assign qx = (trigger | q);
assign q = qx & ~(rst | clear); 

endmodule
