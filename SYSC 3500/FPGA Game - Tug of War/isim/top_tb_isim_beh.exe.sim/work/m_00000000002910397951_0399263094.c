/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x12940baa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "//ugradfs/kconway1/win/ELEC3500/Lab 9/xilinx/scorer.v";
static int ng1[] = {5, 0};
static int ng2[] = {4, 0};
static int ng3[] = {6, 0};
static int ng4[] = {7, 0};
static int ng5[] = {8, 0};
static int ng6[] = {9, 0};
static int ng7[] = {3, 0};
static int ng8[] = {2, 0};
static int ng9[] = {1, 0};
static int ng10[] = {0, 0};
static unsigned int ng11[] = {8U, 0U};
static unsigned int ng12[] = {16U, 0U};
static unsigned int ng13[] = {32U, 0U};
static unsigned int ng14[] = {64U, 0U};
static unsigned int ng15[] = {4U, 0U};
static unsigned int ng16[] = {2U, 0U};
static unsigned int ng17[] = {1U, 0U};
static unsigned int ng18[] = {112U, 0U};
static unsigned int ng19[] = {7U, 0U};
static unsigned int ng20[] = {85U, 0U};



static void Always_39_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;

LAB0:    t1 = (t0 + 3648U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(39, ng0);
    t2 = (t0 + 4712);
    *((int *)t2) = 1;
    t3 = (t0 + 3680);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(40, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 2728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 4, 0LL);

LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(40, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 4, 0LL);
    goto LAB7;

}

static void Cont_50_1(char *t0)
{
    char t5[8];
    char t36[8];
    char t55[8];
    char t74[8];
    char t106[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    int t28;
    int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    char *t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    char *t56;
    char *t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    char *t63;
    char *t64;
    char *t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t78;
    char *t79;
    char *t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    char *t88;
    char *t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    int t98;
    int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    char *t110;
    char *t111;
    char *t112;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    char *t120;
    char *t121;
    unsigned int t122;
    unsigned int t123;
    unsigned int t124;
    int t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    int t129;
    unsigned int t130;
    unsigned int t131;
    unsigned int t132;
    unsigned int t133;
    char *t134;
    char *t135;
    char *t136;
    char *t137;
    char *t138;
    unsigned int t139;
    unsigned int t140;
    char *t141;
    unsigned int t142;
    unsigned int t143;
    char *t144;
    unsigned int t145;
    unsigned int t146;
    char *t147;

LAB0:    t1 = (t0 + 3896U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t0 + 1688U);
    t4 = *((char **)t2);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t4);
    t8 = (t6 & t7);
    *((unsigned int *)t5) = t8;
    t2 = (t3 + 4);
    t9 = (t4 + 4);
    t10 = (t5 + 4);
    t11 = *((unsigned int *)t2);
    t12 = *((unsigned int *)t9);
    t13 = (t11 | t12);
    *((unsigned int *)t10) = t13;
    t14 = *((unsigned int *)t10);
    t15 = (t14 != 0);
    if (t15 == 1)
        goto LAB4;

LAB5:
LAB6:    t37 = (t0 + 1368U);
    t38 = *((char **)t37);
    memset(t36, 0, 8);
    t37 = (t38 + 4);
    t39 = *((unsigned int *)t37);
    t40 = (~(t39));
    t41 = *((unsigned int *)t38);
    t42 = (t41 & t40);
    t43 = (t42 & 1U);
    if (t43 != 0)
        goto LAB10;

LAB8:    if (*((unsigned int *)t37) == 0)
        goto LAB7;

LAB9:    t44 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t44) = 1;

LAB10:    t45 = (t36 + 4);
    t46 = (t38 + 4);
    t47 = *((unsigned int *)t38);
    t48 = (~(t47));
    *((unsigned int *)t36) = t48;
    *((unsigned int *)t45) = 0;
    if (*((unsigned int *)t46) != 0)
        goto LAB12;

LAB11:    t53 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t53 & 1U);
    t54 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t54 & 1U);
    t56 = (t0 + 1688U);
    t57 = *((char **)t56);
    memset(t55, 0, 8);
    t56 = (t57 + 4);
    t58 = *((unsigned int *)t56);
    t59 = (~(t58));
    t60 = *((unsigned int *)t57);
    t61 = (t60 & t59);
    t62 = (t61 & 1U);
    if (t62 != 0)
        goto LAB16;

