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
static const char *ng0 = "//ugradfs/kconway1/win/ELEC3500/Lab 9/xilinx/scorer_tb.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static const char *ng3 = "%t - Setting up for first test. @ next clock edge Score should be 7'b0001000";
static unsigned int ng4[] = {8U, 0U};
static const char *ng5 = "%t - SUCCESS. Score was %b";
static const char *ng6 = "%t - ERROR. Score was %b";
static const char *ng7 = "%t - Going into state L2.";
static unsigned int ng8[] = {16U, 0U};
static const char *ng9 = "%t - In state L1 %b";
static unsigned int ng10[] = {32U, 0U};
static const char *ng11 = "%t - In state L2 %b";
static unsigned int ng12[] = {64U, 0U};
static const char *ng13 = "%t - Success. In state L3 %b";
static const char *ng14 = "%t - Success. In state L1 %b";
static const char *ng15 = "%t - Going into state N.";
static const char *ng16 = "%t - In state N %b";
static const char *ng17 = "%t - Going into state R1.";
static unsigned int ng18[] = {4U, 0U};
static const char *ng19 = "%t - In state R1 %b";
static const char *ng20 = "%t - Going into state R2.";
static unsigned int ng21[] = {2U, 0U};
static const char *ng22 = "%t - In state R2 %b";
static const char *ng23 = "%t - Going into state R3.";
static unsigned int ng24[] = {1U, 0U};
static const char *ng25 = "%t - In state R3 %b";
static const char *ng26 = "%t - Success. In state R2 %b";
static unsigned int ng27[] = {7U, 0U};
static const char *ng28 = "%t - Success. In state WR %b";



static void Always_25_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 3328U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 4144);
    *((int *)t2) = 1;
    t3 = (t0 + 3360);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(26, ng0);
    t4 = (t0 + 1768);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(27, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 7, 0LL);

LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(26, ng0);
    t13 = ((char*)((ng1)));
    t14 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t14, t13, 0, 0, 7, 0LL);
    goto LAB7;

}

static void Always_30_1(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 3576U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 3384);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(30, ng0);
    t4 = (t0 + 2088);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t3, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t7) == 0)
        goto LAB5;

LAB7:    t13 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t13) = 1;

LAB8:    t14 = (t3 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t3) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB10;

LAB9:    t22 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t24, t3, 0, 0, 1, 0LL);
    goto LAB2;

LAB5:    *((unsigned int *)t3) = 1;
    goto LAB8;

LAB10:    t18 = *((unsigned int *)t3);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t3) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB9;

}

