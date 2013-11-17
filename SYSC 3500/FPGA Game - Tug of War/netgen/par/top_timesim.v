////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2010 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: M.81d
//  \   \         Application: netgen
//  /   /         Filename: top_timesim.v
// /___/   /\     Timestamp: Mon Apr 01 15:14:30 2013
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -s 4 -pcf top.pcf -sdf_anno true -sdf_path netgen/par -insert_glbl true -insert_pp_buffers true -w -dir netgen/par -ofmt verilog -sim top.ncd top_timesim.v 
// Device	: 3s200ft256-4 (PRODUCTION 1.39 2010-11-18)
// Input file	: top.ncd
// Output file	: \\ugradfs\kconway1\win\ELEC3500\Lab 9\xilinx\netgen\par\top_timesim.v
// # of Modules	: 1
// Design Name	: top
// Xilinx        : C:\Xilinx\12.4\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module top (
  clk, rst, pbl, pbr, leds_out
);
  input clk;
  input rst;
  input pbl;
  input pbr;
  output [6 : 0] leds_out;
  wire clk_BUFGP;
  wire rst_IBUF_407;
  wire \div256/Mcount_count_cy[1] ;
  wire \div256/Mcount_count_cy[3] ;
  wire pbl_IBUF_427;
  wire pbr_IBUF_428;
  wire \mc/state_FSM_FFd1_430 ;
  wire \scorer/state_FSM_FFd4_431 ;
  wire \scorer/state_FSM_FFd3_432 ;
  wire \scorer/state_FSM_FFd2_433 ;
  wire \scorer/state_FSM_FFd1_434 ;
  wire \mc/state_FSM_FFd3_435 ;
  wire \mc/state_FSM_FFd2_436 ;
  wire N33_0;
  wire N34_0;
  wire N42;
  wire N43;
  wire \sync/regsyspush_441 ;
  wire \opp/regwinrnd_442 ;
  wire \mc/state_FSM_FFd3-In29_0 ;
  wire N56;
  wire N9;
  wire N36;
  wire right;
  wire \scorer/state_FSM_FFd4-In111_0 ;
  wire \pushbuttonlatch/ql ;
  wire N23;
  wire \scorer/state_and0000_0 ;
  wire \mc/state_FSM_FFd3_1_452 ;
  wire \div256/slowenable4_453 ;
  wire N47_0;
  wire \div256/slowenable9_0 ;
  wire \mc/state_FSM_FFd3-In6/O ;
  wire \scorer/mr1/O ;
  wire \scorer/state_FSM_FFd4-In43/O ;
  wire \scorer/state_FSM_FFd4-In5_0 ;
  wire \mc/state_FSM_FFd1-In23_0 ;
  wire \mc/state_FSM_FFd1-In7/O ;
  wire \mc/state_FSM_FFd1-In20_0 ;
  wire \random/lfsr[9] ;
  wire slowenable;
  wire \random/lfsr_31_466 ;
  wire N24_0;
  wire \random/lfsr[3] ;
  wire \random/lfsr[0] ;
  wire rst_IBUF_shift1_470;
  wire rst_IBUF_shift2_471;
  wire rst_IBUF_shift3_472;
  wire rst_IBUF_shift4_473;
  wire rst_IBUF_shift5_474;
  wire N18;
  wire \random/lfsr[2] ;
  wire \random/lfsr[1] ;
  wire \div256/count<0>/DXMUX_525 ;
  wire \div256/count<0>/XORF_523 ;
  wire \div256/count<0>/LOGIC_ONE_522 ;
  wire \div256/count<0>/CYINIT_521 ;
  wire \div256/count<0>/CYSELF_512 ;
  wire \div256/count<0>/BXINV_510 ;
  wire \div256/count<0>/DYMUX_503 ;
  wire \div256/count<0>/XORG_501 ;
  wire \div256/count<0>/CYMUXG_500 ;
  wire \div256/Mcount_count_cy[0] ;
  wire \div256/count<0>/LOGIC_ZERO_498 ;
  wire \div256/count<0>/CYSELG_489 ;
  wire \div256/count<0>/G ;
  wire \div256/count<0>/SRINV_487 ;
  wire \div256/count<0>/CLKINV_486 ;
  wire \div256/count<2>/DXMUX_581 ;
  wire \div256/count<2>/XORF_579 ;
  wire \div256/count<2>/CYINIT_578 ;
  wire \div256/count<2>/F ;
  wire \div256/count<2>/DYMUX_562 ;
  wire \div256/count<2>/XORG_560 ;
  wire \div256/Mcount_count_cy[2] ;
  wire \div256/count<2>/CYSELF_558 ;
  wire \div256/count<2>/CYMUXFAST_557 ;
  wire \div256/count<2>/CYAND_556 ;
  wire \div256/count<2>/FASTCARRY_555 ;
  wire \div256/count<2>/CYMUXG2_554 ;
  wire \div256/count<2>/CYMUXF2_553 ;
  wire \div256/count<2>/LOGIC_ZERO_552 ;
  wire \div256/count<2>/CYSELG_543 ;
  wire \div256/count<2>/G ;
  wire \div256/count<2>/SRINV_541 ;
  wire \div256/count<2>/CLKINV_540 ;
  wire \div256/count<4>/DXMUX_637 ;
  wire \div256/count<4>/XORF_635 ;
  wire \div256/count<4>/CYINIT_634 ;
  wire \div256/count<4>/F ;
  wire \div256/count<4>/DYMUX_618 ;
  wire \div256/count<4>/XORG_616 ;
  wire \div256/Mcount_count_cy[4] ;
  wire \div256/count<4>/CYSELF_614 ;
  wire \div256/count<4>/CYMUXFAST_613 ;
  wire \div256/count<4>/CYAND_612 ;
  wire \div256/count<4>/FASTCARRY_611 ;
  wire \div256/count<4>/CYMUXG2_610 ;
  wire \div256/count<4>/CYMUXF2_609 ;
  wire \div256/count<4>/LOGIC_ZERO_608 ;
  wire \div256/count<4>/CYSELG_599 ;
  wire \div256/count<4>/G ;
  wire \div256/count<4>/SRINV_597 ;
  wire \div256/count<4>/CLKINV_596 ;
  wire \div256/count<6>/DXMUX_686 ;
  wire \div256/count<6>/XORF_684 ;
  wire \div256/count<6>/LOGIC_ZERO_683 ;
  wire \div256/count<6>/CYINIT_682 ;
  wire \div256/count<6>/CYSELF_673 ;
  wire \div256/count<6>/F ;
  wire \div256/count<6>/DYMUX_665 ;
  wire \div256/count<6>/XORG_663 ;
  wire \div256/Mcount_count_cy[6] ;
  wire \div256/count<7>_rt_660 ;
  wire \div256/count<6>/SRINV_652 ;
  wire \div256/count<6>/CLKINV_651 ;
  wire \clk/INBUF ;
  wire \leds_out<0>/O ;
  wire \leds_out<1>/O ;
  wire \leds_out<2>/O ;
  wire \leds_out<3>/O ;
  wire \leds_out<4>/O ;
  wire \leds_out<5>/O ;
  wire \leds_out<6>/O ;
  wire \pbl/INBUF ;
  wire \pbr/INBUF ;
  wire \rst/INBUF ;
  wire \clk_BUFGP/BUFG/S_INVNOT ;
  wire \clk_BUFGP/BUFG/I0_INV ;
  wire \leds_out_2_OBUF/F5MUX_801 ;
  wire \ledmux/Mmux_leds_out_reg3 ;
  wire \leds_out_2_OBUF/BXINV_794 ;
  wire \mc/state_FSM_FFd3_rt_792 ;
  wire \leds_out_3_OBUF/F5MUX_826 ;
  wire \ledmux/Mmux_leds_out_reg4 ;
  wire \leds_out_3_OBUF/BXINV_818 ;
  wire \ledmux/Mmux_leds_out_reg41_816 ;
  wire \leds_out_5_OBUF/F5MUX_851 ;
  wire \ledmux/Mmux_leds_out_reg6 ;
  wire \leds_out_5_OBUF/BXINV_844 ;
  wire \ledmux/Mmux_leds_out_reg61_842 ;
  wire \N42/F5MUX_876 ;
  wire N51;
  wire \N42/BXINV_869 ;
  wire N50;
  wire \N43/F5MUX_901 ;
  wire N53;
  wire \N43/BXINV_894 ;
  wire N52;
  wire \N56/F5MUX_926 ;
  wire N59;
  wire \N56/BXINV_919 ;
  wire N58;
  wire \leds_out_1_OBUF/F5MUX_951 ;
  wire \ledmux/Mmux_leds_out_reg2 ;
  wire \leds_out_1_OBUF/BXINV_944 ;
  wire \leds_out_1_OBUF/G ;
  wire N33;
  wire N9_pack_1;
  wire \scorer/state_FSM_FFd4-In111_998 ;
  wire N36_pack_1;
  wire \scorer/state_and0000 ;
  wire \pushbuttonlatch/ql_pack_3 ;
  wire right_pack_1;
  wire N23_pack_2;
  wire \mc/state_FSM_FFd3_1/FFX/RST ;
  wire \mc/state_FSM_FFd3_1/DXMUX_1078 ;
  wire \mc/state_FSM_FFd3_1/FXMUX_1077 ;
  wire \mc/state_FSM_FFd3-In ;
  wire \div256/slowenable4_pack_1 ;
  wire \mc/state_FSM_FFd3_1/CLKINV_1062 ;
  wire N47;
  wire \mc/state_FSM_FFd3-In6/O_pack_2 ;
  wire \scorer/state_FSM_FFd3/FFX/RST ;
  wire \scorer/state_FSM_FFd3/DXMUX_1139 ;
  wire \scorer/state_FSM_FFd3-In ;
  wire \scorer/mr1/O_pack_2 ;
  wire \scorer/state_FSM_FFd3/CLKINV_1123 ;
  wire \scorer/state_FSM_FFd3/CEINV_1122 ;
  wire \scorer/state_FSM_FFd4/FFX/RST ;
  wire \scorer/state_FSM_FFd4/DXMUX_1177 ;
  wire \scorer/state_FSM_FFd4-In ;
  wire \scorer/state_FSM_FFd4-In43/O_pack_2 ;
  wire \scorer/state_FSM_FFd4/CLKINV_1161 ;
  wire \scorer/state_FSM_FFd4/CEINV_1160 ;
  wire \mc/state_FSM_FFd1/DXMUX_1213 ;
  wire \mc/state_FSM_FFd1-In ;
  wire \mc/state_FSM_FFd1-In7/O_pack_2 ;
  wire \mc/state_FSM_FFd1/CLKINV_1197 ;
  wire \random/lfsr_31/DYMUX_1245 ;
  wire \random/Mshreg_lfsr_3 ;
  wire \random/lfsr_31/DIG_MUX_1234 ;
  wire \random/lfsr_31/CLKINV_1232 ;
  wire \random/lfsr_31/WSG ;
  wire \random/lfsr_31/SRINV_1228 ;
  wire \mc/state_FSM_FFd1-In23_1281 ;
  wire \mc/state_FSM_FFd2/DYMUX_1268 ;
  wire \mc/state_FSM_FFd2-In ;
  wire \mc/state_FSM_FFd2/CLKINV_1259 ;
  wire \scorer/state_FSM_FFd2/DXMUX_1322 ;
  wire \scorer/state_FSM_FFd2-In_1319 ;
  wire \scorer/state_FSM_FFd2/DYMUX_1307 ;
  wire \scorer/state_FSM_FFd1-In ;
  wire \scorer/state_FSM_FFd2/SRINV_1299 ;
  wire \scorer/state_FSM_FFd2/CLKINV_1298 ;
  wire \scorer/state_FSM_FFd2/CEINV_1297 ;
  wire \scorer/state_FSM_FFd4-In5_1362 ;
  wire \sync/regsyspush/DYMUX_1351 ;
  wire push;
  wire \sync/regsyspush/CLKINV_1340 ;
  wire \random/lfsr<9>/DYMUX_1381 ;
  wire \random/lfsr_9_xor0000 ;
  wire \random/lfsr<9>/CLKINV_1370 ;
  wire \rst_IBUF_shift2/DXMUX_1405 ;
  wire \rst_IBUF_shift2/DYMUX_1397 ;
  wire \rst_IBUF_shift2/BYINV_1396 ;
  wire \rst_IBUF_shift2/SRINV_1395 ;
  wire \rst_IBUF_shift2/CLKINV_1394 ;
  wire \rst_IBUF_shift4/DXMUX_1429 ;
  wire \rst_IBUF_shift4/DYMUX_1421 ;
  wire \rst_IBUF_shift4/SRINV_1419 ;
  wire \rst_IBUF_shift4/CLKINV_1418 ;
  wire \rst_IBUF_shift5/DYMUX_1443 ;
  wire \rst_IBUF_shift5/CLKINV_1440 ;
  wire N24;
  wire N34;
  wire \div256/slowenable9_1483 ;
  wire leds_out_4_OBUF_1507;
  wire leds_out_0_OBUF_1500;
  wire \opp/regwinrnd/DYMUX_1517 ;
  wire \opp/regwinrnd/CLKINV_1514 ;
  wire leds_out_6_OBUF_1544;
  wire N18_pack_2;
  wire \mc/state_FSM_FFd3/DYMUX_1554 ;
  wire \mc/state_FSM_FFd3/CLKINV_1551 ;
  wire \mc/state_FSM_FFd3-In29_1570 ;
  wire \mc/state_FSM_FFd1-In20_1594 ;
  wire slowenable_pack_1;
  wire \random/lfsr<1>/DXMUX_1613 ;
  wire \random/lfsr<1>/DYMUX_1606 ;
  wire \random/lfsr<1>/SRINV_1604 ;
  wire \random/lfsr<1>/CLKINV_1603 ;
  wire \random/lfsr<2>/DXMUX_1646 ;
  wire \random/lfsr<2>/DYMUX_1638 ;
  wire \random/lfsr_311_1635 ;
  wire \random/lfsr<2>/SRINV_1628 ;
  wire \random/lfsr<2>/CLKINV_1627 ;
  wire \mc/state_FSM_FFd1/FFX/RSTAND_1218 ;
  wire \mc/state_FSM_FFd2/FFY/RSTAND_1273 ;
  wire \sync/regsyspush/FFY/RSTAND_1356 ;
  wire \random/lfsr<9>/FFY/RSTAND_1386 ;
  wire \rst_IBUF_shift5/FFY/RSTAND_1448 ;
  wire \opp/regwinrnd/FFY/SET ;
  wire \mc/state_FSM_FFd3/FFY/RSTAND_1559 ;
  wire GND;
  wire VCC;
  wire \NLW_random/Mshreg_lfsr_3/SRL16E_Q15_UNCONNECTED ;
  wire [7 : 0] \div256/count ;
  wire [0 : 0] \div256/Mcount_count_lut ;
  initial $sdf_annotate("netgen/par/top_timesim.sdf");
  X_ZERO #(
    .LOC ( "SLICE_X19Y30" ))
  \div256/count<0>/LOGIC_ZERO  (
    .O(\div256/count<0>/LOGIC_ZERO_498 )
  );
  X_ONE #(
    .LOC ( "SLICE_X19Y30" ))
  \div256/count<0>/LOGIC_ONE  (
    .O(\div256/count<0>/LOGIC_ONE_522 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y30" ))
  \div256/count<0>/DXMUX  (
    .I(\div256/count<0>/XORF_523 ),
    .O(\div256/count<0>/DXMUX_525 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X19Y30" ))
  \div256/count<0>/XORF  (
    .I0(\div256/count<0>/CYINIT_521 ),
    .I1(\div256/Mcount_count_lut [0]),
    .O(\div256/count<0>/XORF_523 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X19Y30" ))
  \div256/count<0>/CYMUXF  (
    .IA(\div256/count<0>/LOGIC_ONE_522 ),
    .IB(\div256/count<0>/CYINIT_521 ),
    .SEL(\div256/count<0>/CYSELF_512 ),
    .O(\div256/Mcount_count_cy[0] )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y30" ))
  \div256/count<0>/CYINIT  (
    .I(\div256/count<0>/BXINV_510 ),
    .O(\div256/count<0>/CYINIT_521 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y30" ))
  \div256/count<0>/CYSELF  (
    .I(\div256/Mcount_count_lut [0]),
    .O(\div256/count<0>/CYSELF_512 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y30" ))
  \div256/count<0>/BXINV  (
    .I(1'b0),
    .O(\div256/count<0>/BXINV_510 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y30" ))
  \div256/count<0>/DYMUX  (
    .I(\div256/count<0>/XORG_501 ),
    .O(\div256/count<0>/DYMUX_503 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X19Y30" ))
  \div256/count<0>/XORG  (
    .I0(\div256/Mcount_count_cy[0] ),
    .I1(\div256/count<0>/G ),
    .O(\div256/count<0>/XORG_501 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y30" ))
  \div256/count<0>/COUTUSED  (
    .I(\div256/count<0>/CYMUXG_500 ),
    .O(\div256/Mcount_count_cy[1] )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X19Y30" ))
  \div256/count<0>/CYMUXG  (
    .IA(\div256/count<0>/LOGIC_ZERO_498 ),
    .IB(\div256/Mcount_count_cy[0] ),
    .SEL(\div256/count<0>/CYSELG_489 ),
    .O(\div256/count<0>/CYMUXG_500 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y30" ))
  \div256/count<0>/CYSELG  (
    .I(\div256/count<0>/G ),
    .O(\div256/count<0>/CYSELG_489 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y30" ))
  \div256/count<0>/SRINV  (
    .I(rst_IBUF_407),
    .O(\div256/count<0>/SRINV_487 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y30" ))
  \div256/count<0>/CLKINV  (
    .I(clk_BUFGP),
    .O(\div256/count<0>/CLKINV_486 )
  );
  X_ZERO #(
    .LOC ( "SLICE_X19Y31" ))
  \div256/count<2>/LOGIC_ZERO  (
    .O(\div256/count<2>/LOGIC_ZERO_552 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y31" ))
  \div256/count<2>/DXMUX  (
    .I(\div256/count<2>/XORF_579 ),
    .O(\div256/count<2>/DXMUX_581 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X19Y31" ))
  \div256/count<2>/XORF  (
    .I0(\div256/count<2>/CYINIT_578 ),
    .I1(\div256/count<2>/F ),
    .O(\div256/count<2>/XORF_579 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X19Y31" ))
  \div256/count<2>/CYMUXF  (
    .IA(\div256/count<2>/LOGIC_ZERO_552 ),
    .IB(\div256/count<2>/CYINIT_578 ),
    .SEL(\div256/count<2>/CYSELF_558 ),
    .O(\div256/Mcount_count_cy[2] )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X19Y31" ))
  \div256/count<2>/CYMUXF2  (
    .IA(\div256/count<2>/LOGIC_ZERO_552 ),
    .IB(\div256/count<2>/LOGIC_ZERO_552 ),
    .SEL(\div256/count<2>/CYSELF_558 ),
    .O(\div256/count<2>/CYMUXF2_553 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y31" ))
  \div256/count<2>/CYINIT  (
    .I(\div256/Mcount_count_cy[1] ),
    .O(\div256/count<2>/CYINIT_578 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y31" ))
  \div256/count<2>/CYSELF  (
    .I(\div256/count<2>/F ),
    .O(\div256/count<2>/CYSELF_558 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y31" ))
  \div256/count<2>/DYMUX  (
    .I(\div256/count<2>/XORG_560 ),
    .O(\div256/count<2>/DYMUX_562 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X19Y31" ))
  \div256/count<2>/XORG  (
    .I0(\div256/Mcount_count_cy[2] ),
    .I1(\div256/count<2>/G ),
    .O(\div256/count<2>/XORG_560 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y31" ))
  \div256/count<2>/COUTUSED  (
    .I(\div256/count<2>/CYMUXFAST_557 ),
    .O(\div256/Mcount_count_cy[3] )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y31" ))
  \div256/count<2>/FASTCARRY  (
    .I(\div256/Mcount_count_cy[1] ),
    .O(\div256/count<2>/FASTCARRY_555 )
  );
  X_AND2 #(
    .LOC ( "SLICE_X19Y31" ))
  \div256/count<2>/CYAND  (
    .I0(\div256/count<2>/CYSELG_543 ),
    .I1(\div256/count<2>/CYSELF_558 ),
    .O(\div256/count<2>/CYAND_556 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X19Y31" ))
  \div256/count<2>/CYMUXFAST  (
    .IA(\div256/count<2>/CYMUXG2_554 ),
    .IB(\div256/count<2>/FASTCARRY_555 ),
    .SEL(\div256/count<2>/CYAND_556 ),
    .O(\div256/count<2>/CYMUXFAST_557 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X19Y31" ))
  \div256/count<2>/CYMUXG2  (
    .IA(\div256/count<2>/LOGIC_ZERO_552 ),
    .IB(\div256/count<2>/CYMUXF2_553 ),
    .SEL(\div256/count<2>/CYSELG_543 ),
    .O(\div256/count<2>/CYMUXG2_554 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y31" ))
  \div256/count<2>/CYSELG  (
    .I(\div256/count<2>/G ),
    .O(\div256/count<2>/CYSELG_543 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y31" ))
  \div256/count<2>/SRINV  (
    .I(rst_IBUF_407),
    .O(\div256/count<2>/SRINV_541 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y31" ))
  \div256/count<2>/CLKINV  (
    .I(clk_BUFGP),
    .O(\div256/count<2>/CLKINV_540 )
  );
  X_ZERO #(
    .LOC ( "SLICE_X19Y32" ))
  \div256/count<4>/LOGIC_ZERO  (
    .O(\div256/count<4>/LOGIC_ZERO_608 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y32" ))
  \div256/count<4>/DXMUX  (
    .I(\div256/count<4>/XORF_635 ),
    .O(\div256/count<4>/DXMUX_637 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X19Y32" ))
  \div256/count<4>/XORF  (
    .I0(\div256/count<4>/CYINIT_634 ),
    .I1(\div256/count<4>/F ),
    .O(\div256/count<4>/XORF_635 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X19Y32" ))
  \div256/count<4>/CYMUXF  (
    .IA(\div256/count<4>/LOGIC_ZERO_608 ),
    .IB(\div256/count<4>/CYINIT_634 ),
    .SEL(\div256/count<4>/CYSELF_614 ),
    .O(\div256/Mcount_count_cy[4] )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X19Y32" ))
  \div256/count<4>/CYMUXF2  (
    .IA(\div256/count<4>/LOGIC_ZERO_608 ),
    .IB(\div256/count<4>/LOGIC_ZERO_608 ),
    .SEL(\div256/count<4>/CYSELF_614 ),
    .O(\div256/count<4>/CYMUXF2_609 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y32" ))
  \div256/count<4>/CYINIT  (
    .I(\div256/Mcount_count_cy[3] ),
    .O(\div256/count<4>/CYINIT_634 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y32" ))
  \div256/count<4>/CYSELF  (
    .I(\div256/count<4>/F ),
    .O(\div256/count<4>/CYSELF_614 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y32" ))
  \div256/count<4>/DYMUX  (
    .I(\div256/count<4>/XORG_616 ),
    .O(\div256/count<4>/DYMUX_618 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X19Y32" ))
  \div256/count<4>/XORG  (
    .I0(\div256/Mcount_count_cy[4] ),
    .I1(\div256/count<4>/G ),
    .O(\div256/count<4>/XORG_616 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y32" ))
  \div256/count<4>/FASTCARRY  (
    .I(\div256/Mcount_count_cy[3] ),
    .O(\div256/count<4>/FASTCARRY_611 )
  );
  X_AND2 #(
    .LOC ( "SLICE_X19Y32" ))
  \div256/count<4>/CYAND  (
    .I0(\div256/count<4>/CYSELG_599 ),
    .I1(\div256/count<4>/CYSELF_614 ),
    .O(\div256/count<4>/CYAND_612 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X19Y32" ))
  \div256/count<4>/CYMUXFAST  (
    .IA(\div256/count<4>/CYMUXG2_610 ),
    .IB(\div256/count<4>/FASTCARRY_611 ),
    .SEL(\div256/count<4>/CYAND_612 ),
    .O(\div256/count<4>/CYMUXFAST_613 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X19Y32" ))
  \div256/count<4>/CYMUXG2  (
    .IA(\div256/count<4>/LOGIC_ZERO_608 ),
    .IB(\div256/count<4>/CYMUXF2_609 ),
    .SEL(\div256/count<4>/CYSELG_599 ),
    .O(\div256/count<4>/CYMUXG2_610 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y32" ))
  \div256/count<4>/CYSELG  (
    .I(\div256/count<4>/G ),
    .O(\div256/count<4>/CYSELG_599 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y32" ))
  \div256/count<4>/SRINV  (
    .I(rst_IBUF_407),
    .O(\div256/count<4>/SRINV_597 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y32" ))
  \div256/count<4>/CLKINV  (
    .I(clk_BUFGP),
    .O(\div256/count<4>/CLKINV_596 )
  );
  X_ZERO #(
    .LOC ( "SLICE_X19Y33" ))
  \div256/count<6>/LOGIC_ZERO  (
    .O(\div256/count<6>/LOGIC_ZERO_683 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y33" ))
  \div256/count<6>/DXMUX  (
    .I(\div256/count<6>/XORF_684 ),
    .O(\div256/count<6>/DXMUX_686 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X19Y33" ))
  \div256/count<6>/XORF  (
    .I0(\div256/count<6>/CYINIT_682 ),
    .I1(\div256/count<6>/F ),
    .O(\div256/count<6>/XORF_684 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X19Y33" ))
  \div256/count<6>/CYMUXF  (
    .IA(\div256/count<6>/LOGIC_ZERO_683 ),
    .IB(\div256/count<6>/CYINIT_682 ),
    .SEL(\div256/count<6>/CYSELF_673 ),
    .O(\div256/Mcount_count_cy[6] )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y33" ))
  \div256/count<6>/CYINIT  (
    .I(\div256/count<4>/CYMUXFAST_613 ),
    .O(\div256/count<6>/CYINIT_682 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y33" ))
  \div256/count<6>/CYSELF  (
    .I(\div256/count<6>/F ),
    .O(\div256/count<6>/CYSELF_673 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y33" ))
  \div256/count<6>/DYMUX  (
    .I(\div256/count<6>/XORG_663 ),
    .O(\div256/count<6>/DYMUX_665 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X19Y33" ))
  \div256/count<6>/XORG  (
    .I0(\div256/Mcount_count_cy[6] ),
    .I1(\div256/count<7>_rt_660 ),
    .O(\div256/count<6>/XORG_663 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y33" ))
  \div256/count<6>/SRINV  (
    .I(rst_IBUF_407),
    .O(\div256/count<6>/SRINV_652 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y33" ))
  \div256/count<6>/CLKINV  (
    .I(clk_BUFGP),
    .O(\div256/count<6>/CLKINV_651 )
  );
  X_IPAD #(
    .LOC ( "PAD123" ))
  \clk/PAD  (
    .PAD(clk)
  );
  X_BUF #(
    .LOC ( "PAD123" ))
  \clk_BUFGP/IBUFG  (
    .I(clk),
    .O(\clk/INBUF )
  );
  X_OPAD #(
    .LOC ( "PAD22" ))
  \leds_out<0>/PAD  (
    .PAD(leds_out[0])
  );
  X_OBUF #(
    .LOC ( "PAD22" ))
  leds_out_0_OBUF (
    .I(\leds_out<0>/O ),
    .O(leds_out[0])
  );
  X_OPAD #(
    .LOC ( "PAD21" ))
  \leds_out<1>/PAD  (
    .PAD(leds_out[1])
  );
  X_OBUF #(
    .LOC ( "PAD21" ))
  leds_out_1_OBUF (
    .I(\leds_out<1>/O ),
    .O(leds_out[1])
  );
  X_OPAD #(
    .LOC ( "PAD20" ))
  \leds_out<2>/PAD  (
    .PAD(leds_out[2])
  );
  X_OBUF #(
    .LOC ( "PAD20" ))
  leds_out_2_OBUF (
    .I(\leds_out<2>/O ),
    .O(leds_out[2])
  );
  X_OPAD #(
    .LOC ( "PAD19" ))
  \leds_out<3>/PAD  (
    .PAD(leds_out[3])
  );
  X_OBUF #(
    .LOC ( "PAD19" ))
  leds_out_3_OBUF (
    .I(\leds_out<3>/O ),
    .O(leds_out[3])
  );
  X_OPAD #(
    .LOC ( "PAD18" ))
  \leds_out<4>/PAD  (
    .PAD(leds_out[4])
  );
  X_OBUF #(
    .LOC ( "PAD18" ))
  leds_out_4_OBUF (
    .I(\leds_out<4>/O ),
    .O(leds_out[4])
  );
  X_OPAD #(
    .LOC ( "PAD17" ))
  \leds_out<5>/PAD  (
    .PAD(leds_out[5])
  );
  X_OBUF #(
    .LOC ( "PAD17" ))
  leds_out_5_OBUF (
    .I(\leds_out<5>/O ),
    .O(leds_out[5])
  );
  X_OPAD #(
    .LOC ( "PAD15" ))
  \leds_out<6>/PAD  (
    .PAD(leds_out[6])
  );
  X_OBUF #(
    .LOC ( "PAD15" ))
  leds_out_6_OBUF (
    .I(\leds_out<6>/O ),
    .O(leds_out[6])
  );
  X_IPAD #(
    .LOC ( "PAD23" ))
  \pbl/PAD  (
    .PAD(pbl)
  );
  X_BUF #(
    .LOC ( "PAD23" ))
  pbl_IBUF (
    .I(pbl),
    .O(\pbl/INBUF )
  );
  X_IPAD #(
    .LOC ( "PAD24" ))
  \pbr/PAD  (
    .PAD(pbr)
  );
  X_BUF #(
    .LOC ( "PAD24" ))
  pbr_IBUF (
    .I(pbr),
    .O(\pbr/INBUF )
  );
  X_IPAD #(
    .LOC ( "PAD25" ))
  \rst/PAD  (
    .PAD(rst)
  );
  X_BUF #(
    .LOC ( "PAD25" ))
  rst_IBUF (
    .I(rst),
    .O(\rst/INBUF )
  );
  X_BUFGMUX #(
    .LOC ( "BUFGMUX0" ))
  \clk_BUFGP/BUFG  (
    .I0(\clk_BUFGP/BUFG/I0_INV ),
    .I1(GND),
    .S(\clk_BUFGP/BUFG/S_INVNOT ),
    .O(clk_BUFGP)
  );
  X_INV #(
    .LOC ( "BUFGMUX0" ))
  \clk_BUFGP/BUFG/SINV  (
    .I(1'b1),
    .O(\clk_BUFGP/BUFG/S_INVNOT )
  );
  X_BUF #(
    .LOC ( "BUFGMUX0" ))
  \clk_BUFGP/BUFG/I0_USED  (
    .I(\clk/INBUF ),
    .O(\clk_BUFGP/BUFG/I0_INV )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X14Y44" ))
  \leds_out_2_OBUF/F5MUX  (
    .IA(\mc/state_FSM_FFd3_rt_792 ),
    .IB(\ledmux/Mmux_leds_out_reg3 ),
    .SEL(\leds_out_2_OBUF/BXINV_794 ),
    .O(\leds_out_2_OBUF/F5MUX_801 )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y44" ))
  \leds_out_2_OBUF/BXINV  (
    .I(\mc/state_FSM_FFd1_430 ),
    .O(\leds_out_2_OBUF/BXINV_794 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X15Y42" ))
  \leds_out_3_OBUF/F5MUX  (
    .IA(\ledmux/Mmux_leds_out_reg41_816 ),
    .IB(\ledmux/Mmux_leds_out_reg4 ),
    .SEL(\leds_out_3_OBUF/BXINV_818 ),
    .O(\leds_out_3_OBUF/F5MUX_826 )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y42" ))
  \leds_out_3_OBUF/BXINV  (
    .I(\mc/state_FSM_FFd1_430 ),
    .O(\leds_out_3_OBUF/BXINV_818 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X15Y45" ))
  \leds_out_5_OBUF/F5MUX  (
    .IA(\ledmux/Mmux_leds_out_reg61_842 ),
    .IB(\ledmux/Mmux_leds_out_reg6 ),
    .SEL(\leds_out_5_OBUF/BXINV_844 ),
    .O(\leds_out_5_OBUF/F5MUX_851 )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y45" ))
  \leds_out_5_OBUF/BXINV  (
    .I(\scorer/state_FSM_FFd4_431 ),
    .O(\leds_out_5_OBUF/BXINV_844 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y38" ))
  \N42/XUSED  (
    .I(\N42/F5MUX_876 ),
    .O(N42)
  );
  X_MUX2 #(
    .LOC ( "SLICE_X17Y38" ))
  \N42/F5MUX  (
    .IA(N50),
    .IB(N51),
    .SEL(\N42/BXINV_869 ),
    .O(\N42/F5MUX_876 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y38" ))
  \N42/BXINV  (
    .I(N33_0),
    .O(\N42/BXINV_869 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y38" ))
  \N43/XUSED  (
    .I(\N43/F5MUX_901 ),
    .O(N43)
  );
  X_MUX2 #(
    .LOC ( "SLICE_X16Y38" ))
  \N43/F5MUX  (
    .IA(N52),
    .IB(N53),
    .SEL(\N43/BXINV_894 ),
    .O(\N43/F5MUX_901 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y38" ))
  \N43/BXINV  (
    .I(N33_0),
    .O(\N43/BXINV_894 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y33" ))
  \N56/XUSED  (
    .I(\N56/F5MUX_926 ),
    .O(N56)
  );
  X_MUX2 #(
    .LOC ( "SLICE_X17Y33" ))
  \N56/F5MUX  (
    .IA(N58),
    .IB(N59),
    .SEL(\N56/BXINV_919 ),
    .O(\N56/F5MUX_926 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y33" ))
  \N56/BXINV  (
    .I(\mc/state_FSM_FFd3_435 ),
    .O(\N56/BXINV_919 )
  );
  X_LUT4 #(
    .INIT ( 16'hF0F8 ),
    .LOC ( "SLICE_X16Y45" ))
  \ledmux/Mmux_leds_out_reg21  (
    .ADR0(\scorer/state_FSM_FFd4_431 ),
    .ADR1(\scorer/state_FSM_FFd2_433 ),
    .ADR2(\scorer/state_FSM_FFd1_434 ),
    .ADR3(\scorer/state_FSM_FFd3_432 ),
    .O(\ledmux/Mmux_leds_out_reg2 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X16Y45" ))
  \leds_out_1_OBUF/F5MUX  (
    .IA(\leds_out_1_OBUF/G ),
    .IB(\ledmux/Mmux_leds_out_reg2 ),
    .SEL(\leds_out_1_OBUF/BXINV_944 ),
    .O(\leds_out_1_OBUF/F5MUX_951 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y45" ))
  \leds_out_1_OBUF/BXINV  (
    .I(\mc/state_FSM_FFd1_430 ),
    .O(\leds_out_1_OBUF/BXINV_944 )
  );
  X_LUT4 #(
    .INIT ( 16'hC4D4 ),
    .LOC ( "SLICE_X16Y36" ))
  \scorer/state_FSM_FFd2-In_SW0  (
    .ADR0(\scorer/state_FSM_FFd4_431 ),
    .ADR1(\scorer/state_FSM_FFd3_432 ),
    .ADR2(\scorer/state_FSM_FFd2_433 ),
    .ADR3(N9),
    .O(N33)
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y36" ))
  \N33/XUSED  (
    .I(N33),
    .O(N33_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y36" ))
  \N33/YUSED  (
    .I(N9_pack_1),
    .O(N9)
  );
  X_LUT4 #(
    .INIT ( 16'hFBFB ),
    .LOC ( "SLICE_X16Y36" ))
  \scorer/mr11  (
    .ADR0(\mc/state_FSM_FFd1_430 ),
    .ADR1(\mc/state_FSM_FFd2_436 ),
    .ADR2(\mc/state_FSM_FFd3_435 ),
    .ADR3(VCC),
    .O(N9_pack_1)
  );
  X_LUT4 #(
    .INIT ( 16'hA521 ),
    .LOC ( "SLICE_X16Y35" ))
  \scorer/state_FSM_FFd4-In111  (
    .ADR0(N36),
    .ADR1(\scorer/state_FSM_FFd1_434 ),
    .ADR2(right),
    .ADR3(\scorer/state_FSM_FFd4_431 ),
    .O(\scorer/state_FSM_FFd4-In111_998 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y35" ))
  \scorer/state_FSM_FFd4-In111/XUSED  (
    .I(\scorer/state_FSM_FFd4-In111_998 ),
    .O(\scorer/state_FSM_FFd4-In111_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y35" ))
  \scorer/state_FSM_FFd4-In111/YUSED  (
    .I(N36_pack_1),
    .O(N36)
  );
  X_LUT4 #(
    .INIT ( 16'h0030 ),
    .LOC ( "SLICE_X16Y35" ))
  \scorer/mr1_SW0  (
    .ADR0(VCC),
    .ADR1(\mc/state_FSM_FFd3_435 ),
    .ADR2(\mc/state_FSM_FFd2_436 ),
    .ADR3(\mc/state_FSM_FFd1_430 ),
    .O(N36_pack_1)
  );
  X_LUT4 #(
    .INIT ( 16'h1050 ),
    .LOC ( "SLICE_X17Y37" ))
  \scorer/state_and00001  (
    .ADR0(\opp/regwinrnd_442 ),
    .ADR1(right),
    .ADR2(\sync/regsyspush_441 ),
    .ADR3(\pushbuttonlatch/ql ),
    .O(\scorer/state_and0000 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y37" ))
  \scorer/state_and0000/XUSED  (
    .I(\scorer/state_and0000 ),
    .O(\scorer/state_and0000_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y37" ))
  \scorer/state_and0000/YUSED  (
    .I(\pushbuttonlatch/ql_pack_3 ),
    .O(\pushbuttonlatch/ql )
  );
  X_LUT4 #(
    .INIT ( 16'hF020 ),
    .LOC ( "SLICE_X17Y37" ))
  \pushbuttonlatch/latchL/q1  (
    .ADR0(pbl_IBUF_427),
    .ADR1(right),
    .ADR2(N23),
    .ADR3(\pushbuttonlatch/ql ),
    .O(\pushbuttonlatch/ql_pack_3 )
  );
  X_LUT4 #(
    .INIT ( 16'hC0E0 ),
    .LOC ( "SLICE_X17Y36" ))
  \pushbuttonlatch/latchR/q1  (
    .ADR0(pbr_IBUF_428),
    .ADR1(right),
    .ADR2(N23),
    .ADR3(\pushbuttonlatch/ql ),
    .O(right_pack_1)
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y36" ))
  \right/XUSED  (
    .I(right_pack_1),
    .O(right)
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y36" ))
  \right/YUSED  (
    .I(N23_pack_2),
    .O(N23)
  );
  X_LUT4 #(
    .INIT ( 16'h2002 ),
    .LOC ( "SLICE_X17Y36" ))
  \pushbuttonlatch/latchL/q31  (
    .ADR0(\mc/state_FSM_FFd2_436 ),
    .ADR1(rst_IBUF_407),
    .ADR2(\mc/state_FSM_FFd3_1_452 ),
    .ADR3(\mc/state_FSM_FFd1_430 ),
    .O(N23_pack_2)
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y33" ))
  \mc/state_FSM_FFd3_1/FFX/RSTOR  (
    .I(rst_IBUF_407),
    .O(\mc/state_FSM_FFd3_1/FFX/RST )
  );
  X_FF #(
    .LOC ( "SLICE_X16Y33" ),
    .INIT ( 1'b0 ))
  \mc/state_FSM_FFd3_1  (
    .I(\mc/state_FSM_FFd3_1/DXMUX_1078 ),
    .CE(VCC),
    .CLK(\mc/state_FSM_FFd3_1/CLKINV_1062 ),
    .SET(GND),
    .RST(\mc/state_FSM_FFd3_1/FFX/RST ),
    .O(\mc/state_FSM_FFd3_1_452 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y33" ))
  \mc/state_FSM_FFd3_1/DXMUX  (
    .I(\mc/state_FSM_FFd3_1/FXMUX_1077 ),
    .O(\mc/state_FSM_FFd3_1/DXMUX_1078 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y33" ))
  \mc/state_FSM_FFd3_1/FXMUX  (
    .I(\mc/state_FSM_FFd3-In ),
    .O(\mc/state_FSM_FFd3_1/FXMUX_1077 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y33" ))
  \mc/state_FSM_FFd3_1/YUSED  (
    .I(\div256/slowenable4_pack_1 ),
    .O(\div256/slowenable4_453 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y33" ))
  \mc/state_FSM_FFd3_1/CLKINV  (
    .I(clk_BUFGP),
    .O(\mc/state_FSM_FFd3_1/CLKINV_1062 )
  );
  X_LUT4 #(
    .INIT ( 16'hEF4F ),
    .LOC ( "SLICE_X16Y32" ))
  \mc/state_FSM_FFd3-In74_SW0  (
    .ADR0(\mc/state_FSM_FFd1_430 ),
    .ADR1(\mc/state_FSM_FFd3_435 ),
    .ADR2(\mc/state_FSM_FFd2_436 ),
    .ADR3(\mc/state_FSM_FFd3-In6/O ),
    .O(N47)
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y32" ))
  \N47/XUSED  (
    .I(N47),
    .O(N47_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y32" ))
  \N47/YUSED  (
    .I(\mc/state_FSM_FFd3-In6/O_pack_2 ),
    .O(\mc/state_FSM_FFd3-In6/O )
  );
  X_LUT4 #(
    .INIT ( 16'hDD00 ),
    .LOC ( "SLICE_X16Y32" ))
  \mc/state_FSM_FFd3-In6  (
    .ADR0(\sync/regsyspush_441 ),
    .ADR1(\opp/regwinrnd_442 ),
    .ADR2(VCC),
    .ADR3(\mc/state_FSM_FFd3_435 ),
    .O(\mc/state_FSM_FFd3-In6/O_pack_2 )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y36" ))
  \scorer/state_FSM_FFd3/FFX/RSTOR  (
    .I(rst_IBUF_407),
    .O(\scorer/state_FSM_FFd3/FFX/RST )
  );
  X_FF #(
    .LOC ( "SLICE_X15Y36" ),
    .INIT ( 1'b0 ))
  \scorer/state_FSM_FFd3  (
    .I(\scorer/state_FSM_FFd3/DXMUX_1139 ),
    .CE(\scorer/state_FSM_FFd3/CEINV_1122 ),
    .CLK(\scorer/state_FSM_FFd3/CLKINV_1123 ),
    .SET(GND),
    .RST(\scorer/state_FSM_FFd3/FFX/RST ),
    .O(\scorer/state_FSM_FFd3_432 )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y36" ))
  \scorer/state_FSM_FFd3/DXMUX  (
    .I(\scorer/state_FSM_FFd3-In ),
    .O(\scorer/state_FSM_FFd3/DXMUX_1139 )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y36" ))
  \scorer/state_FSM_FFd3/YUSED  (
    .I(\scorer/mr1/O_pack_2 ),
    .O(\scorer/mr1/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y36" ))
  \scorer/state_FSM_FFd3/CLKINV  (
    .I(clk_BUFGP),
    .O(\scorer/state_FSM_FFd3/CLKINV_1123 )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y36" ))
  \scorer/state_FSM_FFd3/CEINV  (
    .I(\scorer/state_and0000_0 ),
    .O(\scorer/state_FSM_FFd3/CEINV_1122 )
  );
  X_LUT4 #(
    .INIT ( 16'hFAD8 ),
    .LOC ( "SLICE_X16Y34" ))
  \scorer/state_FSM_FFd4-In61  (
    .ADR0(\scorer/state_FSM_FFd2_433 ),
    .ADR1(\scorer/state_FSM_FFd4-In111_0 ),
    .ADR2(\scorer/state_FSM_FFd4-In43/O ),
    .ADR3(\scorer/state_FSM_FFd4-In5_0 ),
    .O(\scorer/state_FSM_FFd4-In )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y34" ))
  \scorer/state_FSM_FFd4/FFX/RSTOR  (
    .I(rst_IBUF_407),
    .O(\scorer/state_FSM_FFd4/FFX/RST )
  );
  X_FF #(
    .LOC ( "SLICE_X16Y34" ),
    .INIT ( 1'b0 ))
  \scorer/state_FSM_FFd4  (
    .I(\scorer/state_FSM_FFd4/DXMUX_1177 ),
    .CE(\scorer/state_FSM_FFd4/CEINV_1160 ),
    .CLK(\scorer/state_FSM_FFd4/CLKINV_1161 ),
    .SET(GND),
    .RST(\scorer/state_FSM_FFd4/FFX/RST ),
    .O(\scorer/state_FSM_FFd4_431 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y34" ))
  \scorer/state_FSM_FFd4/DXMUX  (
    .I(\scorer/state_FSM_FFd4-In ),
    .O(\scorer/state_FSM_FFd4/DXMUX_1177 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y34" ))
  \scorer/state_FSM_FFd4/YUSED  (
    .I(\scorer/state_FSM_FFd4-In43/O_pack_2 ),
    .O(\scorer/state_FSM_FFd4-In43/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y34" ))
  \scorer/state_FSM_FFd4/CLKINV  (
    .I(clk_BUFGP),
    .O(\scorer/state_FSM_FFd4/CLKINV_1161 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y34" ))
  \scorer/state_FSM_FFd4/CEINV  (
    .I(\scorer/state_and0000_0 ),
    .O(\scorer/state_FSM_FFd4/CEINV_1160 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y37" ))
  \mc/state_FSM_FFd1/DXMUX  (
    .I(\mc/state_FSM_FFd1-In ),
    .O(\mc/state_FSM_FFd1/DXMUX_1213 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y37" ))
  \mc/state_FSM_FFd1/YUSED  (
    .I(\mc/state_FSM_FFd1-In7/O_pack_2 ),
    .O(\mc/state_FSM_FFd1-In7/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y37" ))
  \mc/state_FSM_FFd1/CLKINV  (
    .I(clk_BUFGP),
    .O(\mc/state_FSM_FFd1/CLKINV_1197 )
  );
  X_LUT4 #(
    .INIT ( 16'hF7FF ),
    .LOC ( "SLICE_X18Y37" ))
  \mc/state_FSM_FFd1-In7  (
    .ADR0(\div256/slowenable4_453 ),
    .ADR1(\div256/slowenable9_0 ),
    .ADR2(\mc/state_FSM_FFd2_436 ),
    .ADR3(\mc/state_FSM_FFd3_435 ),
    .O(\mc/state_FSM_FFd1-In7/O_pack_2 )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y39" ))
  \random/lfsr_31/DYMUX  (
    .I(\random/Mshreg_lfsr_3 ),
    .O(\random/lfsr_31/DYMUX_1245 )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y39" ))
  \random/lfsr_31/DIG_MUX  (
    .I(\random/lfsr[9] ),
    .O(\random/lfsr_31/DIG_MUX_1234 )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y39" ))
  \random/lfsr_31/SRINV  (
    .I(1'b1),
    .O(\random/lfsr_31/SRINV_1228 )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y39" ))
  \random/lfsr_31/CLKINV  (
    .I(slowenable),
    .O(\random/lfsr_31/CLKINV_1232 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y37" ))
  \mc/state_FSM_FFd2/XUSED  (
    .I(\mc/state_FSM_FFd1-In23_1281 ),
    .O(\mc/state_FSM_FFd1-In23_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y37" ))
  \mc/state_FSM_FFd2/DYMUX  (
    .I(\mc/state_FSM_FFd2-In ),
    .O(\mc/state_FSM_FFd2/DYMUX_1268 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y37" ))
  \mc/state_FSM_FFd2/CLKINV  (
    .I(clk_BUFGP),
    .O(\mc/state_FSM_FFd2/CLKINV_1259 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y39" ))
  \scorer/state_FSM_FFd2/DXMUX  (
    .I(\scorer/state_FSM_FFd2-In_1319 ),
    .O(\scorer/state_FSM_FFd2/DXMUX_1322 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y39" ))
  \scorer/state_FSM_FFd2/DYMUX  (
    .I(\scorer/state_FSM_FFd1-In ),
    .O(\scorer/state_FSM_FFd2/DYMUX_1307 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y39" ))
  \scorer/state_FSM_FFd2/SRINV  (
    .I(rst_IBUF_407),
    .O(\scorer/state_FSM_FFd2/SRINV_1299 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y39" ))
  \scorer/state_FSM_FFd2/CLKINV  (
    .I(clk_BUFGP),
    .O(\scorer/state_FSM_FFd2/CLKINV_1298 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y39" ))
  \scorer/state_FSM_FFd2/CEINV  (
    .I(\scorer/state_and0000_0 ),
    .O(\scorer/state_FSM_FFd2/CEINV_1297 )
  );
  X_LUT4 #(
    .INIT ( 16'hEEEE ),
    .LOC ( "SLICE_X17Y35" ))
  \pushbuttonlatch/push1  (
    .ADR0(\pushbuttonlatch/ql ),
    .ADR1(right),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(push)
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y35" ))
  \sync/regsyspush/XUSED  (
    .I(\scorer/state_FSM_FFd4-In5_1362 ),
    .O(\scorer/state_FSM_FFd4-In5_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y35" ))
  \sync/regsyspush/DYMUX  (
    .I(push),
    .O(\sync/regsyspush/DYMUX_1351 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y35" ))
  \sync/regsyspush/CLKINV  (
    .I(clk_BUFGP),
    .O(\sync/regsyspush/CLKINV_1340 )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y38" ))
  \random/lfsr<9>/DYMUX  (
    .I(\random/lfsr_9_xor0000 ),
    .O(\random/lfsr<9>/DYMUX_1381 )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y38" ))
  \random/lfsr<9>/CLKINV  (
    .I(slowenable),
    .O(\random/lfsr<9>/CLKINV_1370 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y38" ))
  \rst_IBUF_shift2/DXMUX  (
    .I(rst_IBUF_shift1_470),
    .O(\rst_IBUF_shift2/DXMUX_1405 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y38" ))
  \rst_IBUF_shift2/DYMUX  (
    .I(\rst_IBUF_shift2/BYINV_1396 ),
    .O(\rst_IBUF_shift2/DYMUX_1397 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y38" ))
  \rst_IBUF_shift2/BYINV  (
    .I(1'b1),
    .O(\rst_IBUF_shift2/BYINV_1396 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y38" ))
  \rst_IBUF_shift2/SRINV  (
    .I(rst_IBUF_407),
    .O(\rst_IBUF_shift2/SRINV_1395 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y38" ))
  \rst_IBUF_shift2/CLKINV  (
    .I(slowenable),
    .O(\rst_IBUF_shift2/CLKINV_1394 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y39" ))
  \rst_IBUF_shift4/DXMUX  (
    .I(rst_IBUF_shift3_472),
    .O(\rst_IBUF_shift4/DXMUX_1429 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y39" ))
  \rst_IBUF_shift4/DYMUX  (
    .I(rst_IBUF_shift2_471),
    .O(\rst_IBUF_shift4/DYMUX_1421 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y39" ))
  \rst_IBUF_shift4/SRINV  (
    .I(rst_IBUF_407),
    .O(\rst_IBUF_shift4/SRINV_1419 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y39" ))
  \rst_IBUF_shift4/CLKINV  (
    .I(slowenable),
    .O(\rst_IBUF_shift4/CLKINV_1418 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y39" ))
  \rst_IBUF_shift5/DYMUX  (
    .I(rst_IBUF_shift4_473),
    .O(\rst_IBUF_shift5/DYMUX_1443 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y39" ))
  \rst_IBUF_shift5/CLKINV  (
    .I(slowenable),
    .O(\rst_IBUF_shift5/CLKINV_1440 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y40" ))
  \N24/XUSED  (
    .I(N24),
    .O(N24_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y40" ))
  \N24/YUSED  (
    .I(N34),
    .O(N34_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y30" ))
  \div256/slowenable9/XUSED  (
    .I(\div256/slowenable9_1483 ),
    .O(\div256/slowenable9_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y33" ))
  \opp/regwinrnd/DYMUX  (
    .I(\sync/regsyspush_441 ),
    .O(\opp/regwinrnd/DYMUX_1517 )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y33" ))
  \opp/regwinrnd/CLKINV  (
    .I(clk_BUFGP),
    .O(\opp/regwinrnd/CLKINV_1514 )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y42" ))
  \leds_out_6_OBUF/YUSED  (
    .I(N18_pack_2),
    .O(N18)
  );
  X_LUT4 #(
    .INIT ( 16'h3311 ),
    .LOC ( "SLICE_X14Y42" ))
  \ledmux/Mmux_leds_out_reg411  (
    .ADR0(\mc/state_FSM_FFd2_436 ),
    .ADR1(\mc/state_FSM_FFd1_430 ),
    .ADR2(VCC),
    .ADR3(\mc/state_FSM_FFd3_435 ),
    .O(N18_pack_2)
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y32" ))
  \mc/state_FSM_FFd3/DYMUX  (
    .I(\mc/state_FSM_FFd3_1/FXMUX_1077 ),
    .O(\mc/state_FSM_FFd3/DYMUX_1554 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y32" ))
  \mc/state_FSM_FFd3/CLKINV  (
    .I(clk_BUFGP),
    .O(\mc/state_FSM_FFd3/CLKINV_1551 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y34" ))
  \mc/state_FSM_FFd3-In29/XUSED  (
    .I(\mc/state_FSM_FFd3-In29_1570 ),
    .O(\mc/state_FSM_FFd3-In29_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y36" ))
  \mc/state_FSM_FFd1-In20/XUSED  (
    .I(\mc/state_FSM_FFd1-In20_1594 ),
    .O(\mc/state_FSM_FFd1-In20_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y36" ))
  \mc/state_FSM_FFd1-In20/YUSED  (
    .I(slowenable_pack_1),
    .O(slowenable)
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y39" ))
  \random/lfsr<1>/DXMUX  (
    .I(\random/lfsr[2] ),
    .O(\random/lfsr<1>/DXMUX_1613 )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y39" ))
  \random/lfsr<1>/DYMUX  (
    .I(\random/lfsr[1] ),
    .O(\random/lfsr<1>/DYMUX_1606 )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y39" ))
  \random/lfsr<1>/SRINV  (
    .I(rst_IBUF_407),
    .O(\random/lfsr<1>/SRINV_1604 )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y39" ))
  \random/lfsr<1>/CLKINV  (
    .I(slowenable),
    .O(\random/lfsr<1>/CLKINV_1603 )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y38" ))
  \random/lfsr<2>/DXMUX  (
    .I(\random/lfsr[3] ),
    .O(\random/lfsr<2>/DXMUX_1646 )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y38" ))
  \random/lfsr<2>/DYMUX  (
    .I(\random/lfsr_311_1635 ),
    .O(\random/lfsr<2>/DYMUX_1638 )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y38" ))
  \random/lfsr<2>/SRINV  (
    .I(rst_IBUF_407),
    .O(\random/lfsr<2>/SRINV_1628 )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y38" ))
  \random/lfsr<2>/CLKINV  (
    .I(slowenable),
    .O(\random/lfsr<2>/CLKINV_1627 )
  );
  X_FF #(
    .LOC ( "SLICE_X14Y38" ),
    .INIT ( 1'b0 ))
  \random/lfsr_2  (
    .I(\random/lfsr<2>/DXMUX_1646 ),
    .CE(VCC),
    .CLK(\random/lfsr<2>/CLKINV_1627 ),
    .SET(GND),
    .RST(\random/lfsr<2>/SRINV_1628 ),
    .O(\random/lfsr[2] )
  );
  X_LUT4 #(
    .INIT ( 16'h41D7 ),
    .LOC ( "SLICE_X16Y34" ))
  \scorer/state_FSM_FFd4-In43  (
    .ADR0(\scorer/state_FSM_FFd3_432 ),
    .ADR1(N9),
    .ADR2(right),
    .ADR3(\scorer/state_FSM_FFd4_431 ),
    .O(\scorer/state_FSM_FFd4-In43/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hCC4D ),
    .LOC ( "SLICE_X15Y36" ))
  \scorer/state_FSM_FFd3-In1  (
    .ADR0(\scorer/state_FSM_FFd4_431 ),
    .ADR1(\scorer/state_FSM_FFd3_432 ),
    .ADR2(\scorer/mr1/O ),
    .ADR3(\scorer/state_FSM_FFd2_433 ),
    .O(\scorer/state_FSM_FFd3-In )
  );
  X_LUT4 #(
    .INIT ( 16'hEF10 ),
    .LOC ( "SLICE_X15Y36" ))
  \scorer/mr1  (
    .ADR0(\mc/state_FSM_FFd1_430 ),
    .ADR1(\mc/state_FSM_FFd3_435 ),
    .ADR2(\mc/state_FSM_FFd2_436 ),
    .ADR3(right),
    .O(\scorer/mr1/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hEA2A ),
    .LOC ( "SLICE_X16Y33" ))
  \mc/state_FSM_FFd3-In74  (
    .ADR0(N47_0),
    .ADR1(\div256/slowenable9_0 ),
    .ADR2(\div256/slowenable4_453 ),
    .ADR3(N56),
    .O(\mc/state_FSM_FFd3-In )
  );
  X_LUT4 #(
    .INIT ( 16'h8000 ),
    .LOC ( "SLICE_X16Y33" ))
  \div256/slowenable4  (
    .ADR0(\div256/count [7]),
    .ADR1(\div256/count [4]),
    .ADR2(\div256/count [6]),
    .ADR3(\div256/count [5]),
    .O(\div256/slowenable4_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'hFF00 ),
    .LOC ( "SLICE_X16Y45" ))
  \mc/state_FSM_FFd3_rt.1  (
    .ADR0(VCC),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(\mc/state_FSM_FFd3_435 ),
    .O(\leds_out_1_OBUF/G )
  );
  X_LUT4 #(
    .INIT ( 16'hF7CA ),
    .LOC ( "SLICE_X16Y37" ))
  \mc/state_FSM_FFd2-In1  (
    .ADR0(\mc/state_FSM_FFd1_430 ),
    .ADR1(slowenable),
    .ADR2(\mc/state_FSM_FFd3_435 ),
    .ADR3(\mc/state_FSM_FFd2_436 ),
    .O(\mc/state_FSM_FFd2-In )
  );
  X_FF #(
    .LOC ( "SLICE_X19Y30" ),
    .INIT ( 1'b0 ))
  \div256/count_1  (
    .I(\div256/count<0>/DYMUX_503 ),
    .CE(VCC),
    .CLK(\div256/count<0>/CLKINV_486 ),
    .SET(GND),
    .RST(\div256/count<0>/SRINV_487 ),
    .O(\div256/count [1])
  );
  X_LUT4 #(
    .INIT ( 16'h5555 ),
    .LOC ( "SLICE_X19Y30" ))
  \div256/Mcount_count_lut<0>_INV_0  (
    .ADR0(\div256/count [0]),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(\div256/Mcount_count_lut [0])
  );
  X_FF #(
    .LOC ( "SLICE_X19Y30" ),
    .INIT ( 1'b0 ))
  \div256/count_0  (
    .I(\div256/count<0>/DXMUX_525 ),
    .CE(VCC),
    .CLK(\div256/count<0>/CLKINV_486 ),
    .SET(GND),
    .RST(\div256/count<0>/SRINV_487 ),
    .O(\div256/count [0])
  );
  X_FF #(
    .LOC ( "SLICE_X19Y31" ),
    .INIT ( 1'b0 ))
  \div256/count_3  (
    .I(\div256/count<2>/DYMUX_562 ),
    .CE(VCC),
    .CLK(\div256/count<2>/CLKINV_540 ),
    .SET(GND),
    .RST(\div256/count<2>/SRINV_541 ),
    .O(\div256/count [3])
  );
  X_FF #(
    .LOC ( "SLICE_X19Y31" ),
    .INIT ( 1'b0 ))
  \div256/count_2  (
    .I(\div256/count<2>/DXMUX_581 ),
    .CE(VCC),
    .CLK(\div256/count<2>/CLKINV_540 ),
    .SET(GND),
    .RST(\div256/count<2>/SRINV_541 ),
    .O(\div256/count [2])
  );
  X_FF #(
    .LOC ( "SLICE_X19Y32" ),
    .INIT ( 1'b0 ))
  \div256/count_5  (
    .I(\div256/count<4>/DYMUX_618 ),
    .CE(VCC),
    .CLK(\div256/count<4>/CLKINV_596 ),
    .SET(GND),
    .RST(\div256/count<4>/SRINV_597 ),
    .O(\div256/count [5])
  );
  X_FF #(
    .LOC ( "SLICE_X19Y32" ),
    .INIT ( 1'b0 ))
  \div256/count_4  (
    .I(\div256/count<4>/DXMUX_637 ),
    .CE(VCC),
    .CLK(\div256/count<4>/CLKINV_596 ),
    .SET(GND),
    .RST(\div256/count<4>/SRINV_597 ),
    .O(\div256/count [4])
  );
  X_LUT4 #(
    .INIT ( 16'hAAAA ),
    .LOC ( "SLICE_X19Y33" ))
  \div256/count<7>_rt  (
    .ADR0(\div256/count [7]),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(\div256/count<7>_rt_660 )
  );
  X_FF #(
    .LOC ( "SLICE_X19Y33" ),
    .INIT ( 1'b0 ))
  \div256/count_7  (
    .I(\div256/count<6>/DYMUX_665 ),
    .CE(VCC),
    .CLK(\div256/count<6>/CLKINV_651 ),
    .SET(GND),
    .RST(\div256/count<6>/SRINV_652 ),
    .O(\div256/count [7])
  );
  X_FF #(
    .LOC ( "SLICE_X19Y33" ),
    .INIT ( 1'b0 ))
  \div256/count_6  (
    .I(\div256/count<6>/DXMUX_686 ),
    .CE(VCC),
    .CLK(\div256/count<6>/CLKINV_651 ),
    .SET(GND),
    .RST(\div256/count<6>/SRINV_652 ),
    .O(\div256/count [6])
  );
  X_BUF #(
    .LOC ( "PAD23" ))
  \pbl/IFF/IMUX  (
    .I(\pbl/INBUF ),
    .O(pbl_IBUF_427)
  );
  X_BUF #(
    .LOC ( "PAD24" ))
  \pbr/IFF/IMUX  (
    .I(\pbr/INBUF ),
    .O(pbr_IBUF_428)
  );
  X_BUF #(
    .LOC ( "PAD25" ))
  \rst/IFF/IMUX  (
    .I(\rst/INBUF ),
    .O(rst_IBUF_407)
  );
  X_LUT4 #(
    .INIT ( 16'hFF00 ),
    .LOC ( "SLICE_X14Y44" ))
  \mc/state_FSM_FFd3_rt  (
    .ADR0(VCC),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(\mc/state_FSM_FFd3_435 ),
    .O(\mc/state_FSM_FFd3_rt_792 )
  );
  X_LUT4 #(
    .INIT ( 16'hF0F2 ),
    .LOC ( "SLICE_X14Y44" ))
  \ledmux/Mmux_leds_out_reg31  (
    .ADR0(\scorer/state_FSM_FFd4_431 ),
    .ADR1(\scorer/state_FSM_FFd2_433 ),
    .ADR2(\scorer/state_FSM_FFd1_434 ),
    .ADR3(\scorer/state_FSM_FFd3_432 ),
    .O(\ledmux/Mmux_leds_out_reg3 )
  );
  X_LUT4 #(
    .INIT ( 16'hFF55 ),
    .LOC ( "SLICE_X15Y42" ))
  \ledmux/Mmux_leds_out_reg42  (
    .ADR0(\mc/state_FSM_FFd2_436 ),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(\mc/state_FSM_FFd3_435 ),
    .O(\ledmux/Mmux_leds_out_reg41_816 )
  );
  X_LUT4 #(
    .INIT ( 16'h0101 ),
    .LOC ( "SLICE_X15Y42" ))
  \ledmux/Mmux_leds_out_reg41  (
    .ADR0(\scorer/state_FSM_FFd3_432 ),
    .ADR1(\scorer/state_FSM_FFd2_433 ),
    .ADR2(\scorer/state_FSM_FFd4_431 ),
    .ADR3(VCC),
    .O(\ledmux/Mmux_leds_out_reg4 )
  );
  X_LUT4 #(
    .INIT ( 16'h0CAA ),
    .LOC ( "SLICE_X15Y45" ))
  \ledmux/Mmux_leds_out_reg62  (
    .ADR0(\mc/state_FSM_FFd3_435 ),
    .ADR1(\scorer/state_FSM_FFd3_432 ),
    .ADR2(\scorer/state_FSM_FFd2_433 ),
    .ADR3(\mc/state_FSM_FFd1_430 ),
    .O(\ledmux/Mmux_leds_out_reg61_842 )
  );
  X_LUT4 #(
    .INIT ( 16'hC0AA ),
    .LOC ( "SLICE_X15Y45" ))
  \ledmux/Mmux_leds_out_reg61  (
    .ADR0(\mc/state_FSM_FFd3_435 ),
    .ADR1(\scorer/state_FSM_FFd3_432 ),
    .ADR2(\scorer/state_FSM_FFd2_433 ),
    .ADR3(\mc/state_FSM_FFd1_430 ),
    .O(\ledmux/Mmux_leds_out_reg6 )
  );
  X_LUT4 #(
    .INIT ( 16'h0200 ),
    .LOC ( "SLICE_X17Y38" ))
  \scorer/mr1_SW3_F  (
    .ADR0(N34_0),
    .ADR1(\mc/state_FSM_FFd3_435 ),
    .ADR2(\mc/state_FSM_FFd1_430 ),
    .ADR3(\mc/state_FSM_FFd2_436 ),
    .O(N50)
  );
  X_LUT4 #(
    .INIT ( 16'hFEFF ),
    .LOC ( "SLICE_X17Y38" ))
  \scorer/mr1_SW3_G  (
    .ADR0(\mc/state_FSM_FFd3_435 ),
    .ADR1(\mc/state_FSM_FFd1_430 ),
    .ADR2(N34_0),
    .ADR3(\mc/state_FSM_FFd2_436 ),
    .O(N51)
  );
  X_LUT4 #(
    .INIT ( 16'hCCC4 ),
    .LOC ( "SLICE_X16Y38" ))
  \scorer/mr1_SW4_F  (
    .ADR0(\mc/state_FSM_FFd2_436 ),
    .ADR1(N34_0),
    .ADR2(\mc/state_FSM_FFd1_430 ),
    .ADR3(\mc/state_FSM_FFd3_435 ),
    .O(N52)
  );
  X_LUT4 #(
    .INIT ( 16'hCCCE ),
    .LOC ( "SLICE_X16Y38" ))
  \scorer/mr1_SW4_G  (
    .ADR0(\mc/state_FSM_FFd2_436 ),
    .ADR1(N34_0),
    .ADR2(\mc/state_FSM_FFd1_430 ),
    .ADR3(\mc/state_FSM_FFd3_435 ),
    .O(N53)
  );
  X_LUT4 #(
    .INIT ( 16'hFFBB ),
    .LOC ( "SLICE_X17Y33" ))
  \mc/state_FSM_FFd3-In74_SW2_F  (
    .ADR0(\mc/state_FSM_FFd3-In29_0 ),
    .ADR1(\mc/state_FSM_FFd2_436 ),
    .ADR2(VCC),
    .ADR3(\mc/state_FSM_FFd1_430 ),
    .O(N58)
  );
  X_LUT4 #(
    .INIT ( 16'h8C33 ),
    .LOC ( "SLICE_X17Y33" ))
  \mc/state_FSM_FFd3-In74_SW2_G  (
    .ADR0(\opp/regwinrnd_442 ),
    .ADR1(\mc/state_FSM_FFd2_436 ),
    .ADR2(\sync/regsyspush_441 ),
    .ADR3(\mc/state_FSM_FFd1_430 ),
    .O(N59)
  );
  X_LUT4 #(
    .INIT ( 16'hF888 ),
    .LOC ( "SLICE_X18Y37" ))
  \mc/state_FSM_FFd1-In33  (
    .ADR0(\mc/state_FSM_FFd1-In20_0 ),
    .ADR1(\mc/state_FSM_FFd1-In23_0 ),
    .ADR2(\mc/state_FSM_FFd1-In7/O ),
    .ADR3(\mc/state_FSM_FFd1_430 ),
    .O(\mc/state_FSM_FFd1-In )
  );
  X_FF #(
    .LOC ( "SLICE_X18Y37" ),
    .INIT ( 1'b0 ))
  \mc/state_FSM_FFd1  (
    .I(\mc/state_FSM_FFd1/DXMUX_1213 ),
    .CE(VCC),
    .CLK(\mc/state_FSM_FFd1/CLKINV_1197 ),
    .SET(GND),
    .RST(\mc/state_FSM_FFd1/FFX/RSTAND_1218 ),
    .O(\mc/state_FSM_FFd1_430 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y37" ))
  \mc/state_FSM_FFd1/FFX/RSTAND  (
    .I(rst_IBUF_407),
    .O(\mc/state_FSM_FFd1/FFX/RSTAND_1218 )
  );
  X_SRLC16E #(
    .INIT ( 16'h0000 ),
    .LOC ( "SLICE_X14Y39" ))
  \random/Mshreg_lfsr_3/SRL16E  (
    .A0(VCC),
    .A1(VCC),
    .A2(GND),
    .A3(GND),
    .D(\random/lfsr_31/DIG_MUX_1234 ),
    .CE(\random/lfsr_31/WSG ),
    .CLK(\random/lfsr_31/CLKINV_1232 ),
    .Q(\random/Mshreg_lfsr_3 ),
    .Q15(\NLW_random/Mshreg_lfsr_3/SRL16E_Q15_UNCONNECTED )
  );
  X_FF #(
    .LOC ( "SLICE_X14Y39" ),
    .INIT ( 1'b0 ))
  \random/lfsr_31  (
    .I(\random/lfsr_31/DYMUX_1245 ),
    .CE(VCC),
    .CLK(\random/lfsr_31/CLKINV_1232 ),
    .SET(GND),
    .RST(GND),
    .O(\random/lfsr_31_466 )
  );
  X_FF #(
    .LOC ( "SLICE_X16Y37" ),
    .INIT ( 1'b0 ))
  \mc/state_FSM_FFd2  (
    .I(\mc/state_FSM_FFd2/DYMUX_1268 ),
    .CE(VCC),
    .CLK(\mc/state_FSM_FFd2/CLKINV_1259 ),
    .SET(GND),
    .RST(\mc/state_FSM_FFd2/FFY/RSTAND_1273 ),
    .O(\mc/state_FSM_FFd2_436 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y37" ))
  \mc/state_FSM_FFd2/FFY/RSTAND  (
    .I(rst_IBUF_407),
    .O(\mc/state_FSM_FFd2/FFY/RSTAND_1273 )
  );
  X_LUT4 #(
    .INIT ( 16'h00CC ),
    .LOC ( "SLICE_X16Y37" ))
  \mc/state_FSM_FFd1-In23  (
    .ADR0(VCC),
    .ADR1(\mc/state_FSM_FFd2_436 ),
    .ADR2(VCC),
    .ADR3(\mc/state_FSM_FFd3_435 ),
    .O(\mc/state_FSM_FFd1-In23_1281 )
  );
  X_LUT4 #(
    .INIT ( 16'hAEEA ),
    .LOC ( "SLICE_X17Y39" ))
  \scorer/state_FSM_FFd1-In1  (
    .ADR0(\scorer/state_FSM_FFd1_434 ),
    .ADR1(N24_0),
    .ADR2(right),
    .ADR3(N36),
    .O(\scorer/state_FSM_FFd1-In )
  );
  X_FF #(
    .LOC ( "SLICE_X17Y39" ),
    .INIT ( 1'b0 ))
  \scorer/state_FSM_FFd1  (
    .I(\scorer/state_FSM_FFd2/DYMUX_1307 ),
    .CE(\scorer/state_FSM_FFd2/CEINV_1297 ),
    .CLK(\scorer/state_FSM_FFd2/CLKINV_1298 ),
    .SET(GND),
    .RST(\scorer/state_FSM_FFd2/SRINV_1299 ),
    .O(\scorer/state_FSM_FFd1_434 )
  );
  X_LUT4 #(
    .INIT ( 16'hFEAE ),
    .LOC ( "SLICE_X17Y39" ))
  \scorer/state_FSM_FFd2-In  (
    .ADR0(\scorer/state_FSM_FFd1_434 ),
    .ADR1(N42),
    .ADR2(right),
    .ADR3(N43),
    .O(\scorer/state_FSM_FFd2-In_1319 )
  );
  X_FF #(
    .LOC ( "SLICE_X17Y39" ),
    .INIT ( 1'b0 ))
  \scorer/state_FSM_FFd2  (
    .I(\scorer/state_FSM_FFd2/DXMUX_1322 ),
    .CE(\scorer/state_FSM_FFd2/CEINV_1297 ),
    .CLK(\scorer/state_FSM_FFd2/CLKINV_1298 ),
    .SET(GND),
    .RST(\scorer/state_FSM_FFd2/SRINV_1299 ),
    .O(\scorer/state_FSM_FFd2_433 )
  );
  X_FF #(
    .LOC ( "SLICE_X17Y35" ),
    .INIT ( 1'b0 ))
  \sync/regsyspush  (
    .I(\sync/regsyspush/DYMUX_1351 ),
    .CE(VCC),
    .CLK(\sync/regsyspush/CLKINV_1340 ),
    .SET(GND),
    .RST(\sync/regsyspush/FFY/RSTAND_1356 ),
    .O(\sync/regsyspush_441 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y35" ))
  \sync/regsyspush/FFY/RSTAND  (
    .I(rst_IBUF_407),
    .O(\sync/regsyspush/FFY/RSTAND_1356 )
  );
  X_LUT4 #(
    .INIT ( 16'hFE00 ),
    .LOC ( "SLICE_X17Y35" ))
  \scorer/state_FSM_FFd4-In5  (
    .ADR0(\scorer/state_FSM_FFd4_431 ),
    .ADR1(right),
    .ADR2(N9),
    .ADR3(\scorer/state_FSM_FFd3_432 ),
    .O(\scorer/state_FSM_FFd4-In5_1362 )
  );
  X_LUT4 #(
    .INIT ( 16'hAF0A ),
    .LOC ( "SLICE_X16Y40" ))
  \scorer/state_FSM_FFd2-In_SW1  (
    .ADR0(\scorer/state_FSM_FFd2_433 ),
    .ADR1(VCC),
    .ADR2(\scorer/state_FSM_FFd3_432 ),
    .ADR3(\scorer/state_FSM_FFd4_431 ),
    .O(N34)
  );
  X_LUT4 #(
    .INIT ( 16'h5A5A ),
    .LOC ( "SLICE_X15Y38" ))
  \random/Mxor_lfsr_9_xor0000_Result1  (
    .ADR0(\random/lfsr[3] ),
    .ADR1(VCC),
    .ADR2(\random/lfsr[0] ),
    .ADR3(VCC),
    .O(\random/lfsr_9_xor0000 )
  );
  X_FF #(
    .LOC ( "SLICE_X15Y38" ),
    .INIT ( 1'b0 ))
  \random/lfsr_9  (
    .I(\random/lfsr<9>/DYMUX_1381 ),
    .CE(VCC),
    .CLK(\random/lfsr<9>/CLKINV_1370 ),
    .SET(GND),
    .RST(\random/lfsr<9>/FFY/RSTAND_1386 ),
    .O(\random/lfsr[9] )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y38" ))
  \random/lfsr<9>/FFY/RSTAND  (
    .I(rst_IBUF_407),
    .O(\random/lfsr<9>/FFY/RSTAND_1386 )
  );
  X_FF #(
    .LOC ( "SLICE_X19Y38" ),
    .INIT ( 1'b0 ))
  rst_IBUF_shift1 (
    .I(\rst_IBUF_shift2/DYMUX_1397 ),
    .CE(VCC),
    .CLK(\rst_IBUF_shift2/CLKINV_1394 ),
    .SET(GND),
    .RST(\rst_IBUF_shift2/SRINV_1395 ),
    .O(rst_IBUF_shift1_470)
  );
  X_FF #(
    .LOC ( "SLICE_X19Y38" ),
    .INIT ( 1'b0 ))
  rst_IBUF_shift2 (
    .I(\rst_IBUF_shift2/DXMUX_1405 ),
    .CE(VCC),
    .CLK(\rst_IBUF_shift2/CLKINV_1394 ),
    .SET(GND),
    .RST(\rst_IBUF_shift2/SRINV_1395 ),
    .O(rst_IBUF_shift2_471)
  );
  X_FF #(
    .LOC ( "SLICE_X18Y39" ),
    .INIT ( 1'b0 ))
  rst_IBUF_shift3 (
    .I(\rst_IBUF_shift4/DYMUX_1421 ),
    .CE(VCC),
    .CLK(\rst_IBUF_shift4/CLKINV_1418 ),
    .SET(GND),
    .RST(\rst_IBUF_shift4/SRINV_1419 ),
    .O(rst_IBUF_shift3_472)
  );
  X_FF #(
    .LOC ( "SLICE_X18Y39" ),
    .INIT ( 1'b0 ))
  rst_IBUF_shift4 (
    .I(\rst_IBUF_shift4/DXMUX_1429 ),
    .CE(VCC),
    .CLK(\rst_IBUF_shift4/CLKINV_1418 ),
    .SET(GND),
    .RST(\rst_IBUF_shift4/SRINV_1419 ),
    .O(rst_IBUF_shift4_473)
  );
  X_FF #(
    .LOC ( "SLICE_X16Y39" ),
    .INIT ( 1'b0 ))
  rst_IBUF_shift5 (
    .I(\rst_IBUF_shift5/DYMUX_1443 ),
    .CE(VCC),
    .CLK(\rst_IBUF_shift5/CLKINV_1440 ),
    .SET(GND),
    .RST(\rst_IBUF_shift5/FFY/RSTAND_1448 ),
    .O(rst_IBUF_shift5_474)
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y39" ))
  \rst_IBUF_shift5/FFY/RSTAND  (
    .I(rst_IBUF_407),
    .O(\rst_IBUF_shift5/FFY/RSTAND_1448 )
  );
  X_LUT4 #(
    .INIT ( 16'hEAAA ),
    .LOC ( "SLICE_X14Y42" ))
  \ledmux/Mmux_leds_out_reg71  (
    .ADR0(N18),
    .ADR1(\mc/state_FSM_FFd1_430 ),
    .ADR2(\scorer/state_FSM_FFd2_433 ),
    .ADR3(\scorer/state_FSM_FFd3_432 ),
    .O(leds_out_6_OBUF_1544)
  );
  X_LUT4 #(
    .INIT ( 16'h000A ),
    .LOC ( "SLICE_X16Y40" ))
  \scorer/state_FSM_FFd1-In11  (
    .ADR0(\scorer/state_FSM_FFd2_433 ),
    .ADR1(VCC),
    .ADR2(\scorer/state_FSM_FFd3_432 ),
    .ADR3(\scorer/state_FSM_FFd4_431 ),
    .O(N24)
  );
  X_LUT4 #(
    .INIT ( 16'h8000 ),
    .LOC ( "SLICE_X18Y30" ))
  \div256/slowenable9  (
    .ADR0(\div256/count [1]),
    .ADR1(\div256/count [3]),
    .ADR2(\div256/count [2]),
    .ADR3(\div256/count [0]),
    .O(\div256/slowenable9_1483 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFC8 ),
    .LOC ( "SLICE_X14Y45" ))
  \ledmux/Mmux_leds_out_reg11  (
    .ADR0(N24_0),
    .ADR1(\mc/state_FSM_FFd1_430 ),
    .ADR2(\scorer/state_FSM_FFd1_434 ),
    .ADR3(N18),
    .O(leds_out_0_OBUF_1500)
  );
  X_LUT4 #(
    .INIT ( 16'hB380 ),
    .LOC ( "SLICE_X14Y45" ))
  \ledmux/Mmux_leds_out_reg51  (
    .ADR0(\scorer/state_FSM_FFd4_431 ),
    .ADR1(\mc/state_FSM_FFd1_430 ),
    .ADR2(\scorer/state_FSM_FFd3_432 ),
    .ADR3(\mc/state_FSM_FFd3_435 ),
    .O(leds_out_4_OBUF_1507)
  );
  X_FF #(
    .LOC ( "SLICE_X14Y33" ),
    .INIT ( 1'b1 ))
  \opp/regwinrnd  (
    .I(\opp/regwinrnd/DYMUX_1517 ),
    .CE(VCC),
    .CLK(\opp/regwinrnd/CLKINV_1514 ),
    .SET(\opp/regwinrnd/FFY/SET ),
    .RST(GND),
    .O(\opp/regwinrnd_442 )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y33" ))
  \opp/regwinrnd/FFY/SETOR  (
    .I(rst_IBUF_407),
    .O(\opp/regwinrnd/FFY/SET )
  );
  X_FF #(
    .LOC ( "SLICE_X17Y32" ),
    .INIT ( 1'b0 ))
  \mc/state_FSM_FFd3  (
    .I(\mc/state_FSM_FFd3/DYMUX_1554 ),
    .CE(VCC),
    .CLK(\mc/state_FSM_FFd3/CLKINV_1551 ),
    .SET(GND),
    .RST(\mc/state_FSM_FFd3/FFY/RSTAND_1559 ),
    .O(\mc/state_FSM_FFd3_435 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y32" ))
  \mc/state_FSM_FFd3/FFY/RSTAND  (
    .I(rst_IBUF_407),
    .O(\mc/state_FSM_FFd3/FFY/RSTAND_1559 )
  );
  X_LUT4 #(
    .INIT ( 16'h88CC ),
    .LOC ( "SLICE_X17Y34" ))
  \mc/state_FSM_FFd3-In29  (
    .ADR0(\opp/regwinrnd_442 ),
    .ADR1(\random/lfsr[9] ),
    .ADR2(VCC),
    .ADR3(\sync/regsyspush_441 ),
    .O(\mc/state_FSM_FFd3-In29_1570 )
  );
  X_LUT4 #(
    .INIT ( 16'hAA00 ),
    .LOC ( "SLICE_X18Y36" ))
  \div256/slowenable10  (
    .ADR0(\div256/slowenable4_453 ),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(\div256/slowenable9_0 ),
    .O(slowenable_pack_1)
  );
  X_LUT4 #(
    .INIT ( 16'hF444 ),
    .LOC ( "SLICE_X18Y36" ))
  \mc/state_FSM_FFd1-In20  (
    .ADR0(\opp/regwinrnd_442 ),
    .ADR1(\sync/regsyspush_441 ),
    .ADR2(\random/lfsr[9] ),
    .ADR3(slowenable),
    .O(\mc/state_FSM_FFd1-In20_1594 )
  );
  X_FF #(
    .LOC ( "SLICE_X15Y39" ),
    .INIT ( 1'b1 ))
  \random/lfsr_0  (
    .I(\random/lfsr<1>/DYMUX_1606 ),
    .CE(VCC),
    .CLK(\random/lfsr<1>/CLKINV_1603 ),
    .SET(\random/lfsr<1>/SRINV_1604 ),
    .RST(GND),
    .O(\random/lfsr[0] )
  );
  X_FF #(
    .LOC ( "SLICE_X15Y39" ),
    .INIT ( 1'b0 ))
  \random/lfsr_1  (
    .I(\random/lfsr<1>/DXMUX_1613 ),
    .CE(VCC),
    .CLK(\random/lfsr<1>/CLKINV_1603 ),
    .SET(GND),
    .RST(\random/lfsr<1>/SRINV_1604 ),
    .O(\random/lfsr[1] )
  );
  X_LUT4 #(
    .INIT ( 16'hA0A0 ),
    .LOC ( "SLICE_X14Y38" ))
  \random/lfsr_311  (
    .ADR0(\random/lfsr_31_466 ),
    .ADR1(VCC),
    .ADR2(rst_IBUF_shift5_474),
    .ADR3(VCC),
    .O(\random/lfsr_311_1635 )
  );
  X_FF #(
    .LOC ( "SLICE_X14Y38" ),
    .INIT ( 1'b0 ))
  \random/lfsr_3  (
    .I(\random/lfsr<2>/DYMUX_1638 ),
    .CE(VCC),
    .CLK(\random/lfsr<2>/CLKINV_1627 ),
    .SET(GND),
    .RST(\random/lfsr<2>/SRINV_1628 ),
    .O(\random/lfsr[3] )
  );
  X_LUT4 #(
    .INIT ( 16'hFF00 ),
    .LOC ( "SLICE_X19Y30" ))
  \div256/count<0>/G/X_LUT4  (
    .ADR0(VCC),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(\div256/count [1]),
    .O(\div256/count<0>/G )
  );
  X_LUT4 #(
    .INIT ( 16'hCCCC ),
    .LOC ( "SLICE_X19Y31" ))
  \div256/count<2>/F/X_LUT4  (
    .ADR0(VCC),
    .ADR1(\div256/count [2]),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(\div256/count<2>/F )
  );
  X_LUT4 #(
    .INIT ( 16'hF0F0 ),
    .LOC ( "SLICE_X19Y31" ))
  \div256/count<2>/G/X_LUT4  (
    .ADR0(VCC),
    .ADR1(VCC),
    .ADR2(\div256/count [3]),
    .ADR3(VCC),
    .O(\div256/count<2>/G )
  );
  X_LUT4 #(
    .INIT ( 16'hF0F0 ),
    .LOC ( "SLICE_X19Y32" ))
  \div256/count<4>/F/X_LUT4  (
    .ADR0(VCC),
    .ADR1(VCC),
    .ADR2(\div256/count [4]),
    .ADR3(VCC),
    .O(\div256/count<4>/F )
  );
  X_LUT4 #(
    .INIT ( 16'hFF00 ),
    .LOC ( "SLICE_X19Y32" ))
  \div256/count<4>/G/X_LUT4  (
    .ADR0(VCC),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(\div256/count [5]),
    .O(\div256/count<4>/G )
  );
  X_LUT4 #(
    .INIT ( 16'hCCCC ),
    .LOC ( "SLICE_X19Y33" ))
  \div256/count<6>/F/X_LUT4  (
    .ADR0(VCC),
    .ADR1(\div256/count [6]),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(\div256/count<6>/F )
  );
  X_BUF #(
    .LOC ( "PAD22" ))
  \leds_out<0>/OUTPUT/OFF/OMUX  (
    .I(leds_out_0_OBUF_1500),
    .O(\leds_out<0>/O )
  );
  X_BUF #(
    .LOC ( "PAD21" ))
  \leds_out<1>/OUTPUT/OFF/OMUX  (
    .I(\leds_out_1_OBUF/F5MUX_951 ),
    .O(\leds_out<1>/O )
  );
  X_BUF #(
    .LOC ( "PAD20" ))
  \leds_out<2>/OUTPUT/OFF/OMUX  (
    .I(\leds_out_2_OBUF/F5MUX_801 ),
    .O(\leds_out<2>/O )
  );
  X_BUF #(
    .LOC ( "PAD19" ))
  \leds_out<3>/OUTPUT/OFF/OMUX  (
    .I(\leds_out_3_OBUF/F5MUX_826 ),
    .O(\leds_out<3>/O )
  );
  X_BUF #(
    .LOC ( "PAD18" ))
  \leds_out<4>/OUTPUT/OFF/OMUX  (
    .I(leds_out_4_OBUF_1507),
    .O(\leds_out<4>/O )
  );
  X_BUF #(
    .LOC ( "PAD17" ))
  \leds_out<5>/OUTPUT/OFF/OMUX  (
    .I(\leds_out_5_OBUF/F5MUX_851 ),
    .O(\leds_out<5>/O )
  );
  X_BUF #(
    .LOC ( "PAD15" ))
  \leds_out<6>/OUTPUT/OFF/OMUX  (
    .I(leds_out_6_OBUF_1544),
    .O(\leds_out<6>/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y39" ))
  \random/Mshreg_lfsr_3/SRL16E.CE/WSGAND  (
    .I(\random/lfsr_31/SRINV_1228 ),
    .O(\random/lfsr_31/WSG )
  );
  X_ZERO   NlwBlock_top_GND (
    .O(GND)
  );
  X_ONE   NlwBlock_top_VCC (
    .O(VCC)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