LAB14:    if (*((unsigned int *)t56) == 0)
        goto LAB13;

LAB15:    t63 = (t55 + 4);
    *((unsigned int *)t55) = 1;
    *((unsigned int *)t63) = 1;

LAB16:    t64 = (t55 + 4);
    t65 = (t57 + 4);
    t66 = *((unsigned int *)t57);
    t67 = (~(t66));
    *((unsigned int *)t55) = t67;
    *((unsigned int *)t64) = 0;
    if (*((unsigned int *)t65) != 0)
        goto LAB18;

LAB17:    t72 = *((unsigned int *)t55);
    *((unsigned int *)t55) = (t72 & 1U);
    t73 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t73 & 1U);
    t75 = *((unsigned int *)t36);
    t76 = *((unsigned int *)t55);
    t77 = (t75 & t76);
    *((unsigned int *)t74) = t77;
    t78 = (t36 + 4);
    t79 = (t55 + 4);
    t80 = (t74 + 4);
    t81 = *((unsigned int *)t78);
    t82 = *((unsigned int *)t79);
    t83 = (t81 | t82);
    *((unsigned int *)t80) = t83;
    t84 = *((unsigned int *)t80);
    t85 = (t84 != 0);
    if (t85 == 1)
        goto LAB19;

LAB20:
LAB21:    t107 = *((unsigned int *)t5);
    t108 = *((unsigned int *)t74);
    t109 = (t107 | t108);
    *((unsigned int *)t106) = t109;
    t110 = (t5 + 4);
    t111 = (t74 + 4);
    t112 = (t106 + 4);
    t113 = *((unsigned int *)t110);
    t114 = *((unsigned int *)t111);
    t115 = (t113 | t114);
    *((unsigned int *)t112) = t115;
    t116 = *((unsigned int *)t112);
    t117 = (t116 != 0);
    if (t117 == 1)
        goto LAB22;

LAB23:
LAB24:    t134 = (t0 + 4840);
    t135 = (t134 + 56U);
    t136 = *((char **)t135);
    t137 = (t136 + 56U);
    t138 = *((char **)t137);
    memset(t138, 0, 8);
    t139 = 1U;
    t140 = t139;
    t141 = (t106 + 4);
    t142 = *((unsigned int *)t106);
    t139 = (t139 & t142);
    t143 = *((unsigned int *)t141);
    t140 = (t140 & t143);
    t144 = (t138 + 4);
    t145 = *((unsigned int *)t138);
    *((unsigned int *)t138) = (t145 | t139);
    t146 = *((unsigned int *)t144);
    *((unsigned int *)t144) = (t146 | t140);
    xsi_driver_vfirst_trans(t134, 0, 0);
    t147 = (t0 + 4728);
    *((int *)t147) = 1;

LAB1:    return;
LAB4:    t16 = *((unsigned int *)t5);
    t17 = *((unsigned int *)t10);
    *((unsigned int *)t5) = (t16 | t17);
    t18 = (t3 + 4);
    t19 = (t4 + 4);
    t20 = *((unsigned int *)t3);
    t21 = (~(t20));
    t22 = *((unsigned int *)t18);
    t23 = (~(t22));
    t24 = *((unsigned int *)t4);
    t25 = (~(t24));
    t26 = *((unsigned int *)t19);
    t27 = (~(t26));
    t28 = (t21 & t23);
    t29 = (t25 & t27);
    t30 = (~(t28));
    t31 = (~(t29));
    t32 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t32 & t30);
    t33 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t33 & t31);
    t34 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t34 & t30);
    t35 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t35 & t31);
    goto LAB6;

LAB7:    *((unsigned int *)t36) = 1;
    goto LAB10;

LAB12:    t49 = *((unsigned int *)t36);
    t50 = *((unsigned int *)t46);
    *((unsigned int *)t36) = (t49 | t50);
    t51 = *((unsigned int *)t45);
    t52 = *((unsigned int *)t46);
    *((unsigned int *)t45) = (t51 | t52);
    goto LAB11;