static void Initial_33_2(char *t0)
{
    char t4[16];
    char t7[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t8;
    char *t9;
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
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;

LAB0:    t1 = (t0 + 3824U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(33, ng0);

LAB4:    xsi_set_current_line(35, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(35, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(35, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2248);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(36, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(36, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(36, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(46, ng0);
    t2 = (t0 + 4160);
    *((int *)t2) = 1;
    t3 = (t0 + 3856);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 3632);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(47, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(50, ng0);
    t2 = (t0 + 4176);
    *((int *)t2) = 1;
    t3 = (t0 + 3856);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB7;
    goto LAB1;

LAB7:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 3632);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB8;
    goto LAB1;

LAB8:    xsi_set_current_line(51, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(52, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(52, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(52, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(53, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1.0000000000000000);
    xsi_vlogfile_write(1, 0, 0, ng3, 2, t0, (char)118, t4, 64);
    xsi_set_current_line(56, ng0);
    t2 = (t0 + 4192);
    *((int *)t2) = 1;
    t3 = (t0 + 3856);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB9;
    goto LAB1;

LAB9:    xsi_set_current_line(56, ng0);
    t2 = (t0 + 3632);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB10;
    goto LAB1;

LAB10:    xsi_set_current_line(58, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng4)));
    memset(t7, 0, 8);
    t8 = (t5 + 4);
    t9 = (t6 + 4);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t8);
    t14 = *((unsigned int *)t9);
    t15 = (t13 ^ t14);
    t16 = (t12 | t15);
    t17 = *((unsigned int *)t8);
    t18 = *((unsigned int *)t9);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB14;

LAB11:    if (t19 != 0)
        goto LAB13;

LAB12:    *((unsigned int *)t7) = 1;

LAB14:    t23 = (t7 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t7);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB15;

LAB16:    xsi_set_current_line(59, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1.0000000000000000);
    t3 = (t0 + 2408);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    xsi_vlogfile_write(1, 0, 0, ng6, 3, t0, (char)118, t4, 64, (char)118, t6, 7);

LAB17:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 4208);
    *((int *)t2) = 1;
    t3 = (t0 + 3856);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB18;
    goto LAB1;

LAB13:    t22 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB14;

LAB15:    xsi_set_current_line(58, ng0);
    t29 = xsi_vlog_time(t4, 1000.0000000000000, 1.0000000000000000);
    t30 = (t0 + 2408);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    xsi_vlogfile_write(1, 0, 0, ng5, 3, t0, (char)118, t4, 64, (char)118, t32, 7);
    goto LAB17;

LAB18:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 3632);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB19:    xsi_set_current_line(65, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1.0000000000000000);
    xsi_vlogfile_write(1, 0, 0, ng7, 2, t0, (char)118, t4, 64);
    xsi_set_current_line(66, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(66, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(66, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(67, ng0);

LAB20:    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng8)));
    memset(t7, 0, 8);
    t8 = (t5 + 4);
    t9 = (t6 + 4);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t8);
    t14 = *((unsigned int *)t9);
    t15 = (t13 ^ t14);
    t16 = (t12 | t15);
    t17 = *((unsigned int *)t8);
    t18 = *((unsigned int *)t9);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB24;

LAB21:    if (t19 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t7) = 1;

LAB24:    t23 = (t7 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t7);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB26;

LAB25:    t29 = (t0 + 4224);
    *((int *)t29) = 1;
    t30 = (t0 + 3824U);
    *((char **)t30) = &&LAB20;
    goto LAB1;

LAB23:    t22 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB24;

LAB26:    t31 = (t0 + 4224);
    *((int *)t31) = 0;
    xsi_set_current_line(67, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1.0000000000000000);
    t3 = (t0 + 2408);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    xsi_vlogfile_write(1, 0, 0, ng9, 3, t0, (char)118, t4, 64, (char)118, t6, 7);
    xsi_set_current_line(68, ng0);
    t2 = (t0 + 3632);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB27:    xsi_set_current_line(68, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(68, ng0);
    t2 = (t0 + 3632);
    xsi_process_wait(t2, 30000LL);
    *((char **)t1) = &&LAB28;
    goto LAB1;

LAB28:    xsi_set_current_line(69, ng0);
    t2 = (t0 + 4240);
    *((int *)t2) = 1;
    t3 = (t0 + 3856);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB29;
    goto LAB1;

LAB29:    xsi_set_current_line(69, ng0);
    t2 = (t0 + 3632);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB30;
    goto LAB1;

LAB30:    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(71, ng0);

LAB31:    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng10)));
    memset(t7, 0, 8);
    t8 = (t5 + 4);
    t9 = (t6 + 4);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t8);
    t14 = *((unsigned int *)t9);
    t15 = (t13 ^ t14);
    t16 = (t12 | t15);
    t17 = *((unsigned int *)t8);
    t18 = *((unsigned int *)t9);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB35;

LAB32:    if (t19 != 0)
        goto LAB34;

LAB33:    *((unsigned int *)t7) = 1;

LAB35:    t23 = (t7 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t7);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB37;

LAB36:    t29 = (t0 + 4256);
    *((int *)t29) = 1;
    t30 = (t0 + 3824U);
    *((char **)t30) = &&LAB31;
    goto LAB1;

LAB34:    t22 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB35;

LAB37:    t31 = (t0 + 4256);
    *((int *)t31) = 0;
    xsi_set_current_line(71, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1.0000000000000000);
    t3 = (t0 + 2408);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    xsi_vlogfile_write(1, 0, 0, ng11, 3, t0, (char)118, t4, 64, (char)118, t6, 7);
    xsi_set_current_line(72, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(75, ng0);
    t2 = (t0 + 4272);
    *((int *)t2) = 1;
    t3 = (t0 + 3856);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB38;
    goto LAB1;

LAB38:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 3632);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB39;
    goto LAB1;

LAB39:    xsi_set_current_line(76, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(76, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(76, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(77, ng0);

LAB40:    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng12)));
    memset(t7, 0, 8);
    t8 = (t5 + 4);
    t9 = (t6 + 4);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t8);
    t14 = *((unsigned int *)t9);
    t15 = (t13 ^ t14);
    t16 = (t12 | t15);
    t17 = *((unsigned int *)t8);
    t18 = *((unsigned int *)t9);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB44;

LAB41:    if (t19 != 0)
        goto LAB43;

LAB42:    *((unsigned int *)t7) = 1;

LAB44:    t23 = (t7 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t7);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB46;

LAB45:    t29 = (t0 + 4288);
    *((int *)t29) = 1;
    t30 = (t0 + 3824U);
    *((char **)t30) = &&LAB40;
    goto LAB1;

LAB43:    t22 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB44;

LAB46:    t31 = (t0 + 4288);
    *((int *)t31) = 0;
    xsi_set_current_line(77, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1.0000000000000000);
    t3 = (t0 + 2408);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    xsi_vlogfile_write(1, 0, 0, ng13, 3, t0, (char)118, t4, 64, (char)118, t6, 7);
    xsi_set_current_line(78, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(82, ng0);
    t2 = (t0 + 4304);
    *((int *)t2) = 1;
    t3 = (t0 + 3856);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB47;
    goto LAB1;

LAB47:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 3632);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB48;
    goto LAB1;

LAB48:    xsi_set_current_line(83, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1.0000000000000000);
    xsi_vlogfile_write(1, 0, 0, ng7, 2, t0, (char)118, t4, 64);
    xsi_set_current_line(84, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(84, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(84, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(85, ng0);

LAB49:    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng10)));
    memset(t7, 0, 8);
    t8 = (t5 + 4);
    t9 = (t6 + 4);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t8);
    t14 = *((unsigned int *)t9);
    t15 = (t13 ^ t14);
    t16 = (t12 | t15);
    t17 = *((unsigned int *)t8);
    t18 = *((unsigned int *)t9);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB53;

