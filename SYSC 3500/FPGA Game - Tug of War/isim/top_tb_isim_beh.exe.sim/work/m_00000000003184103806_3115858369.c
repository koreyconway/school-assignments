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
static const char *ng0 = "//ugradfs/kconway1/win/ELEC3500/Lab 9/xilinx/top_tb.v";
static int ng1[] = {0, 0};
static const char *ng2 = "%t - Resetting ";
static int ng3[] = {1, 0};
static unsigned int ng4[] = {0U, 0U};
static const char *ng5 = "Right pushes first (at correct time)";
static int ng6[] = {5, 0};
static const char *ng7 = "Resetting game";
static const char *ng8 = "Left pushes first (at correct time)";
static const char *ng9 = "Right pushes first (jump the gun)";
static const char *ng10 = "%t - Left pushes first (at correct time)";
static const char *ng11 = "Left pushes first (jump the gun)";



static void Always_29_0(char *t0)
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

LAB0:    t1 = (t0 + 2848U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(29, ng0);
    t2 = (t0 + 2656);
    xsi_process_wait(t2, 20000LL);
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(29, ng0);
    t4 = (t0 + 1768);
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
    t24 = (t0 + 1768);
    xsi_vlogvar_assign_value(t24, t3, 0, 0, 1);
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

static void Initial_31_1(char *t0)
{
    char t4[16];
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t6;
    char *t7;
    unsigned int t8;
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
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t28;
    char *t29;
    int t30;

LAB0:    t1 = (t0 + 3096U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(31, ng0);

LAB4:    xsi_set_current_line(33, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(34, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(35, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(36, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(39, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1000.0000000000000);
    xsi_vlogfile_write(1, 0, 0, ng2, 2, t0, (char)118, t4, 64);
    xsi_set_current_line(40, ng0);
    t2 = (t0 + 3416);
    *((int *)t2) = 1;
    t3 = (t0 + 3128);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 15000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(40, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(42, ng0);
    t2 = (t0 + 3432);
    *((int *)t2) = 1;
    t3 = (t0 + 3128);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB7;
    goto LAB1;

LAB7:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 5000LL);
    *((char **)t1) = &&LAB8;
    goto LAB1;

LAB8:    xsi_set_current_line(42, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(46, ng0);

LAB9:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB13;

LAB10:    if (t17 != 0)
        goto LAB12;

LAB11:    *((unsigned int *)t5) = 1;

LAB13:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB15;

LAB14:    t27 = (t0 + 3448);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB9;
    goto LAB1;

LAB12:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB13;

LAB15:    t29 = (t0 + 3448);
    *((int *)t29) = 0;
    xsi_set_current_line(47, ng0);

LAB16:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB18;

LAB17:    if (t17 != 0)
        goto LAB19;

LAB20:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB22;

LAB21:    t27 = (t0 + 3464);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB16;
    goto LAB1;

LAB18:    *((unsigned int *)t5) = 1;
    goto LAB20;

LAB19:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB20;

LAB22:    t29 = (t0 + 3464);
    *((int *)t29) = 0;
    xsi_set_current_line(48, ng0);
    xsi_vlogfile_write(1, 0, 0, ng5, 1, t0);
    xsi_set_current_line(49, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB23:    xsi_set_current_line(49, ng0);
    t3 = ((char*)((ng3)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(49, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(50, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6436);
    *((int *)t6) = t30;

LAB24:    t7 = (t0 + 6436);
    if (*((int *)t7) > 0)
        goto LAB25;

LAB26:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB28;
    goto LAB1;

LAB25:    xsi_set_current_line(50, ng0);
    t20 = (t0 + 3480);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB27:    t2 = (t0 + 6436);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB24;

LAB28:    xsi_set_current_line(51, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(51, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(54, ng0);

LAB29:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB33;

LAB30:    if (t17 != 0)
        goto LAB32;

LAB31:    *((unsigned int *)t5) = 1;

LAB33:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB35;

LAB34:    t27 = (t0 + 3496);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB29;
    goto LAB1;

LAB32:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB33;

LAB35:    t29 = (t0 + 3496);
    *((int *)t29) = 0;
    xsi_set_current_line(55, ng0);

LAB36:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB38;

LAB37:    if (t17 != 0)
        goto LAB39;

LAB40:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB42;

LAB41:    t27 = (t0 + 3512);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB36;
    goto LAB1;

LAB38:    *((unsigned int *)t5) = 1;
    goto LAB40;

LAB39:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB40;

LAB42:    t29 = (t0 + 3512);
    *((int *)t29) = 0;
    xsi_set_current_line(56, ng0);
    xsi_vlogfile_write(1, 0, 0, ng5, 1, t0);
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB43;
    goto LAB1;

LAB43:    xsi_set_current_line(57, ng0);
    t3 = ((char*)((ng3)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(57, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6440);
    *((int *)t6) = t30;

LAB44:    t7 = (t0 + 6440);
    if (*((int *)t7) > 0)
        goto LAB45;

LAB46:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB48;
    goto LAB1;

LAB45:    xsi_set_current_line(58, ng0);
    t20 = (t0 + 3528);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB47;
    goto LAB1;

LAB47:    t2 = (t0 + 6440);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB44;

LAB48:    xsi_set_current_line(59, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(59, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(62, ng0);

LAB49:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB53;

LAB50:    if (t17 != 0)
        goto LAB52;

LAB51:    *((unsigned int *)t5) = 1;

LAB53:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB55;

LAB54:    t27 = (t0 + 3544);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB49;
    goto LAB1;

LAB52:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB53;

LAB55:    t29 = (t0 + 3544);
    *((int *)t29) = 0;
    xsi_set_current_line(63, ng0);

LAB56:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB58;

LAB57:    if (t17 != 0)
        goto LAB59;

LAB60:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB62;

LAB61:    t27 = (t0 + 3560);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB56;
    goto LAB1;

LAB58:    *((unsigned int *)t5) = 1;
    goto LAB60;

LAB59:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB60;

LAB62:    t29 = (t0 + 3560);
    *((int *)t29) = 0;
    xsi_set_current_line(64, ng0);
    xsi_vlogfile_write(1, 0, 0, ng5, 1, t0);
    xsi_set_current_line(65, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB63;
    goto LAB1;

LAB63:    xsi_set_current_line(65, ng0);
    t3 = ((char*)((ng3)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(65, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(66, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6444);
    *((int *)t6) = t30;

LAB64:    t7 = (t0 + 6444);
    if (*((int *)t7) > 0)
        goto LAB65;

LAB66:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB68;
    goto LAB1;

LAB65:    xsi_set_current_line(66, ng0);
    t20 = (t0 + 3576);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB67;
    goto LAB1;

LAB67:    t2 = (t0 + 6444);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB64;

LAB68:    xsi_set_current_line(67, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(67, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(70, ng0);

LAB69:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB73;

LAB70:    if (t17 != 0)
        goto LAB72;

LAB71:    *((unsigned int *)t5) = 1;

LAB73:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB75;

LAB74:    t27 = (t0 + 3592);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB69;
    goto LAB1;

LAB72:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB73;

LAB75:    t29 = (t0 + 3592);
    *((int *)t29) = 0;
    xsi_set_current_line(71, ng0);

LAB76:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB78;

LAB77:    if (t17 != 0)
        goto LAB79;

LAB80:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB82;

LAB81:    t27 = (t0 + 3608);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB76;
    goto LAB1;

LAB78:    *((unsigned int *)t5) = 1;
    goto LAB80;

LAB79:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB80;

LAB82:    t29 = (t0 + 3608);
    *((int *)t29) = 0;
    xsi_set_current_line(72, ng0);
    xsi_vlogfile_write(1, 0, 0, ng5, 1, t0);
    xsi_set_current_line(73, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB83;
    goto LAB1;

LAB83:    xsi_set_current_line(73, ng0);
    t3 = ((char*)((ng3)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(73, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(74, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6448);
    *((int *)t6) = t30;

LAB84:    t7 = (t0 + 6448);
    if (*((int *)t7) > 0)
        goto LAB85;

LAB86:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB88;
    goto LAB1;

LAB85:    xsi_set_current_line(74, ng0);
    t20 = (t0 + 3624);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB87;
    goto LAB1;

LAB87:    t2 = (t0 + 6448);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB84;

LAB88:    xsi_set_current_line(75, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(75, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(77, ng0);

LAB89:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB93;

LAB90:    if (t17 != 0)
        goto LAB92;

LAB91:    *((unsigned int *)t5) = 1;

LAB93:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB95;

LAB94:    t27 = (t0 + 3640);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB89;
    goto LAB1;

LAB92:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB93;

LAB95:    t29 = (t0 + 3640);
    *((int *)t29) = 0;
    xsi_set_current_line(78, ng0);
    xsi_vlogfile_write(1, 0, 0, ng7, 1, t0);
    xsi_set_current_line(79, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 5000LL);
    *((char **)t1) = &&LAB96;
    goto LAB1;

LAB96:    xsi_set_current_line(79, ng0);
    t3 = ((char*)((ng3)));
    t6 = (t0 + 1928);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(80, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 20000LL);
    *((char **)t1) = &&LAB97;
    goto LAB1;

LAB97:    xsi_set_current_line(80, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1928);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(85, ng0);

LAB98:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB102;

LAB99:    if (t17 != 0)
        goto LAB101;

LAB100:    *((unsigned int *)t5) = 1;

LAB102:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB104;

LAB103:    t27 = (t0 + 3656);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB98;
    goto LAB1;

LAB101:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB102;

LAB104:    t29 = (t0 + 3656);
    *((int *)t29) = 0;
    xsi_set_current_line(86, ng0);

LAB105:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB107;

LAB106:    if (t17 != 0)
        goto LAB108;

LAB109:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB111;

LAB110:    t27 = (t0 + 3672);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB105;
    goto LAB1;

LAB107:    *((unsigned int *)t5) = 1;
    goto LAB109;

LAB108:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB109;

LAB111:    t29 = (t0 + 3672);
    *((int *)t29) = 0;
    xsi_set_current_line(87, ng0);
    xsi_vlogfile_write(1, 0, 0, ng8, 1, t0);
    xsi_set_current_line(88, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB112;
    goto LAB1;

LAB112:    xsi_set_current_line(88, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(88, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(89, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6452);
    *((int *)t6) = t30;

LAB113:    t7 = (t0 + 6452);
    if (*((int *)t7) > 0)
        goto LAB114;

LAB115:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB117;
    goto LAB1;

LAB114:    xsi_set_current_line(89, ng0);
    t20 = (t0 + 3688);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB116;
    goto LAB1;

LAB116:    t2 = (t0 + 6452);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB113;

LAB117:    xsi_set_current_line(90, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(90, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(93, ng0);

LAB118:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB122;

LAB119:    if (t17 != 0)
        goto LAB121;

LAB120:    *((unsigned int *)t5) = 1;

LAB122:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB124;

LAB123:    t27 = (t0 + 3704);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB118;
    goto LAB1;

LAB121:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB122;

LAB124:    t29 = (t0 + 3704);
    *((int *)t29) = 0;
    xsi_set_current_line(94, ng0);

LAB125:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB127;

LAB126:    if (t17 != 0)
        goto LAB128;

LAB129:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB131;

LAB130:    t27 = (t0 + 3720);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB125;
    goto LAB1;

LAB127:    *((unsigned int *)t5) = 1;
    goto LAB129;

LAB128:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB129;

LAB131:    t29 = (t0 + 3720);
    *((int *)t29) = 0;
    xsi_set_current_line(95, ng0);
    xsi_vlogfile_write(1, 0, 0, ng8, 1, t0);
    xsi_set_current_line(96, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB132;
    goto LAB1;

LAB132:    xsi_set_current_line(96, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(96, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(97, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6456);
    *((int *)t6) = t30;

LAB133:    t7 = (t0 + 6456);
    if (*((int *)t7) > 0)
        goto LAB134;

LAB135:    xsi_set_current_line(98, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB137;
    goto LAB1;

LAB134:    xsi_set_current_line(97, ng0);
    t20 = (t0 + 3736);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB136;
    goto LAB1;

LAB136:    t2 = (t0 + 6456);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB133;

LAB137:    xsi_set_current_line(98, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(98, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(101, ng0);

LAB138:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB142;

LAB139:    if (t17 != 0)
        goto LAB141;

LAB140:    *((unsigned int *)t5) = 1;

LAB142:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB144;

LAB143:    t27 = (t0 + 3752);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB138;
    goto LAB1;

LAB141:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB142;

LAB144:    t29 = (t0 + 3752);
    *((int *)t29) = 0;
    xsi_set_current_line(102, ng0);

LAB145:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB147;

LAB146:    if (t17 != 0)
        goto LAB148;

LAB149:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB151;

LAB150:    t27 = (t0 + 3768);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB145;
    goto LAB1;

LAB147:    *((unsigned int *)t5) = 1;
    goto LAB149;

LAB148:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB149;

LAB151:    t29 = (t0 + 3768);
    *((int *)t29) = 0;
    xsi_set_current_line(103, ng0);
    xsi_vlogfile_write(1, 0, 0, ng8, 1, t0);
    xsi_set_current_line(104, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB152;
    goto LAB1;

LAB152:    xsi_set_current_line(104, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(104, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(105, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6460);
    *((int *)t6) = t30;

LAB153:    t7 = (t0 + 6460);
    if (*((int *)t7) > 0)
        goto LAB154;

LAB155:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB157;
    goto LAB1;

LAB154:    xsi_set_current_line(105, ng0);
    t20 = (t0 + 3784);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB156;
    goto LAB1;

LAB156:    t2 = (t0 + 6460);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB153;

LAB157:    xsi_set_current_line(106, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(106, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(109, ng0);

LAB158:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB162;

LAB159:    if (t17 != 0)
        goto LAB161;

LAB160:    *((unsigned int *)t5) = 1;

LAB162:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB164;

LAB163:    t27 = (t0 + 3800);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB158;
    goto LAB1;

LAB161:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB162;

LAB164:    t29 = (t0 + 3800);
    *((int *)t29) = 0;
    xsi_set_current_line(110, ng0);

LAB165:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB167;

LAB166:    if (t17 != 0)
        goto LAB168;

LAB169:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB171;

LAB170:    t27 = (t0 + 3816);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB165;
    goto LAB1;

LAB167:    *((unsigned int *)t5) = 1;
    goto LAB169;

LAB168:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB169;

LAB171:    t29 = (t0 + 3816);
    *((int *)t29) = 0;
    xsi_set_current_line(111, ng0);
    xsi_vlogfile_write(1, 0, 0, ng8, 1, t0);
    xsi_set_current_line(112, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB172;
    goto LAB1;

LAB172:    xsi_set_current_line(112, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(112, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(113, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6464);
    *((int *)t6) = t30;

LAB173:    t7 = (t0 + 6464);
    if (*((int *)t7) > 0)
        goto LAB174;

LAB175:    xsi_set_current_line(114, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB177;
    goto LAB1;

LAB174:    xsi_set_current_line(113, ng0);
    t20 = (t0 + 3832);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB176;
    goto LAB1;

LAB176:    t2 = (t0 + 6464);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB173;

LAB177:    xsi_set_current_line(114, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(114, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(119, ng0);

LAB178:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB182;

LAB179:    if (t17 != 0)
        goto LAB181;

LAB180:    *((unsigned int *)t5) = 1;

LAB182:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB184;

LAB183:    t27 = (t0 + 3848);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB178;
    goto LAB1;

LAB181:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB182;

LAB184:    t29 = (t0 + 3848);
    *((int *)t29) = 0;
    xsi_set_current_line(120, ng0);
    xsi_vlogfile_write(1, 0, 0, ng7, 1, t0);
    xsi_set_current_line(121, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 5000LL);
    *((char **)t1) = &&LAB185;
    goto LAB1;

LAB185:    xsi_set_current_line(121, ng0);
    t3 = ((char*)((ng3)));
    t6 = (t0 + 1928);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(122, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 20000LL);
    *((char **)t1) = &&LAB186;
    goto LAB1;

LAB186:    xsi_set_current_line(122, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1928);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(126, ng0);

LAB187:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB191;

LAB188:    if (t17 != 0)
        goto LAB190;

LAB189:    *((unsigned int *)t5) = 1;

LAB191:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB193;

LAB192:    t27 = (t0 + 3864);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB187;
    goto LAB1;

LAB190:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB191;

LAB193:    t29 = (t0 + 3864);
    *((int *)t29) = 0;
    xsi_set_current_line(127, ng0);

LAB194:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB196;

LAB195:    if (t17 != 0)
        goto LAB197;

LAB198:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB200;

LAB199:    t27 = (t0 + 3880);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB194;
    goto LAB1;

LAB196:    *((unsigned int *)t5) = 1;
    goto LAB198;

LAB197:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB198;

LAB200:    t29 = (t0 + 3880);
    *((int *)t29) = 0;
    xsi_set_current_line(128, ng0);
    xsi_vlogfile_write(1, 0, 0, ng5, 1, t0);
    xsi_set_current_line(129, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB201;
    goto LAB1;

LAB201:    xsi_set_current_line(129, ng0);
    t3 = ((char*)((ng3)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(129, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(130, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6468);
    *((int *)t6) = t30;

LAB202:    t7 = (t0 + 6468);
    if (*((int *)t7) > 0)
        goto LAB203;

LAB204:    xsi_set_current_line(131, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB206;
    goto LAB1;

LAB203:    xsi_set_current_line(130, ng0);
    t20 = (t0 + 3896);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB205;
    goto LAB1;

LAB205:    t2 = (t0 + 6468);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB202;

LAB206:    xsi_set_current_line(131, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(131, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(135, ng0);

LAB207:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB211;

LAB208:    if (t17 != 0)
        goto LAB210;

LAB209:    *((unsigned int *)t5) = 1;

LAB211:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB213;

LAB212:    t27 = (t0 + 3912);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB207;
    goto LAB1;

LAB210:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB211;

LAB213:    t29 = (t0 + 3912);
    *((int *)t29) = 0;
    xsi_set_current_line(136, ng0);
    xsi_vlogfile_write(1, 0, 0, ng9, 1, t0);
    xsi_set_current_line(137, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB214;
    goto LAB1;

LAB214:    xsi_set_current_line(137, ng0);
    t3 = ((char*)((ng3)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(137, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(138, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6472);
    *((int *)t6) = t30;

LAB215:    t7 = (t0 + 6472);
    if (*((int *)t7) > 0)
        goto LAB216;

LAB217:    xsi_set_current_line(139, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB219;
    goto LAB1;

LAB216:    xsi_set_current_line(138, ng0);
    t20 = (t0 + 3928);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB218;
    goto LAB1;

LAB218:    t2 = (t0 + 6472);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB215;

LAB219:    xsi_set_current_line(139, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(139, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(140, ng0);

LAB220:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB222;

LAB221:    if (t17 != 0)
        goto LAB223;

LAB224:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB226;

LAB225:    t27 = (t0 + 3944);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB220;
    goto LAB1;

LAB222:    *((unsigned int *)t5) = 1;
    goto LAB224;

LAB223:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB224;

LAB226:    t29 = (t0 + 3944);
    *((int *)t29) = 0;
    xsi_set_current_line(144, ng0);

LAB227:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB231;

LAB228:    if (t17 != 0)
        goto LAB230;

LAB229:    *((unsigned int *)t5) = 1;

LAB231:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB233;

LAB232:    t27 = (t0 + 3960);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB227;
    goto LAB1;

LAB230:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB231;

LAB233:    t29 = (t0 + 3960);
    *((int *)t29) = 0;
    xsi_set_current_line(145, ng0);

LAB234:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB236;

LAB235:    if (t17 != 0)
        goto LAB237;

LAB238:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB240;

LAB239:    t27 = (t0 + 3976);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB234;
    goto LAB1;

LAB236:    *((unsigned int *)t5) = 1;
    goto LAB238;

LAB237:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB238;

LAB240:    t29 = (t0 + 3976);
    *((int *)t29) = 0;
    xsi_set_current_line(146, ng0);
    xsi_vlogfile_write(1, 0, 0, ng8, 1, t0);
    xsi_set_current_line(147, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB241;
    goto LAB1;

LAB241:    xsi_set_current_line(147, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(147, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(148, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6476);
    *((int *)t6) = t30;

LAB242:    t7 = (t0 + 6476);
    if (*((int *)t7) > 0)
        goto LAB243;

LAB244:    xsi_set_current_line(149, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB246;
    goto LAB1;

LAB243:    xsi_set_current_line(148, ng0);
    t20 = (t0 + 3992);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB245;
    goto LAB1;

LAB245:    t2 = (t0 + 6476);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB242;

LAB246:    xsi_set_current_line(149, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(149, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(153, ng0);

LAB247:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB251;

LAB248:    if (t17 != 0)
        goto LAB250;

LAB249:    *((unsigned int *)t5) = 1;

LAB251:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB253;

LAB252:    t27 = (t0 + 4008);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB247;
    goto LAB1;

LAB250:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB251;

LAB253:    t29 = (t0 + 4008);
    *((int *)t29) = 0;
    xsi_set_current_line(154, ng0);

LAB254:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB256;

LAB255:    if (t17 != 0)
        goto LAB257;

LAB258:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB260;

LAB259:    t27 = (t0 + 4024);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB254;
    goto LAB1;

LAB256:    *((unsigned int *)t5) = 1;
    goto LAB258;

LAB257:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB258;

LAB260:    t29 = (t0 + 4024);
    *((int *)t29) = 0;
    xsi_set_current_line(155, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1000.0000000000000);
    xsi_vlogfile_write(1, 0, 0, ng10, 2, t0, (char)118, t4, 64);
    xsi_set_current_line(156, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB261;
    goto LAB1;

LAB261:    xsi_set_current_line(156, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(156, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(157, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6480);
    *((int *)t6) = t30;

LAB262:    t7 = (t0 + 6480);
    if (*((int *)t7) > 0)
        goto LAB263;

LAB264:    xsi_set_current_line(158, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB266;
    goto LAB1;

LAB263:    xsi_set_current_line(157, ng0);
    t20 = (t0 + 4040);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB265;
    goto LAB1;

LAB265:    t2 = (t0 + 6480);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB262;

LAB266:    xsi_set_current_line(158, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(158, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(162, ng0);

LAB267:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB271;

LAB268:    if (t17 != 0)
        goto LAB270;

LAB269:    *((unsigned int *)t5) = 1;

LAB271:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB273;

LAB272:    t27 = (t0 + 4056);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB267;
    goto LAB1;

LAB270:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB271;

LAB273:    t29 = (t0 + 4056);
    *((int *)t29) = 0;
    xsi_set_current_line(163, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 5000LL);
    *((char **)t1) = &&LAB274;
    goto LAB1;

LAB274:    xsi_set_current_line(164, ng0);

LAB275:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB277;

LAB276:    if (t17 != 0)
        goto LAB278;

LAB279:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB281;

LAB280:    t27 = (t0 + 4072);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB275;
    goto LAB1;

LAB277:    *((unsigned int *)t5) = 1;
    goto LAB279;

LAB278:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB279;

LAB281:    t29 = (t0 + 4072);
    *((int *)t29) = 0;
    xsi_set_current_line(165, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1000.0000000000000);
    xsi_vlogfile_write(1, 0, 0, ng10, 2, t0, (char)118, t4, 64);
    xsi_set_current_line(166, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB282;
    goto LAB1;

LAB282:    xsi_set_current_line(166, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(166, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(167, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6484);
    *((int *)t6) = t30;

LAB283:    t7 = (t0 + 6484);
    if (*((int *)t7) > 0)
        goto LAB284;

LAB285:    xsi_set_current_line(168, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB287;
    goto LAB1;

LAB284:    xsi_set_current_line(167, ng0);
    t20 = (t0 + 4088);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB286;
    goto LAB1;

LAB286:    t2 = (t0 + 6484);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB283;

LAB287:    xsi_set_current_line(168, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(168, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(173, ng0);

LAB288:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB292;

LAB289:    if (t17 != 0)
        goto LAB291;

LAB290:    *((unsigned int *)t5) = 1;

LAB292:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB294;

LAB293:    t27 = (t0 + 4104);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB288;
    goto LAB1;

LAB291:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB292;

LAB294:    t29 = (t0 + 4104);
    *((int *)t29) = 0;
    xsi_set_current_line(174, ng0);
    xsi_vlogfile_write(1, 0, 0, ng11, 1, t0);
    xsi_set_current_line(175, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB295;
    goto LAB1;

LAB295:    xsi_set_current_line(175, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(175, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(176, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6488);
    *((int *)t6) = t30;

LAB296:    t7 = (t0 + 6488);
    if (*((int *)t7) > 0)
        goto LAB297;

LAB298:    xsi_set_current_line(177, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB300;
    goto LAB1;

LAB297:    xsi_set_current_line(176, ng0);
    t20 = (t0 + 4120);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB299;
    goto LAB1;

LAB299:    t2 = (t0 + 6488);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB296;

LAB300:    xsi_set_current_line(177, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(177, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(178, ng0);

LAB301:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB303;

LAB302:    if (t17 != 0)
        goto LAB304;

LAB305:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB307;

LAB306:    t27 = (t0 + 4136);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB301;
    goto LAB1;

LAB303:    *((unsigned int *)t5) = 1;
    goto LAB305;

LAB304:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB305;

LAB307:    t29 = (t0 + 4136);
    *((int *)t29) = 0;
    xsi_set_current_line(182, ng0);

LAB308:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB312;

LAB309:    if (t17 != 0)
        goto LAB311;

LAB310:    *((unsigned int *)t5) = 1;

LAB312:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB314;

LAB313:    t27 = (t0 + 4152);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB308;
    goto LAB1;

LAB311:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB312;

LAB314:    t29 = (t0 + 4152);
    *((int *)t29) = 0;
    xsi_set_current_line(183, ng0);

LAB315:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB317;

LAB316:    if (t17 != 0)
        goto LAB318;

LAB319:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB321;

LAB320:    t27 = (t0 + 4168);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB315;
    goto LAB1;

LAB317:    *((unsigned int *)t5) = 1;
    goto LAB319;

LAB318:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB319;

LAB321:    t29 = (t0 + 4168);
    *((int *)t29) = 0;
    xsi_set_current_line(184, ng0);
    xsi_vlogfile_write(1, 0, 0, ng8, 1, t0);
    xsi_set_current_line(185, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB322;
    goto LAB1;

LAB322:    xsi_set_current_line(185, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(185, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(186, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6492);
    *((int *)t6) = t30;

LAB323:    t7 = (t0 + 6492);
    if (*((int *)t7) > 0)
        goto LAB324;

LAB325:    xsi_set_current_line(187, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB327;
    goto LAB1;

LAB324:    xsi_set_current_line(186, ng0);
    t20 = (t0 + 4184);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB326;
    goto LAB1;

LAB326:    t2 = (t0 + 6492);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB323;

LAB327:    xsi_set_current_line(187, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(187, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(191, ng0);

LAB328:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB332;

LAB329:    if (t17 != 0)
        goto LAB331;

LAB330:    *((unsigned int *)t5) = 1;

LAB332:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB334;

LAB333:    t27 = (t0 + 4200);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB328;
    goto LAB1;

LAB331:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB332;

LAB334:    t29 = (t0 + 4200);
    *((int *)t29) = 0;
    xsi_set_current_line(192, ng0);

LAB335:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB337;

LAB336:    if (t17 != 0)
        goto LAB338;

LAB339:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB341;

LAB340:    t27 = (t0 + 4216);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB335;
    goto LAB1;

LAB337:    *((unsigned int *)t5) = 1;
    goto LAB339;

LAB338:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB339;

LAB341:    t29 = (t0 + 4216);
    *((int *)t29) = 0;
    xsi_set_current_line(193, ng0);
    xsi_vlogfile_write(1, 0, 0, ng5, 1, t0);
    xsi_set_current_line(194, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB342;
    goto LAB1;

LAB342:    xsi_set_current_line(194, ng0);
    t3 = ((char*)((ng3)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(194, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(195, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6496);
    *((int *)t6) = t30;

LAB343:    t7 = (t0 + 6496);
    if (*((int *)t7) > 0)
        goto LAB344;

LAB345:    xsi_set_current_line(196, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB347;
    goto LAB1;

LAB344:    xsi_set_current_line(195, ng0);
    t20 = (t0 + 4232);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB346;
    goto LAB1;

LAB346:    t2 = (t0 + 6496);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB343;

LAB347:    xsi_set_current_line(196, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(196, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(200, ng0);

LAB348:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB352;

LAB349:    if (t17 != 0)
        goto LAB351;

LAB350:    *((unsigned int *)t5) = 1;

LAB352:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB354;

LAB353:    t27 = (t0 + 4248);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB348;
    goto LAB1;

LAB351:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB352;

LAB354:    t29 = (t0 + 4248);
    *((int *)t29) = 0;
    xsi_set_current_line(201, ng0);

LAB355:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB357;

LAB356:    if (t17 != 0)
        goto LAB358;

LAB359:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB361;

LAB360:    t27 = (t0 + 4264);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB355;
    goto LAB1;

LAB357:    *((unsigned int *)t5) = 1;
    goto LAB359;

LAB358:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB359;

LAB361:    t29 = (t0 + 4264);
    *((int *)t29) = 0;
    xsi_set_current_line(202, ng0);
    xsi_vlogfile_write(1, 0, 0, ng8, 1, t0);
    xsi_set_current_line(203, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB362;
    goto LAB1;

LAB362:    xsi_set_current_line(203, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(203, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(204, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6500);
    *((int *)t6) = t30;

LAB363:    t7 = (t0 + 6500);
    if (*((int *)t7) > 0)
        goto LAB364;

LAB365:    xsi_set_current_line(205, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB367;
    goto LAB1;

LAB364:    xsi_set_current_line(204, ng0);
    t20 = (t0 + 4280);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB366;
    goto LAB1;

LAB366:    t2 = (t0 + 6500);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB363;

LAB367:    xsi_set_current_line(205, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(205, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(209, ng0);

LAB368:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB372;

LAB369:    if (t17 != 0)
        goto LAB371;

LAB370:    *((unsigned int *)t5) = 1;

LAB372:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB374;

LAB373:    t27 = (t0 + 4296);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB368;
    goto LAB1;

LAB371:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB372;

LAB374:    t29 = (t0 + 4296);
    *((int *)t29) = 0;
    xsi_set_current_line(210, ng0);

LAB375:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB377;

LAB376:    if (t17 != 0)
        goto LAB378;

LAB379:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB381;

LAB380:    t27 = (t0 + 4312);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB375;
    goto LAB1;

LAB377:    *((unsigned int *)t5) = 1;
    goto LAB379;

LAB378:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB379;

LAB381:    t29 = (t0 + 4312);
    *((int *)t29) = 0;
    xsi_set_current_line(211, ng0);
    xsi_vlogfile_write(1, 0, 0, ng8, 1, t0);
    xsi_set_current_line(212, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB382;
    goto LAB1;

LAB382:    xsi_set_current_line(212, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(212, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(213, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6504);
    *((int *)t6) = t30;

LAB383:    t7 = (t0 + 6504);
    if (*((int *)t7) > 0)
        goto LAB384;

LAB385:    xsi_set_current_line(214, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB387;
    goto LAB1;

LAB384:    xsi_set_current_line(213, ng0);
    t20 = (t0 + 4328);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB386;
    goto LAB1;

LAB386:    t2 = (t0 + 6504);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB383;

LAB387:    xsi_set_current_line(214, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(214, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(218, ng0);

LAB388:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB392;

LAB389:    if (t17 != 0)
        goto LAB391;

LAB390:    *((unsigned int *)t5) = 1;

LAB392:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB394;

LAB393:    t27 = (t0 + 4344);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB388;
    goto LAB1;

LAB391:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB392;

LAB394:    t29 = (t0 + 4344);
    *((int *)t29) = 0;
    xsi_set_current_line(219, ng0);

LAB395:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB397;

LAB396:    if (t17 != 0)
        goto LAB398;

LAB399:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB401;

LAB400:    t27 = (t0 + 4360);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB395;
    goto LAB1;

LAB397:    *((unsigned int *)t5) = 1;
    goto LAB399;

LAB398:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB399;

LAB401:    t29 = (t0 + 4360);
    *((int *)t29) = 0;
    xsi_set_current_line(220, ng0);
    xsi_vlogfile_write(1, 0, 0, ng8, 1, t0);
    xsi_set_current_line(221, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB402;
    goto LAB1;

LAB402:    xsi_set_current_line(221, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(221, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(222, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6508);
    *((int *)t6) = t30;

LAB403:    t7 = (t0 + 6508);
    if (*((int *)t7) > 0)
        goto LAB404;

LAB405:    xsi_set_current_line(223, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB407;
    goto LAB1;

LAB404:    xsi_set_current_line(222, ng0);
    t20 = (t0 + 4376);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB406;
    goto LAB1;

LAB406:    t2 = (t0 + 6508);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB403;

LAB407:    xsi_set_current_line(223, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(223, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(225, ng0);

LAB408:    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t5, 0, 8);
    t6 = (t3 + 4);
    t7 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB412;

LAB409:    if (t17 != 0)
        goto LAB411;

LAB410:    *((unsigned int *)t5) = 1;

LAB412:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB414;

LAB413:    t27 = (t0 + 4392);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB408;
    goto LAB1;

LAB411:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB412;

LAB414:    t29 = (t0 + 4392);
    *((int *)t29) = 0;
    xsi_set_current_line(228, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 100000000LL);
    *((char **)t1) = &&LAB415;
    goto LAB1;

LAB415:    goto LAB1;

}


extern void work_m_00000000003184103806_3115858369_init()
{
	static char *pe[] = {(void *)Always_29_0,(void *)Initial_31_1};
	xsi_register_didat("work_m_00000000003184103806_3115858369", "isim/top_tb_isim_beh.exe.sim/work/m_00000000003184103806_3115858369.didat");
	xsi_register_executes(pe);
}