LAB13:    *((unsigned int *)t55) = 1;
    goto LAB16;

LAB18:    t68 = *((unsigned int *)t55);
    t69 = *((unsigned int *)t65);
    *((unsigned int *)t55) = (t68 | t69);
    t70 = *((unsigned int *)t64);
    t71 = *((unsigned int *)t65);
    *((unsigned int *)t64) = (t70 | t71);
    goto LAB17;

LAB19:    t86 = *((unsigned int *)t74);
    t87 = *((unsigned int *)t80);
    *((unsigned int *)t74) = (t86 | t87);
    t88 = (t36 + 4);
    t89 = (t55 + 4);
    t90 = *((unsigned int *)t36);
    t91 = (~(t90));
    t92 = *((unsigned int *)t88);
    t93 = (~(t92));
    t94 = *((unsigned int *)t55);
    t95 = (~(t94));
    t96 = *((unsigned int *)t89);
    t97 = (~(t96));
    t98 = (t91 & t93);
    t99 = (t95 & t97);
    t100 = (~(t98));
    t101 = (~(t99));
    t102 = *((unsigned int *)t80);
    *((unsigned int *)t80) = (t102 & t100);
    t103 = *((unsigned int *)t80);
    *((unsigned int *)t80) = (t103 & t101);
    t104 = *((unsigned int *)t74);
    *((unsigned int *)t74) = (t104 & t100);
    t105 = *((unsigned int *)t74);
    *((unsigned int *)t74) = (t105 & t101);
    goto LAB21;

LAB22:    t118 = *((unsigned int *)t106);
    t119 = *((unsigned int *)t112);
    *((unsigned int *)t106) = (t118 | t119);
    t120 = (t5 + 4);
    t121 = (t74 + 4);
    t122 = *((unsigned int *)t120);
    t123 = (~(t122));
    t124 = *((unsigned int *)t5);
    t125 = (t124 & t123);
    t126 = *((unsigned int *)t121);
    t127 = (~(t126));
    t128 = *((unsigned int *)t74);
    t129 = (t128 & t127);
    t130 = (~(t125));
    t131 = (~(t129));
    t132 = *((unsigned int *)t112);
    *((unsigned int *)t112) = (t132 & t130);
    t133 = *((unsigned int *)t112);
    *((unsigned int *)t112) = (t133 & t131);
    goto LAB24;

}

static void Always_52_2(char *t0)
{
    char t8[8];
    char t22[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    char *t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    int t46;
    int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    char *t60;
    char *t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    char *t67;
    char *t68;
    char *t69;
    char *t70;
    int t71;
    char *t72;
    char *t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;
    char *t80;

LAB0:    t1 = (t0 + 4144U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 4744);
    *((int *)t2) = 1;
    t3 = (t0 + 4176);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(53, ng0);

LAB5:    xsi_set_current_line(54, ng0);
    t4 = (t0 + 2568);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 2728);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 4);
    xsi_set_current_line(55, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = (t0 + 1528U);
    t4 = *((char **)t2);
    memset(t8, 0, 8);
    t2 = (t4 + 4);
    t9 = *((unsigned int *)t2);
    t10 = (~(t9));
    t11 = *((unsigned int *)t4);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t2) == 0)
        goto LAB6;

LAB8:    t5 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t5) = 1;

LAB9:    t6 = (t8 + 4);
    t7 = (t4 + 4);
    t14 = *((unsigned int *)t4);
    t15 = (~(t14));
    *((unsigned int *)t8) = t15;
    *((unsigned int *)t6) = 0;
    if (*((unsigned int *)t7) != 0)
        goto LAB11;

LAB10:    t20 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t20 & 1U);
    t21 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t21 & 1U);
    t23 = *((unsigned int *)t3);
    t24 = *((unsigned int *)t8);
    t25 = (t23 & t24);
    *((unsigned int *)t22) = t25;
    t26 = (t3 + 4);
    t27 = (t8 + 4);
    t28 = (t22 + 4);
    t29 = *((unsigned int *)t26);
    t30 = *((unsigned int *)t27);
    t31 = (t29 | t30);
    *((unsigned int *)t28) = t31;
    t32 = *((unsigned int *)t28);
    t33 = (t32 != 0);
    if (t33 == 1)
        goto LAB12;