LAB50:    if (t19 != 0)
        goto LAB52;

LAB51:    *((unsigned int *)t7) = 1;

LAB53:    t23 = (t7 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t7);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB55;

LAB54:    t29 = (t0 + 4320);
    *((int *)t29) = 1;
    t30 = (t0 + 3824U);
    *((char **)t30) = &&LAB49;
    goto LAB1;

LAB52:    t22 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB53;

LAB55:    t31 = (t0 + 4320);
    *((int *)t31) = 0;
    xsi_set_current_line(85, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1.0000000000000000);
    t3 = (t0 + 2408);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    xsi_vlogfile_write(1, 0, 0, ng9, 3, t0, (char)118, t4, 64, (char)118, t6, 7);
    xsi_set_current_line(86, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(89, ng0);
    t2 = (t0 + 4336);
    *((int *)t2) = 1;
    t3 = (t0 + 3856);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB56;
    goto LAB1;

LAB56:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 3632);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB57;
    goto LAB1;

LAB57:    xsi_set_current_line(90, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(90, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(90, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(91, ng0);

LAB58:    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng8)));
    memset(t7, 0, 8);
    t8 = (t5 + 4);
    t9 = (t6 + 4);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t8);
    t14 = *((unsigned int *)t9);
    t15 = (t13 ^ t14);
    t16 = (t12 | t15);
    t17 = *((unsigned int *)t8);
    t18 = *((unsigned int *)t9);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB62;

