`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Korey Conway
// Create Date:    10:06:52 03/25/2013 
// Module Name:    top
//////////////////////////////////////////////////////////////////////////////////
module top(
    input pbr,
    input pbl,
    input clk,
    input rst,
    output [6:0] leds_out
    );
	 
	wire [1:0] leds_ctrl;
	wire [6:0] score;
	wire slowenable;
	wire rout;
	wire winrnd;
	wire leds_on;
	wire clear;
	wire push;
	wire tie;
	wire right;
	wire sypush;
	

	div256 div256 (
		.clk(clk), 
		.rst(rst), 
		.slowenable(slowenable)
	);
	
	random random (
		.slowenable(slowenable), 
		.rst(rst),
		.rout(rout)
	);

	MC mc (
		.slowenable(slowenable), 
		.rout(rout), 
		.winrnd(winrnd), 
		.clk(clk), 
		.rst(rst), 
		.leds_on(leds_on), 
		.leds_ctrl(leds_ctrl), 
		.clear(clear)
	);
	
	PBL pushbuttonlatch (
		.pbl(pbl), 
		.pbr(pbr), 
		.clear(clear), 
		.rst(rst), 
		.push(push), 
		.tie(tie), 
		.right(right)
	);
	
	Synchronizer sync (
		.push(push), 
		.clk(clk), 
		.rst(rst), 
		.sypush(sypush)
	);
	
	OPP opp (
		.sypush(sypush), 
		.clk(clk), 
		.rst(rst), 
		.winrnd(winrnd)
	);
	
	scorer scorer (
		.clk(clk),
		.rst(rst),
		.leds_on(leds_on),
		.right(right),
		.tie(tie),
		.winrnd(winrnd),
		.score(score)
	);
	
	ledmux ledmux (
		.leds_ctrl(leds_ctrl), 
		.score(score), 
		.leds_out(leds_out)
	);

endmodule
