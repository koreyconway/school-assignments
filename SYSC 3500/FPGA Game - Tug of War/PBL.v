`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Engineer: Korey Conway
// Create Date:    10:11:33 03/11/2013 
// Module Name:    PBL 
//////////////////////////////////////////////////////////////////////////////////
module PBL(
    input pbl,
    input pbr,
    input clear,
    input rst,
    output push,
    output tie,
    output right
    );

wire qr, ql, triggerR, triggerL;

assign triggerR = pbr & ~ql;
assign triggerL = pbl & ~qr;

RSLatch latchR (triggerR, clear, rst, qr);
RSLatch latchL (triggerL, clear, rst, ql);

assign push = qr | ql;
assign tie = qr & ql;
assign right = qr; // note: this could be also defined ast qr & ~ql, but  because we have a tie check it would not be more accurate

endmodule