LAB59:    if (t19 != 0)
        goto LAB61;

LAB60:    *((unsigned int *)t7) = 1;

LAB62:    t23 = (t7 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t7);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB64;

LAB63:    t29 = (t0 + 4352);
    *((int *)t29) = 1;
    t30 = (t0 + 3824U);
    *((char **)t30) = &&LAB58;
    goto LAB1;

LAB61:    t22 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB62;

LAB64:    t31 = (t0 + 4352);
    *((int *)t31) = 0;
    xsi_set_current_line(91, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1.0000000000000000);
    t3 = (t0 + 2408);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    xsi_vlogfile_write(1, 0, 0, ng14, 3, t0, (char)118, t4, 64, (char)118, t6, 7);
    xsi_set_current_line(92, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(96, ng0);
    t2 = (t0 + 4368);
    *((int *)t2) = 1;
    t3 = (t0 + 3856);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB65;
    goto LAB1;

LAB65:    xsi_set_current_line(96, ng0);
    t2 = (t0 + 3632);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB66;
    goto LAB1;

LAB66:    xsi_set_current_line(97, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1.0000000000000000);
    xsi_vlogfile_write(1, 0, 0, ng15, 2, t0, (char)118, t4, 64);
    xsi_set_current_line(98, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(98, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(98, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(99, ng0);

LAB67:    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng4)));
    memset(t7, 0, 8);
    t8 = (t5 + 4);
    t9 = (t6 + 4);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t8);
    t14 = *((unsigned int *)t9);
    t15 = (t13 ^ t14);
    t16 = (t12 | t15);
    t17 = *((unsigned int *)t8);
    t18 = *((unsigned int *)t9);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB71;

LAB68:    if (t19 != 0)
        goto LAB70;

LAB69:    *((unsigned int *)t7) = 1;

LAB71:    t23 = (t7 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t7);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB73;

LAB72:    t29 = (t0 + 4384);
    *((int *)t29) = 1;
    t30 = (t0 + 3824U);
    *((char **)t30) = &&LAB67;
    goto LAB1;

LAB70:    t22 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB71;

LAB73:    t31 = (t0 + 4384);
    *((int *)t31) = 0;
    xsi_set_current_line(99, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1.0000000000000000);
    t3 = (t0 + 2408);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    xsi_vlogfile_write(1, 0, 0, ng16, 3, t0, (char)118, t4, 64, (char)118, t6, 7);
    xsi_set_current_line(100, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(102, ng0);
    t2 = (t0 + 4400);
    *((int *)t2) = 1;
    t3 = (t0 + 3856);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB74;
    goto LAB1;

LAB74:    xsi_set_current_line(102, ng0);
    t2 = (t0 + 3632);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB75;
    goto LAB1;

LAB75:    xsi_set_current_line(103, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1.0000000000000000);
    xsi_vlogfile_write(1, 0, 0, ng17, 2, t0, (char)118, t4, 64);
    xsi_set_current_line(104, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(104, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(104, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(105, ng0);

LAB76:    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng18)));
    memset(t7, 0, 8);
    t8 = (t5 + 4);
    t9 = (t6 + 4);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t8);
    t14 = *((unsigned int *)t9);
    t15 = (t13 ^ t14);
    t16 = (t12 | t15);
    t17 = *((unsigned int *)t8);
    t18 = *((unsigned int *)t9);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB80;

LAB77:    if (t19 != 0)
        goto LAB79;

LAB78:    *((unsigned int *)t7) = 1;

LAB80:    t23 = (t7 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t7);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB82;

LAB81:    t29 = (t0 + 4416);
    *((int *)t29) = 1;
    t30 = (t0 + 3824U);
    *((char **)t30) = &&LAB76;
    goto LAB1;

LAB79:    t22 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB80;