LAB13:
LAB14:    t54 = (t22 + 4);
    t55 = *((unsigned int *)t54);
    t56 = (~(t55));
    t57 = *((unsigned int *)t22);
    t58 = (t57 & t56);
    t59 = (t58 != 0);
    if (t59 > 0)
        goto LAB15;

LAB16:
LAB17:    goto LAB2;

LAB6:    *((unsigned int *)t8) = 1;
    goto LAB9;

LAB11:    t16 = *((unsigned int *)t8);
    t17 = *((unsigned int *)t7);
    *((unsigned int *)t8) = (t16 | t17);
    t18 = *((unsigned int *)t6);
    t19 = *((unsigned int *)t7);
    *((unsigned int *)t6) = (t18 | t19);
    goto LAB10;

LAB12:    t34 = *((unsigned int *)t22);
    t35 = *((unsigned int *)t28);
    *((unsigned int *)t22) = (t34 | t35);
    t36 = (t3 + 4);
    t37 = (t8 + 4);
    t38 = *((unsigned int *)t3);
    t39 = (~(t38));
    t40 = *((unsigned int *)t36);
    t41 = (~(t40));
    t42 = *((unsigned int *)t8);
    t43 = (~(t42));
    t44 = *((unsigned int *)t37);
    t45 = (~(t44));
    t46 = (t39 & t41);
    t47 = (t43 & t45);
    t48 = (~(t46));
    t49 = (~(t47));
    t50 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t50 & t48);
    t51 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t51 & t49);
    t52 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t52 & t48);
    t53 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t53 & t49);
    goto LAB14;

LAB15:    xsi_set_current_line(56, ng0);
    t60 = (t0 + 1688U);
    t61 = *((char **)t60);
    t60 = (t61 + 4);
    t62 = *((unsigned int *)t60);
    t63 = (~(t62));
    t64 = *((unsigned int *)t61);
    t65 = (t64 & t63);
    t66 = (t65 != 0);
    if (t66 > 0)
        goto LAB18;

LAB19:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 2568);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB64:    t5 = ((char*)((ng1)));
    t46 = xsi_vlog_unsigned_case_compare(t4, 4, t5, 32);
    if (t46 == 1)
        goto LAB65;

LAB66:    t2 = ((char*)((ng3)));
    t46 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t46 == 1)
        goto LAB67;

LAB68:    t2 = ((char*)((ng4)));
    t46 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t46 == 1)
        goto LAB69;

LAB70:    t2 = ((char*)((ng5)));
    t46 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t46 == 1)
        goto LAB71;

LAB72:    t2 = ((char*)((ng2)));
    t46 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t46 == 1)
        goto LAB73;

LAB74:    t2 = ((char*)((ng7)));
    t46 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t46 == 1)
        goto LAB75;

LAB76:    t2 = ((char*)((ng8)));
    t46 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t46 == 1)
        goto LAB77;

LAB78:    t2 = ((char*)((ng6)));
    t46 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t46 == 1)
        goto LAB79;

LAB80:    t2 = ((char*)((ng9)));
    t46 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 32);
    if (t46 == 1)
        goto LAB81;