LAB82:    t31 = (t0 + 4416);
    *((int *)t31) = 0;
    xsi_set_current_line(105, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1.0000000000000000);
    t3 = (t0 + 2408);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    xsi_vlogfile_write(1, 0, 0, ng19, 3, t0, (char)118, t4, 64, (char)118, t6, 7);
    xsi_set_current_line(106, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(108, ng0);
    t2 = (t0 + 4432);
    *((int *)t2) = 1;
    t3 = (t0 + 3856);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB83;
    goto LAB1;

LAB83:    xsi_set_current_line(108, ng0);
    t2 = (t0 + 3632);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB84;
    goto LAB1;

LAB84:    xsi_set_current_line(109, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1.0000000000000000);
    xsi_vlogfile_write(1, 0, 0, ng20, 2, t0, (char)118, t4, 64);
    xsi_set_current_line(110, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(110, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(110, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(111, ng0);

LAB85:    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng21)));
    memset(t7, 0, 8);
    t8 = (t5 + 4);
    t9 = (t6 + 4);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t8);
    t14 = *((unsigned int *)t9);
    t15 = (t13 ^ t14);
    t16 = (t12 | t15);
    t17 = *((unsigned int *)t8);
    t18 = *((unsigned int *)t9);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB89;

LAB86:    if (t19 != 0)
        goto LAB88;

LAB87:    *((unsigned int *)t7) = 1;

LAB89:    t23 = (t7 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t7);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB91;

LAB90:    t29 = (t0 + 4448);
    *((int *)t29) = 1;
    t30 = (t0 + 3824U);
    *((char **)t30) = &&LAB85;
    goto LAB1;

LAB88:    t22 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB89;

LAB91:    t31 = (t0 + 4448);
    *((int *)t31) = 0;
    xsi_set_current_line(111, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1.0000000000000000);
    t3 = (t0 + 2408);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    xsi_vlogfile_write(1, 0, 0, ng22, 3, t0, (char)118, t4, 64, (char)118, t6, 7);
    xsi_set_current_line(112, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(114, ng0);
    t2 = (t0 + 4464);
    *((int *)t2) = 1;
    t3 = (t0 + 3856);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB92;
    goto LAB1;

LAB92:    xsi_set_current_line(114, ng0);
    t2 = (t0 + 3632);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB93;
    goto LAB1;

LAB93:    xsi_set_current_line(115, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1.0000000000000000);
    xsi_vlogfile_write(1, 0, 0, ng23, 2, t0, (char)118, t4, 64);
    xsi_set_current_line(116, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(116, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(116, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(117, ng0);

LAB94:    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng24)));
    memset(t7, 0, 8);
    t8 = (t5 + 4);
    t9 = (t6 + 4);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t8);
    t14 = *((unsigned int *)t9);
    t15 = (t13 ^ t14);
    t16 = (t12 | t15);
    t17 = *((unsigned int *)t8);
    t18 = *((unsigned int *)t9);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB98;

LAB95:    if (t19 != 0)
        goto LAB97;

LAB96:    *((unsigned int *)t7) = 1;

LAB98:    t23 = (t7 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t7);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB100;

LAB99:    t29 = (t0 + 4480);
    *((int *)t29) = 1;
    t30 = (t0 + 3824U);
    *((char **)t30) = &&LAB94;
    goto LAB1;

LAB97:    t22 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB98;

LAB100:    t31 = (t0 + 4480);
    *((int *)t31) = 0;
    xsi_set_current_line(117, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1.0000000000000000);
    t3 = (t0 + 2408);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    xsi_vlogfile_write(1, 0, 0, ng25, 3, t0, (char)118, t4, 64, (char)118, t6, 7);
    xsi_set_current_line(118, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(121, ng0);
    t2 = (t0 + 4496);
    *((int *)t2) = 1;
    t3 = (t0 + 3856);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB101;
    goto LAB1;

LAB101:    xsi_set_current_line(121, ng0);
    t2 = (t0 + 3632);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB102;
    goto LAB1;

LAB102:    xsi_set_current_line(122, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(122, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(122, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(123, ng0);

LAB103:    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng21)));
    memset(t7, 0, 8);
    t8 = (t5 + 4);
    t9 = (t6 + 4);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t8);
    t14 = *((unsigned int *)t9);
    t15 = (t13 ^ t14);
    t16 = (t12 | t15);
    t17 = *((unsigned int *)t8);
    t18 = *((unsigned int *)t9);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB107;

LAB104:    if (t19 != 0)
        goto LAB106;

LAB105:    *((unsigned int *)t7) = 1;

LAB107:    t23 = (t7 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t7);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB109;

LAB108:    t29 = (t0 + 4512);
    *((int *)t29) = 1;
    t30 = (t0 + 3824U);
    *((char **)t30) = &&LAB103;
    goto LAB1;

LAB106:    t22 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB107;

LAB109:    t31 = (t0 + 4512);
    *((int *)t31) = 0;
    xsi_set_current_line(123, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1.0000000000000000);
    t3 = (t0 + 2408);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    xsi_vlogfile_write(1, 0, 0, ng26, 3, t0, (char)118, t4, 64, (char)118, t6, 7);
    xsi_set_current_line(124, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(128, ng0);
    t2 = (t0 + 4528);
    *((int *)t2) = 1;
    t3 = (t0 + 3856);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB110;
    goto LAB1;

LAB110:    xsi_set_current_line(128, ng0);
    t2 = (t0 + 3632);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB111;
    goto LAB1;

LAB111:    xsi_set_current_line(129, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1.0000000000000000);
    xsi_vlogfile_write(1, 0, 0, ng23, 2, t0, (char)118, t4, 64);
    xsi_set_current_line(130, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(130, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(130, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(131, ng0);

LAB112:    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng24)));
    memset(t7, 0, 8);
    t8 = (t5 + 4);
    t9 = (t6 + 4);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t8);
    t14 = *((unsigned int *)t9);
    t15 = (t13 ^ t14);
    t16 = (t12 | t15);
    t17 = *((unsigned int *)t8);
    t18 = *((unsigned int *)t9);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB116;

LAB113:    if (t19 != 0)
        goto LAB115;

LAB114:    *((unsigned int *)t7) = 1;

LAB116:    t23 = (t7 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t7);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB118;

LAB117:    t29 = (t0 + 4544);
    *((int *)t29) = 1;
    t30 = (t0 + 3824U);
    *((char **)t30) = &&LAB112;
    goto LAB1;

LAB115:    t22 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB116;

LAB118:    t31 = (t0 + 4544);
    *((int *)t31) = 0;
    xsi_set_current_line(131, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1.0000000000000000);
    t3 = (t0 + 2408);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    xsi_vlogfile_write(1, 0, 0, ng25, 3, t0, (char)118, t4, 64, (char)118, t6, 7);
    xsi_set_current_line(132, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(135, ng0);
    t2 = (t0 + 4560);
    *((int *)t2) = 1;
    t3 = (t0 + 3856);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB119;
    goto LAB1;

LAB119:    xsi_set_current_line(135, ng0);
    t2 = (t0 + 3632);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB120;
    goto LAB1;

LAB120:    xsi_set_current_line(136, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(136, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(136, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(137, ng0);

LAB121:    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng21)));
    memset(t7, 0, 8);
    t8 = (t5 + 4);
    t9 = (t6 + 4);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t8);
    t14 = *((unsigned int *)t9);
    t15 = (t13 ^ t14);
    t16 = (t12 | t15);
    t17 = *((unsigned int *)t8);
    t18 = *((unsigned int *)t9);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB125;

LAB122:    if (t19 != 0)
        goto LAB124;

LAB123:    *((unsigned int *)t7) = 1;

LAB125:    t23 = (t7 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t7);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB127;

LAB126:    t29 = (t0 + 4576);
    *((int *)t29) = 1;
    t30 = (t0 + 3824U);
    *((char **)t30) = &&LAB121;
    goto LAB1;

LAB124:    t22 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB125;