LAB82:
LAB84:
LAB83:    xsi_set_current_line(80, ng0);
    t2 = ((char*)((ng10)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB85:
LAB20:    goto LAB17;

LAB18:    xsi_set_current_line(57, ng0);
    t67 = (t0 + 2568);
    t68 = (t67 + 56U);
    t69 = *((char **)t68);

LAB21:    t70 = ((char*)((ng1)));
    t71 = xsi_vlog_unsigned_case_compare(t69, 4, t70, 32);
    if (t71 == 1)
        goto LAB22;

LAB23:    t2 = ((char*)((ng3)));
    t46 = xsi_vlog_unsigned_case_compare(t69, 4, t2, 32);
    if (t46 == 1)
        goto LAB24;

LAB25:    t2 = ((char*)((ng4)));
    t46 = xsi_vlog_unsigned_case_compare(t69, 4, t2, 32);
    if (t46 == 1)
        goto LAB26;

LAB27:    t2 = ((char*)((ng5)));
    t46 = xsi_vlog_unsigned_case_compare(t69, 4, t2, 32);
    if (t46 == 1)
        goto LAB28;

LAB29:    t2 = ((char*)((ng2)));
    t46 = xsi_vlog_unsigned_case_compare(t69, 4, t2, 32);
    if (t46 == 1)
        goto LAB30;

LAB31:    t2 = ((char*)((ng7)));
    t46 = xsi_vlog_unsigned_case_compare(t69, 4, t2, 32);
    if (t46 == 1)
        goto LAB32;

LAB33:    t2 = ((char*)((ng8)));
    t46 = xsi_vlog_unsigned_case_compare(t69, 4, t2, 32);
    if (t46 == 1)
        goto LAB34;

LAB35:    t2 = ((char*)((ng6)));
    t46 = xsi_vlog_unsigned_case_compare(t69, 4, t2, 32);
    if (t46 == 1)
        goto LAB36;

LAB37:    t2 = ((char*)((ng9)));
    t46 = xsi_vlog_unsigned_case_compare(t69, 4, t2, 32);
    if (t46 == 1)
        goto LAB38;

LAB39:
LAB41:
LAB40:    xsi_set_current_line(67, ng0);
    t2 = ((char*)((ng10)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB42:    goto LAB20;

LAB22:    xsi_set_current_line(58, ng0);
    t72 = (t0 + 2008U);
    t73 = *((char **)t72);
    t72 = (t73 + 4);
    t74 = *((unsigned int *)t72);
    t75 = (~(t74));
    t76 = *((unsigned int *)t73);
    t77 = (t76 & t75);
    t78 = (t77 != 0);
    if (t78 > 0)
        goto LAB43;

LAB44:    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB45:    goto LAB42;

LAB24:    xsi_set_current_line(59, ng0);
    t3 = (t0 + 2008U);
    t4 = *((char **)t3);
    t3 = (t4 + 4);
    t9 = *((unsigned int *)t3);
    t10 = (~(t9));
    t11 = *((unsigned int *)t4);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB46;

LAB47:    xsi_set_current_line(59, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB48:    goto LAB42;

LAB26:    xsi_set_current_line(60, ng0);
    t3 = (t0 + 2008U);
    t4 = *((char **)t3);
    t3 = (t4 + 4);
    t9 = *((unsigned int *)t3);
    t10 = (~(t9));
    t11 = *((unsigned int *)t4);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB49;

LAB50:    xsi_set_current_line(60, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB51:    goto LAB42;

LAB28:    xsi_set_current_line(61, ng0);
    t3 = (t0 + 2008U);
    t4 = *((char **)t3);
    t3 = (t4 + 4);
    t9 = *((unsigned int *)t3);
    t10 = (~(t9));
    t11 = *((unsigned int *)t4);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB52;

LAB53:    xsi_set_current_line(61, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB54:    goto LAB42;

LAB30:    xsi_set_current_line(62, ng0);
    t3 = (t0 + 2008U);
    t4 = *((char **)t3);
    t3 = (t4 + 4);
    t9 = *((unsigned int *)t3);
    t10 = (~(t9));
    t11 = *((unsigned int *)t4);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB55;

LAB56:    xsi_set_current_line(62, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB57:    goto LAB42;

LAB32:    xsi_set_current_line(63, ng0);
    t3 = (t0 + 2008U);
    t4 = *((char **)t3);
    t3 = (t4 + 4);
    t9 = *((unsigned int *)t3);
    t10 = (~(t9));
    t11 = *((unsigned int *)t4);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB58;

LAB59:    xsi_set_current_line(63, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB60:    goto LAB42;

LAB34:    xsi_set_current_line(64, ng0);
    t3 = (t0 + 2008U);
    t4 = *((char **)t3);
    t3 = (t4 + 4);
    t9 = *((unsigned int *)t3);
    t10 = (~(t9));
    t11 = *((unsigned int *)t4);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB61;

LAB62:    xsi_set_current_line(64, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB63:    goto LAB42;

LAB36:    xsi_set_current_line(65, ng0);
    t3 = ((char*)((ng6)));
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB42;

LAB38:    xsi_set_current_line(66, ng0);
    t3 = ((char*)((ng9)));
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB42;

LAB43:    xsi_set_current_line(58, ng0);
    t79 = ((char*)((ng2)));
    t80 = (t0 + 2728);
    xsi_vlogvar_assign_value(t80, t79, 0, 0, 4);
    goto LAB45;

LAB46:    xsi_set_current_line(59, ng0);
    t5 = ((char*)((ng1)));
    t6 = (t0 + 2728);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 4);
    goto LAB48;

LAB49:    xsi_set_current_line(60, ng0);
    t5 = ((char*)((ng3)));
    t6 = (t0 + 2728);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 4);
    goto LAB51;

LAB52:    xsi_set_current_line(61, ng0);
    t5 = ((char*)((ng3)));
    t6 = (t0 + 2728);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 4);
    goto LAB54;

LAB55:    xsi_set_current_line(62, ng0);
    t5 = ((char*)((ng7)));
    t6 = (t0 + 2728);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 4);
    goto LAB57;

LAB58:    xsi_set_current_line(63, ng0);
    t5 = ((char*)((ng8)));
    t6 = (t0 + 2728);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 4);
    goto LAB60;

LAB61:    xsi_set_current_line(64, ng0);
    t5 = ((char*)((ng9)));
    t6 = (t0 + 2728);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 4);
    goto LAB63;

LAB65:    xsi_set_current_line(71, ng0);
    t6 = (t0 + 2008U);
    t7 = *((char **)t6);
    t6 = (t7 + 4);
    t9 = *((unsigned int *)t6);
    t10 = (~(t9));
    t11 = *((unsigned int *)t7);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB86;

LAB87:    xsi_set_current_line(71, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB88:    goto LAB85;

LAB67:    xsi_set_current_line(72, ng0);
    t3 = (t0 + 2008U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t9 = *((unsigned int *)t3);
    t10 = (~(t9));
    t11 = *((unsigned int *)t5);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB89;

LAB90:    xsi_set_current_line(72, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB91:    goto LAB85;

LAB69:    xsi_set_current_line(73, ng0);
    t3 = (t0 + 2008U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t9 = *((unsigned int *)t3);
    t10 = (~(t9));
    t11 = *((unsigned int *)t5);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB92;

LAB93:    xsi_set_current_line(73, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB94:    goto LAB85;

LAB71:    xsi_set_current_line(74, ng0);
    t3 = (t0 + 2008U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t9 = *((unsigned int *)t3);
    t10 = (~(t9));
    t11 = *((unsigned int *)t5);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB95;

LAB96:    xsi_set_current_line(74, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB97:    goto LAB85;

LAB73:    xsi_set_current_line(75, ng0);
    t3 = (t0 + 2008U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t9 = *((unsigned int *)t3);
    t10 = (~(t9));
    t11 = *((unsigned int *)t5);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB98;

LAB99:    xsi_set_current_line(75, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB100:    goto LAB85;

LAB75:    xsi_set_current_line(76, ng0);
    t3 = (t0 + 2008U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t9 = *((unsigned int *)t3);
    t10 = (~(t9));
    t11 = *((unsigned int *)t5);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB101;

LAB102:    xsi_set_current_line(76, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB103:    goto LAB85;

LAB77:    xsi_set_current_line(77, ng0);
    t3 = (t0 + 2008U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t9 = *((unsigned int *)t3);
    t10 = (~(t9));
    t11 = *((unsigned int *)t5);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB104;

LAB105:    xsi_set_current_line(77, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB106:    goto LAB85;

LAB79:    xsi_set_current_line(78, ng0);
    t3 = ((char*)((ng6)));
    t5 = (t0 + 2728);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 4);
    goto LAB85;

LAB81:    xsi_set_current_line(79, ng0);
    t3 = ((char*)((ng9)));
    t5 = (t0 + 2728);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 4);
    goto LAB85;

LAB86:    xsi_set_current_line(71, ng0);
    t26 = ((char*)((ng2)));
    t27 = (t0 + 2728);
    xsi_vlogvar_assign_value(t27, t26, 0, 0, 4);
    goto LAB88;

LAB89:    xsi_set_current_line(72, ng0);
    t6 = ((char*)((ng1)));
    t7 = (t0 + 2728);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 4);
    goto LAB91;

LAB92:    xsi_set_current_line(73, ng0);
    t6 = ((char*)((ng3)));
    t7 = (t0 + 2728);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 4);
    goto LAB94;

LAB95:    xsi_set_current_line(74, ng0);
    t6 = ((char*)((ng4)));
    t7 = (t0 + 2728);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 4);
    goto LAB97;

LAB98:    xsi_set_current_line(75, ng0);
    t6 = ((char*)((ng7)));
    t7 = (t0 + 2728);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 4);
    goto LAB100;

LAB101:    xsi_set_current_line(76, ng0);
    t6 = ((char*)((ng8)));
    t7 = (t0 + 2728);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 4);
    goto LAB103;

LAB104:    xsi_set_current_line(77, ng0);
    t6 = ((char*)((ng9)));
    t7 = (t0 + 2728);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 4);
    goto LAB106;

}

static void Always_86_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 4392U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(86, ng0);
    t2 = (t0 + 4760);
    *((int *)t2) = 1;
    t3 = (t0 + 4424);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(87, ng0);
    t4 = (t0 + 2568);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB5:    t7 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t7, 32);
    if (t8 == 1)
        goto LAB6;

LAB7:    t2 = ((char*)((ng3)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 32);
    if (t8 == 1)
        goto LAB8;

LAB9:    t2 = ((char*)((ng4)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 32);
    if (t8 == 1)
        goto LAB10;

LAB11:    t2 = ((char*)((ng5)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 32);
    if (t8 == 1)
        goto LAB12;

LAB13:    t2 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 32);
    if (t8 == 1)
        goto LAB14;

LAB15:    t2 = ((char*)((ng7)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 32);
    if (t8 == 1)
        goto LAB16;

LAB17:    t2 = ((char*)((ng8)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 32);
    if (t8 == 1)
        goto LAB18;

LAB19:    t2 = ((char*)((ng6)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 32);
    if (t8 == 1)
        goto LAB20;

LAB21:    t2 = ((char*)((ng9)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 32);
    if (t8 == 1)
        goto LAB22;

LAB23:
LAB25:
LAB24:    xsi_set_current_line(97, ng0);
    t2 = ((char*)((ng20)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 7);

LAB26:    goto LAB2;

LAB6:    xsi_set_current_line(88, ng0);
    t9 = ((char*)((ng11)));
    t10 = (t0 + 2408);
    xsi_vlogvar_assign_value(t10, t9, 0, 0, 7);
    goto LAB26;

LAB8:    xsi_set_current_line(89, ng0);
    t3 = ((char*)((ng12)));
    t4 = (t0 + 2408);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 7);
    goto LAB26;

LAB10:    xsi_set_current_line(90, ng0);
    t3 = ((char*)((ng13)));
    t4 = (t0 + 2408);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 7);
    goto LAB26;

LAB12:    xsi_set_current_line(91, ng0);
    t3 = ((char*)((ng14)));
    t4 = (t0 + 2408);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 7);
    goto LAB26;

LAB14:    xsi_set_current_line(92, ng0);
    t3 = ((char*)((ng15)));
    t4 = (t0 + 2408);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 7);
    goto LAB26;

LAB16:    xsi_set_current_line(93, ng0);
    t3 = ((char*)((ng16)));
    t4 = (t0 + 2408);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 7);
    goto LAB26;

LAB18:    xsi_set_current_line(94, ng0);
    t3 = ((char*)((ng17)));
    t4 = (t0 + 2408);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 7);
    goto LAB26;

LAB20:    xsi_set_current_line(95, ng0);
    t3 = ((char*)((ng18)));
    t4 = (t0 + 2408);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 7);
    goto LAB26;

LAB22:    xsi_set_current_line(96, ng0);
    t3 = ((char*)((ng19)));
    t4 = (t0 + 2408);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 7);
    goto LAB26;

}


extern void work_m_00000000002910397951_0399263094_init()
{
	static char *pe[] = {(void *)Always_39_0,(void *)Cont_50_1,(void *)Always_52_2,(void *)Always_86_3};
	xsi_register_didat("work_m_00000000002910397951_0399263094", "isim/top_tb_isim_beh.exe.sim/work/m_00000000002910397951_0399263094.didat");
	xsi_register_executes(pe);
}