LAB127:    t31 = (t0 + 4576);
    *((int *)t31) = 0;
    xsi_set_current_line(137, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1.0000000000000000);
    t3 = (t0 + 2408);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    xsi_vlogfile_write(1, 0, 0, ng26, 3, t0, (char)118, t4, 64, (char)118, t6, 7);
    xsi_set_current_line(138, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(142, ng0);
    t2 = (t0 + 4592);
    *((int *)t2) = 1;
    t3 = (t0 + 3856);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB128;
    goto LAB1;

LAB128:    xsi_set_current_line(142, ng0);
    t2 = (t0 + 3632);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB129;
    goto LAB1;

LAB129:    xsi_set_current_line(143, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1.0000000000000000);
    xsi_vlogfile_write(1, 0, 0, ng23, 2, t0, (char)118, t4, 64);
    xsi_set_current_line(144, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(144, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(144, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(145, ng0);

LAB130:    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng24)));
    memset(t7, 0, 8);
    t8 = (t5 + 4);
    t9 = (t6 + 4);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t8);
    t14 = *((unsigned int *)t9);
    t15 = (t13 ^ t14);
    t16 = (t12 | t15);
    t17 = *((unsigned int *)t8);
    t18 = *((unsigned int *)t9);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB134;

LAB131:    if (t19 != 0)
        goto LAB133;

LAB132:    *((unsigned int *)t7) = 1;

LAB134:    t23 = (t7 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t7);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB136;

LAB135:    t29 = (t0 + 4608);
    *((int *)t29) = 1;
    t30 = (t0 + 3824U);
    *((char **)t30) = &&LAB130;
    goto LAB1;

LAB133:    t22 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB134;

LAB136:    t31 = (t0 + 4608);
    *((int *)t31) = 0;
    xsi_set_current_line(145, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1.0000000000000000);
    t3 = (t0 + 2408);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    xsi_vlogfile_write(1, 0, 0, ng25, 3, t0, (char)118, t4, 64, (char)118, t6, 7);
    xsi_set_current_line(146, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(149, ng0);
    t2 = (t0 + 4624);
    *((int *)t2) = 1;
    t3 = (t0 + 3856);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB137;
    goto LAB1;

LAB137:    xsi_set_current_line(149, ng0);
    t2 = (t0 + 3632);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB138;
    goto LAB1;

LAB138:    xsi_set_current_line(150, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(150, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(150, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(151, ng0);

LAB139:    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng27)));
    memset(t7, 0, 8);
    t8 = (t5 + 4);
    t9 = (t6 + 4);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t8);
    t14 = *((unsigned int *)t9);
    t15 = (t13 ^ t14);
    t16 = (t12 | t15);
    t17 = *((unsigned int *)t8);
    t18 = *((unsigned int *)t9);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB143;

LAB140:    if (t19 != 0)
        goto LAB142;

LAB141:    *((unsigned int *)t7) = 1;

LAB143:    t23 = (t7 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t7);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB145;

LAB144:    t29 = (t0 + 4640);
    *((int *)t29) = 1;
    t30 = (t0 + 3824U);
    *((char **)t30) = &&LAB139;
    goto LAB1;

LAB142:    t22 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB143;

LAB145:    t31 = (t0 + 4640);
    *((int *)t31) = 0;
    xsi_set_current_line(151, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1.0000000000000000);
    t3 = (t0 + 2408);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    xsi_vlogfile_write(1, 0, 0, ng28, 3, t0, (char)118, t4, 64, (char)118, t6, 7);
    xsi_set_current_line(152, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(164, ng0);
    xsi_vlog_finish(1);
    goto LAB1;

}


extern void work_m_00000000002326680308_0521550836_init()
{
	static char *pe[] = {(void *)Always_25_0,(void *)Always_30_1,(void *)Initial_33_2};
	xsi_register_didat("work_m_00000000002326680308_0521550836", "isim/scorer_tb_isim_beh.exe.sim/work/m_00000000002326680308_0521550836.didat");
	xsi_register_executes(pe);
}
