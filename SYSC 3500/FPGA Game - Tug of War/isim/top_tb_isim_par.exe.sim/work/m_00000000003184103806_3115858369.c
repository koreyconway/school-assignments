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
static const char *ng7 = "Left pushes first (at correct time)";
static const char *ng8 = "Right pushes first (jump the gun)";
static const char *ng9 = "%t - Left pushes first (at correct time)";
static const char *ng10 = "Left pushes first (jump the gun)";



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
    xsi_process_wait(t2, 976563000LL);
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
    xsi_process_wait(t2, 976563000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(40, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(41, ng0);
    t2 = (t0 + 3432);
    *((int *)t2) = 1;
    t3 = (t0 + 3128);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB7;
    goto LAB1;

LAB7:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 976563000LL);
    *((char **)t1) = &&LAB8;
    goto LAB1;

LAB8:    xsi_set_current_line(41, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(45, ng0);

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
    xsi_set_current_line(46, ng0);

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
    xsi_set_current_line(47, ng0);
    xsi_vlogfile_write(1, 0, 0, ng5, 1, t0);
    xsi_set_current_line(48, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB23:    xsi_set_current_line(48, ng0);
    t3 = ((char*)((ng3)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(48, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(49, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6500);
    *((int *)t6) = t30;

LAB24:    t7 = (t0 + 6500);
    if (*((int *)t7) > 0)
        goto LAB25;

LAB26:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB28;
    goto LAB1;

LAB25:    xsi_set_current_line(49, ng0);
    t20 = (t0 + 3480);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB27:    t2 = (t0 + 6500);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB24;

LAB28:    xsi_set_current_line(50, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(50, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(53, ng0);

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
    xsi_set_current_line(54, ng0);

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
    xsi_set_current_line(55, ng0);
    xsi_vlogfile_write(1, 0, 0, ng5, 1, t0);
    xsi_set_current_line(56, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB43;
    goto LAB1;

LAB43:    xsi_set_current_line(56, ng0);
    t3 = ((char*)((ng3)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(56, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(57, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6504);
    *((int *)t6) = t30;

LAB44:    t7 = (t0 + 6504);
    if (*((int *)t7) > 0)
        goto LAB45;

LAB46:    xsi_set_current_line(58, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB48;
    goto LAB1;

LAB45:    xsi_set_current_line(57, ng0);
    t20 = (t0 + 3528);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB47;
    goto LAB1;

LAB47:    t2 = (t0 + 6504);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB44;

LAB48:    xsi_set_current_line(58, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(61, ng0);

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
    xsi_set_current_line(62, ng0);

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
    xsi_set_current_line(63, ng0);
    xsi_vlogfile_write(1, 0, 0, ng5, 1, t0);
    xsi_set_current_line(64, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB63;
    goto LAB1;

LAB63:    xsi_set_current_line(64, ng0);
    t3 = ((char*)((ng3)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(64, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(65, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6508);
    *((int *)t6) = t30;

LAB64:    t7 = (t0 + 6508);
    if (*((int *)t7) > 0)
        goto LAB65;

LAB66:    xsi_set_current_line(66, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB68;
    goto LAB1;

LAB65:    xsi_set_current_line(65, ng0);
    t20 = (t0 + 3576);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB67;
    goto LAB1;

LAB67:    t2 = (t0 + 6508);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB64;

LAB68:    xsi_set_current_line(66, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(66, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(69, ng0);

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
    xsi_set_current_line(70, ng0);

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
    xsi_set_current_line(71, ng0);
    xsi_vlogfile_write(1, 0, 0, ng5, 1, t0);
    xsi_set_current_line(72, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB83;
    goto LAB1;

LAB83:    xsi_set_current_line(72, ng0);
    t3 = ((char*)((ng3)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(72, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(73, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6512);
    *((int *)t6) = t30;

LAB84:    t7 = (t0 + 6512);
    if (*((int *)t7) > 0)
        goto LAB85;

LAB86:    xsi_set_current_line(74, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB88;
    goto LAB1;

LAB85:    xsi_set_current_line(73, ng0);
    t20 = (t0 + 3624);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB87;
    goto LAB1;

LAB87:    t2 = (t0 + 6512);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB84;

LAB88:    xsi_set_current_line(74, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(74, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(76, ng0);

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
    xsi_set_current_line(77, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1000.0000000000000);
    xsi_vlogfile_write(1, 0, 0, ng2, 2, t0, (char)118, t4, 64);
    xsi_set_current_line(78, ng0);
    t2 = (t0 + 3656);
    *((int *)t2) = 1;
    t3 = (t0 + 3128);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB96;
    goto LAB1;

LAB96:    xsi_set_current_line(78, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 976563000LL);
    *((char **)t1) = &&LAB97;
    goto LAB1;

LAB97:    xsi_set_current_line(78, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(79, ng0);
    t2 = (t0 + 3672);
    *((int *)t2) = 1;
    t3 = (t0 + 3128);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB98;
    goto LAB1;

LAB98:    xsi_set_current_line(79, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 976563000LL);
    *((char **)t1) = &&LAB99;
    goto LAB1;

LAB99:    xsi_set_current_line(79, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(84, ng0);

LAB100:    t2 = (t0 + 1048U);
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
        goto LAB104;

LAB101:    if (t17 != 0)
        goto LAB103;

LAB102:    *((unsigned int *)t5) = 1;

LAB104:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB106;

LAB105:    t27 = (t0 + 3688);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB100;
    goto LAB1;

LAB103:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB104;

LAB106:    t29 = (t0 + 3688);
    *((int *)t29) = 0;
    xsi_set_current_line(85, ng0);

LAB107:    t2 = (t0 + 1048U);
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
        goto LAB109;

LAB108:    if (t17 != 0)
        goto LAB110;

LAB111:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB113;

LAB112:    t27 = (t0 + 3704);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB107;
    goto LAB1;

LAB109:    *((unsigned int *)t5) = 1;
    goto LAB111;

LAB110:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB111;

LAB113:    t29 = (t0 + 3704);
    *((int *)t29) = 0;
    xsi_set_current_line(86, ng0);
    xsi_vlogfile_write(1, 0, 0, ng7, 1, t0);
    xsi_set_current_line(87, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB114;
    goto LAB1;

LAB114:    xsi_set_current_line(87, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(87, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(88, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6516);
    *((int *)t6) = t30;

LAB115:    t7 = (t0 + 6516);
    if (*((int *)t7) > 0)
        goto LAB116;

LAB117:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB119;
    goto LAB1;

LAB116:    xsi_set_current_line(88, ng0);
    t20 = (t0 + 3720);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB118;
    goto LAB1;

LAB118:    t2 = (t0 + 6516);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB115;

LAB119:    xsi_set_current_line(89, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(89, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(92, ng0);

LAB120:    t2 = (t0 + 1048U);
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
        goto LAB124;

LAB121:    if (t17 != 0)
        goto LAB123;

LAB122:    *((unsigned int *)t5) = 1;

LAB124:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB126;

LAB125:    t27 = (t0 + 3736);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB120;
    goto LAB1;

LAB123:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB124;

LAB126:    t29 = (t0 + 3736);
    *((int *)t29) = 0;
    xsi_set_current_line(93, ng0);

LAB127:    t2 = (t0 + 1048U);
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
        goto LAB129;

LAB128:    if (t17 != 0)
        goto LAB130;

LAB131:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB133;

LAB132:    t27 = (t0 + 3752);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB127;
    goto LAB1;

LAB129:    *((unsigned int *)t5) = 1;
    goto LAB131;

LAB130:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB131;

LAB133:    t29 = (t0 + 3752);
    *((int *)t29) = 0;
    xsi_set_current_line(94, ng0);
    xsi_vlogfile_write(1, 0, 0, ng7, 1, t0);
    xsi_set_current_line(95, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB134;
    goto LAB1;

LAB134:    xsi_set_current_line(95, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(95, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(96, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6520);
    *((int *)t6) = t30;

LAB135:    t7 = (t0 + 6520);
    if (*((int *)t7) > 0)
        goto LAB136;

LAB137:    xsi_set_current_line(97, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB139;
    goto LAB1;

LAB136:    xsi_set_current_line(96, ng0);
    t20 = (t0 + 3768);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB138;
    goto LAB1;

LAB138:    t2 = (t0 + 6520);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB135;

LAB139:    xsi_set_current_line(97, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(97, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(100, ng0);

LAB140:    t2 = (t0 + 1048U);
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
        goto LAB144;

LAB141:    if (t17 != 0)
        goto LAB143;

LAB142:    *((unsigned int *)t5) = 1;

LAB144:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB146;

LAB145:    t27 = (t0 + 3784);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB140;
    goto LAB1;

LAB143:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB144;

LAB146:    t29 = (t0 + 3784);
    *((int *)t29) = 0;
    xsi_set_current_line(101, ng0);

LAB147:    t2 = (t0 + 1048U);
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
        goto LAB149;

LAB148:    if (t17 != 0)
        goto LAB150;

LAB151:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB153;

LAB152:    t27 = (t0 + 3800);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB147;
    goto LAB1;

LAB149:    *((unsigned int *)t5) = 1;
    goto LAB151;

LAB150:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB151;

LAB153:    t29 = (t0 + 3800);
    *((int *)t29) = 0;
    xsi_set_current_line(102, ng0);
    xsi_vlogfile_write(1, 0, 0, ng7, 1, t0);
    xsi_set_current_line(103, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB154;
    goto LAB1;

LAB154:    xsi_set_current_line(103, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(103, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(104, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6524);
    *((int *)t6) = t30;

LAB155:    t7 = (t0 + 6524);
    if (*((int *)t7) > 0)
        goto LAB156;

LAB157:    xsi_set_current_line(105, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB159;
    goto LAB1;

LAB156:    xsi_set_current_line(104, ng0);
    t20 = (t0 + 3816);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB158;
    goto LAB1;

LAB158:    t2 = (t0 + 6524);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB155;

LAB159:    xsi_set_current_line(105, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(105, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(108, ng0);

LAB160:    t2 = (t0 + 1048U);
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
        goto LAB164;

LAB161:    if (t17 != 0)
        goto LAB163;

LAB162:    *((unsigned int *)t5) = 1;

LAB164:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB166;

LAB165:    t27 = (t0 + 3832);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB160;
    goto LAB1;

LAB163:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB164;

LAB166:    t29 = (t0 + 3832);
    *((int *)t29) = 0;
    xsi_set_current_line(109, ng0);

LAB167:    t2 = (t0 + 1048U);
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
        goto LAB169;

LAB168:    if (t17 != 0)
        goto LAB170;

LAB171:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB173;

LAB172:    t27 = (t0 + 3848);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB167;
    goto LAB1;

LAB169:    *((unsigned int *)t5) = 1;
    goto LAB171;

LAB170:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB171;

LAB173:    t29 = (t0 + 3848);
    *((int *)t29) = 0;
    xsi_set_current_line(110, ng0);
    xsi_vlogfile_write(1, 0, 0, ng7, 1, t0);
    xsi_set_current_line(111, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB174;
    goto LAB1;

LAB174:    xsi_set_current_line(111, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(111, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(112, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6528);
    *((int *)t6) = t30;

LAB175:    t7 = (t0 + 6528);
    if (*((int *)t7) > 0)
        goto LAB176;

LAB177:    xsi_set_current_line(113, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB179;
    goto LAB1;

LAB176:    xsi_set_current_line(112, ng0);
    t20 = (t0 + 3864);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB178;
    goto LAB1;

LAB178:    t2 = (t0 + 6528);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB175;

LAB179:    xsi_set_current_line(113, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(113, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(118, ng0);

LAB180:    t2 = (t0 + 1048U);
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
        goto LAB184;

LAB181:    if (t17 != 0)
        goto LAB183;

LAB182:    *((unsigned int *)t5) = 1;

LAB184:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB186;

LAB185:    t27 = (t0 + 3880);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB180;
    goto LAB1;

LAB183:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB184;

LAB186:    t29 = (t0 + 3880);
    *((int *)t29) = 0;
    xsi_set_current_line(119, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1000.0000000000000);
    xsi_vlogfile_write(1, 0, 0, ng2, 2, t0, (char)118, t4, 64);
    xsi_set_current_line(120, ng0);
    t2 = (t0 + 3896);
    *((int *)t2) = 1;
    t3 = (t0 + 3128);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB187;
    goto LAB1;

LAB187:    xsi_set_current_line(120, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 976563000LL);
    *((char **)t1) = &&LAB188;
    goto LAB1;

LAB188:    xsi_set_current_line(120, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(121, ng0);
    t2 = (t0 + 3912);
    *((int *)t2) = 1;
    t3 = (t0 + 3128);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB189;
    goto LAB1;

LAB189:    xsi_set_current_line(121, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 976563000LL);
    *((char **)t1) = &&LAB190;
    goto LAB1;

LAB190:    xsi_set_current_line(121, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(125, ng0);

LAB191:    t2 = (t0 + 1048U);
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
        goto LAB195;

LAB192:    if (t17 != 0)
        goto LAB194;

LAB193:    *((unsigned int *)t5) = 1;

LAB195:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB197;

LAB196:    t27 = (t0 + 3928);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB191;
    goto LAB1;

LAB194:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB195;

LAB197:    t29 = (t0 + 3928);
    *((int *)t29) = 0;
    xsi_set_current_line(126, ng0);

LAB198:    t2 = (t0 + 1048U);
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
        goto LAB200;

LAB199:    if (t17 != 0)
        goto LAB201;

LAB202:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB204;

LAB203:    t27 = (t0 + 3944);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB198;
    goto LAB1;

LAB200:    *((unsigned int *)t5) = 1;
    goto LAB202;

LAB201:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB202;

LAB204:    t29 = (t0 + 3944);
    *((int *)t29) = 0;
    xsi_set_current_line(127, ng0);
    xsi_vlogfile_write(1, 0, 0, ng5, 1, t0);
    xsi_set_current_line(128, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB205;
    goto LAB1;

LAB205:    xsi_set_current_line(128, ng0);
    t3 = ((char*)((ng3)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(128, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(129, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6532);
    *((int *)t6) = t30;

LAB206:    t7 = (t0 + 6532);
    if (*((int *)t7) > 0)
        goto LAB207;

LAB208:    xsi_set_current_line(130, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB210;
    goto LAB1;

LAB207:    xsi_set_current_line(129, ng0);
    t20 = (t0 + 3960);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB209;
    goto LAB1;

LAB209:    t2 = (t0 + 6532);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB206;

LAB210:    xsi_set_current_line(130, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(130, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(134, ng0);

LAB211:    t2 = (t0 + 1048U);
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
        goto LAB215;

LAB212:    if (t17 != 0)
        goto LAB214;

LAB213:    *((unsigned int *)t5) = 1;

LAB215:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB217;

LAB216:    t27 = (t0 + 3976);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB211;
    goto LAB1;

LAB214:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB215;

LAB217:    t29 = (t0 + 3976);
    *((int *)t29) = 0;
    xsi_set_current_line(135, ng0);
    xsi_vlogfile_write(1, 0, 0, ng8, 1, t0);
    xsi_set_current_line(136, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB218;
    goto LAB1;

LAB218:    xsi_set_current_line(136, ng0);
    t3 = ((char*)((ng3)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(136, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(137, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6536);
    *((int *)t6) = t30;

LAB219:    t7 = (t0 + 6536);
    if (*((int *)t7) > 0)
        goto LAB220;

LAB221:    xsi_set_current_line(138, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB223;
    goto LAB1;

LAB220:    xsi_set_current_line(137, ng0);
    t20 = (t0 + 3992);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB222;
    goto LAB1;

LAB222:    t2 = (t0 + 6536);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB219;

LAB223:    xsi_set_current_line(138, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(138, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(139, ng0);

LAB224:    t2 = (t0 + 1048U);
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
        goto LAB226;

LAB225:    if (t17 != 0)
        goto LAB227;

LAB228:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB230;

LAB229:    t27 = (t0 + 4008);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB224;
    goto LAB1;

LAB226:    *((unsigned int *)t5) = 1;
    goto LAB228;

LAB227:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB228;

LAB230:    t29 = (t0 + 4008);
    *((int *)t29) = 0;
    xsi_set_current_line(143, ng0);

LAB231:    t2 = (t0 + 1048U);
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
        goto LAB235;

LAB232:    if (t17 != 0)
        goto LAB234;

LAB233:    *((unsigned int *)t5) = 1;

LAB235:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB237;

LAB236:    t27 = (t0 + 4024);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB231;
    goto LAB1;

LAB234:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB235;

LAB237:    t29 = (t0 + 4024);
    *((int *)t29) = 0;
    xsi_set_current_line(144, ng0);

LAB238:    t2 = (t0 + 1048U);
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
        goto LAB240;

LAB239:    if (t17 != 0)
        goto LAB241;

LAB242:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB244;

LAB243:    t27 = (t0 + 4040);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB238;
    goto LAB1;

LAB240:    *((unsigned int *)t5) = 1;
    goto LAB242;

LAB241:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB242;

LAB244:    t29 = (t0 + 4040);
    *((int *)t29) = 0;
    xsi_set_current_line(145, ng0);
    xsi_vlogfile_write(1, 0, 0, ng7, 1, t0);
    xsi_set_current_line(146, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB245;
    goto LAB1;

LAB245:    xsi_set_current_line(146, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(146, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(147, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6540);
    *((int *)t6) = t30;

LAB246:    t7 = (t0 + 6540);
    if (*((int *)t7) > 0)
        goto LAB247;

LAB248:    xsi_set_current_line(148, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB250;
    goto LAB1;

LAB247:    xsi_set_current_line(147, ng0);
    t20 = (t0 + 4056);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB249;
    goto LAB1;

LAB249:    t2 = (t0 + 6540);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB246;

LAB250:    xsi_set_current_line(148, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(148, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(152, ng0);

LAB251:    t2 = (t0 + 1048U);
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
        goto LAB255;

LAB252:    if (t17 != 0)
        goto LAB254;

LAB253:    *((unsigned int *)t5) = 1;

LAB255:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB257;

LAB256:    t27 = (t0 + 4072);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB251;
    goto LAB1;

LAB254:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB255;

LAB257:    t29 = (t0 + 4072);
    *((int *)t29) = 0;
    xsi_set_current_line(153, ng0);

LAB258:    t2 = (t0 + 1048U);
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
        goto LAB260;

LAB259:    if (t17 != 0)
        goto LAB261;

LAB262:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB264;

LAB263:    t27 = (t0 + 4088);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB258;
    goto LAB1;

LAB260:    *((unsigned int *)t5) = 1;
    goto LAB262;

LAB261:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB262;

LAB264:    t29 = (t0 + 4088);
    *((int *)t29) = 0;
    xsi_set_current_line(154, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1000.0000000000000);
    xsi_vlogfile_write(1, 0, 0, ng9, 2, t0, (char)118, t4, 64);
    xsi_set_current_line(155, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB265;
    goto LAB1;

LAB265:    xsi_set_current_line(155, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(155, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(156, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6544);
    *((int *)t6) = t30;

LAB266:    t7 = (t0 + 6544);
    if (*((int *)t7) > 0)
        goto LAB267;

LAB268:    xsi_set_current_line(157, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB270;
    goto LAB1;

LAB267:    xsi_set_current_line(156, ng0);
    t20 = (t0 + 4104);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB269;
    goto LAB1;

LAB269:    t2 = (t0 + 6544);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB266;

LAB270:    xsi_set_current_line(157, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(157, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(161, ng0);

LAB271:    t2 = (t0 + 1048U);
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
        goto LAB275;

LAB272:    if (t17 != 0)
        goto LAB274;

LAB273:    *((unsigned int *)t5) = 1;

LAB275:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB277;

LAB276:    t27 = (t0 + 4120);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB271;
    goto LAB1;

LAB274:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB275;

LAB277:    t29 = (t0 + 4120);
    *((int *)t29) = 0;
    xsi_set_current_line(162, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 5000LL);
    *((char **)t1) = &&LAB278;
    goto LAB1;

LAB278:    xsi_set_current_line(163, ng0);

LAB279:    t2 = (t0 + 1048U);
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
        goto LAB281;

LAB280:    if (t17 != 0)
        goto LAB282;

LAB283:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB285;

LAB284:    t27 = (t0 + 4136);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB279;
    goto LAB1;

LAB281:    *((unsigned int *)t5) = 1;
    goto LAB283;

LAB282:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB283;

LAB285:    t29 = (t0 + 4136);
    *((int *)t29) = 0;
    xsi_set_current_line(164, ng0);
    t2 = xsi_vlog_time(t4, 1000.0000000000000, 1000.0000000000000);
    xsi_vlogfile_write(1, 0, 0, ng9, 2, t0, (char)118, t4, 64);
    xsi_set_current_line(165, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB286;
    goto LAB1;

LAB286:    xsi_set_current_line(165, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(165, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(166, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6548);
    *((int *)t6) = t30;

LAB287:    t7 = (t0 + 6548);
    if (*((int *)t7) > 0)
        goto LAB288;

LAB289:    xsi_set_current_line(167, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB291;
    goto LAB1;

LAB288:    xsi_set_current_line(166, ng0);
    t20 = (t0 + 4152);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB290;
    goto LAB1;

LAB290:    t2 = (t0 + 6548);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB287;

LAB291:    xsi_set_current_line(167, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(167, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(172, ng0);

LAB292:    t2 = (t0 + 1048U);
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
        goto LAB296;

LAB293:    if (t17 != 0)
        goto LAB295;

LAB294:    *((unsigned int *)t5) = 1;

LAB296:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB298;

LAB297:    t27 = (t0 + 4168);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB292;
    goto LAB1;

LAB295:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB296;

LAB298:    t29 = (t0 + 4168);
    *((int *)t29) = 0;
    xsi_set_current_line(173, ng0);
    xsi_vlogfile_write(1, 0, 0, ng10, 1, t0);
    xsi_set_current_line(174, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB299;
    goto LAB1;

LAB299:    xsi_set_current_line(174, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(174, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(175, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6552);
    *((int *)t6) = t30;

LAB300:    t7 = (t0 + 6552);
    if (*((int *)t7) > 0)
        goto LAB301;

LAB302:    xsi_set_current_line(176, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB304;
    goto LAB1;

LAB301:    xsi_set_current_line(175, ng0);
    t20 = (t0 + 4184);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB303;
    goto LAB1;

LAB303:    t2 = (t0 + 6552);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB300;

LAB304:    xsi_set_current_line(176, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(176, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(177, ng0);

LAB305:    t2 = (t0 + 1048U);
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
        goto LAB307;

LAB306:    if (t17 != 0)
        goto LAB308;

LAB309:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB311;

LAB310:    t27 = (t0 + 4200);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB305;
    goto LAB1;

LAB307:    *((unsigned int *)t5) = 1;
    goto LAB309;

LAB308:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB309;

LAB311:    t29 = (t0 + 4200);
    *((int *)t29) = 0;
    xsi_set_current_line(181, ng0);

LAB312:    t2 = (t0 + 1048U);
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
        goto LAB316;

LAB313:    if (t17 != 0)
        goto LAB315;

LAB314:    *((unsigned int *)t5) = 1;

LAB316:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB318;

LAB317:    t27 = (t0 + 4216);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB312;
    goto LAB1;

LAB315:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB316;

LAB318:    t29 = (t0 + 4216);
    *((int *)t29) = 0;
    xsi_set_current_line(182, ng0);

LAB319:    t2 = (t0 + 1048U);
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
        goto LAB321;

LAB320:    if (t17 != 0)
        goto LAB322;

LAB323:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB325;

LAB324:    t27 = (t0 + 4232);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB319;
    goto LAB1;

LAB321:    *((unsigned int *)t5) = 1;
    goto LAB323;

LAB322:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB323;

LAB325:    t29 = (t0 + 4232);
    *((int *)t29) = 0;
    xsi_set_current_line(183, ng0);
    xsi_vlogfile_write(1, 0, 0, ng7, 1, t0);
    xsi_set_current_line(184, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB326;
    goto LAB1;

LAB326:    xsi_set_current_line(184, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(184, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(185, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6556);
    *((int *)t6) = t30;

LAB327:    t7 = (t0 + 6556);
    if (*((int *)t7) > 0)
        goto LAB328;

LAB329:    xsi_set_current_line(186, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB331;
    goto LAB1;

LAB328:    xsi_set_current_line(185, ng0);
    t20 = (t0 + 4248);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB330;
    goto LAB1;

LAB330:    t2 = (t0 + 6556);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB327;

LAB331:    xsi_set_current_line(186, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(186, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(190, ng0);

LAB332:    t2 = (t0 + 1048U);
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
        goto LAB336;

LAB333:    if (t17 != 0)
        goto LAB335;

LAB334:    *((unsigned int *)t5) = 1;

LAB336:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB338;

LAB337:    t27 = (t0 + 4264);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB332;
    goto LAB1;

LAB335:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB336;

LAB338:    t29 = (t0 + 4264);
    *((int *)t29) = 0;
    xsi_set_current_line(191, ng0);

LAB339:    t2 = (t0 + 1048U);
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
        goto LAB341;

LAB340:    if (t17 != 0)
        goto LAB342;

LAB343:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB345;

LAB344:    t27 = (t0 + 4280);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB339;
    goto LAB1;

LAB341:    *((unsigned int *)t5) = 1;
    goto LAB343;

LAB342:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB343;

LAB345:    t29 = (t0 + 4280);
    *((int *)t29) = 0;
    xsi_set_current_line(192, ng0);
    xsi_vlogfile_write(1, 0, 0, ng5, 1, t0);
    xsi_set_current_line(193, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB346;
    goto LAB1;

LAB346:    xsi_set_current_line(193, ng0);
    t3 = ((char*)((ng3)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(193, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(194, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6560);
    *((int *)t6) = t30;

LAB347:    t7 = (t0 + 6560);
    if (*((int *)t7) > 0)
        goto LAB348;

LAB349:    xsi_set_current_line(195, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB351;
    goto LAB1;

LAB348:    xsi_set_current_line(194, ng0);
    t20 = (t0 + 4296);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB350;
    goto LAB1;

LAB350:    t2 = (t0 + 6560);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB347;

LAB351:    xsi_set_current_line(195, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(195, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(199, ng0);

LAB352:    t2 = (t0 + 1048U);
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
        goto LAB356;

LAB353:    if (t17 != 0)
        goto LAB355;

LAB354:    *((unsigned int *)t5) = 1;

LAB356:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB358;

LAB357:    t27 = (t0 + 4312);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB352;
    goto LAB1;

LAB355:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB356;

LAB358:    t29 = (t0 + 4312);
    *((int *)t29) = 0;
    xsi_set_current_line(200, ng0);

LAB359:    t2 = (t0 + 1048U);
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
        goto LAB361;

LAB360:    if (t17 != 0)
        goto LAB362;

LAB363:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB365;

LAB364:    t27 = (t0 + 4328);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB359;
    goto LAB1;

LAB361:    *((unsigned int *)t5) = 1;
    goto LAB363;

LAB362:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB363;

LAB365:    t29 = (t0 + 4328);
    *((int *)t29) = 0;
    xsi_set_current_line(201, ng0);
    xsi_vlogfile_write(1, 0, 0, ng7, 1, t0);
    xsi_set_current_line(202, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB366;
    goto LAB1;

LAB366:    xsi_set_current_line(202, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(202, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(203, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6564);
    *((int *)t6) = t30;

LAB367:    t7 = (t0 + 6564);
    if (*((int *)t7) > 0)
        goto LAB368;

LAB369:    xsi_set_current_line(204, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB371;
    goto LAB1;

LAB368:    xsi_set_current_line(203, ng0);
    t20 = (t0 + 4344);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB370;
    goto LAB1;

LAB370:    t2 = (t0 + 6564);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB367;

LAB371:    xsi_set_current_line(204, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(204, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(208, ng0);

LAB372:    t2 = (t0 + 1048U);
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
        goto LAB376;

LAB373:    if (t17 != 0)
        goto LAB375;

LAB374:    *((unsigned int *)t5) = 1;

LAB376:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB378;

LAB377:    t27 = (t0 + 4360);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB372;
    goto LAB1;

LAB375:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB376;

LAB378:    t29 = (t0 + 4360);
    *((int *)t29) = 0;
    xsi_set_current_line(209, ng0);

LAB379:    t2 = (t0 + 1048U);
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
        goto LAB381;

LAB380:    if (t17 != 0)
        goto LAB382;

LAB383:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB385;

LAB384:    t27 = (t0 + 4376);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB379;
    goto LAB1;

LAB381:    *((unsigned int *)t5) = 1;
    goto LAB383;

LAB382:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB383;

LAB385:    t29 = (t0 + 4376);
    *((int *)t29) = 0;
    xsi_set_current_line(210, ng0);
    xsi_vlogfile_write(1, 0, 0, ng7, 1, t0);
    xsi_set_current_line(211, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB386;
    goto LAB1;

LAB386:    xsi_set_current_line(211, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(211, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(212, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6568);
    *((int *)t6) = t30;

LAB387:    t7 = (t0 + 6568);
    if (*((int *)t7) > 0)
        goto LAB388;

LAB389:    xsi_set_current_line(213, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB391;
    goto LAB1;

LAB388:    xsi_set_current_line(212, ng0);
    t20 = (t0 + 4392);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB390;
    goto LAB1;

LAB390:    t2 = (t0 + 6568);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB387;

LAB391:    xsi_set_current_line(213, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(213, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(217, ng0);

LAB392:    t2 = (t0 + 1048U);
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
        goto LAB396;

LAB393:    if (t17 != 0)
        goto LAB395;

LAB394:    *((unsigned int *)t5) = 1;

LAB396:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB398;

LAB397:    t27 = (t0 + 4408);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB392;
    goto LAB1;

LAB395:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB396;

LAB398:    t29 = (t0 + 4408);
    *((int *)t29) = 0;
    xsi_set_current_line(218, ng0);

LAB399:    t2 = (t0 + 1048U);
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
        goto LAB401;

LAB400:    if (t17 != 0)
        goto LAB402;

LAB403:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB405;

LAB404:    t27 = (t0 + 4424);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB399;
    goto LAB1;

LAB401:    *((unsigned int *)t5) = 1;
    goto LAB403;

LAB402:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB403;

LAB405:    t29 = (t0 + 4424);
    *((int *)t29) = 0;
    xsi_set_current_line(219, ng0);
    xsi_vlogfile_write(1, 0, 0, ng7, 1, t0);
    xsi_set_current_line(220, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB406;
    goto LAB1;

LAB406:    xsi_set_current_line(220, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(220, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(221, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t2);
    t30 = (t10 & t9);
    t6 = (t0 + 6572);
    *((int *)t6) = t30;

LAB407:    t7 = (t0 + 6572);
    if (*((int *)t7) > 0)
        goto LAB408;

LAB409:    xsi_set_current_line(222, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB411;
    goto LAB1;

LAB408:    xsi_set_current_line(221, ng0);
    t20 = (t0 + 4440);
    *((int *)t20) = 1;
    t21 = (t0 + 3128);
    *((char **)t21) = t20;
    *((char **)t1) = &&LAB410;
    goto LAB1;

LAB410:    t2 = (t0 + 6572);
    t30 = *((int *)t2);
    *((int *)t2) = (t30 - 1);
    goto LAB407;

LAB411:    xsi_set_current_line(222, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 1448);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 1);
    xsi_set_current_line(222, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(224, ng0);

LAB412:    t2 = (t0 + 1048U);
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
        goto LAB416;

LAB413:    if (t17 != 0)
        goto LAB415;

LAB414:    *((unsigned int *)t5) = 1;

LAB416:    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB418;

LAB417:    t27 = (t0 + 4456);
    *((int *)t27) = 1;
    t28 = (t0 + 3096U);
    *((char **)t28) = &&LAB412;
    goto LAB1;

LAB415:    t20 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB416;

LAB418:    t29 = (t0 + 4456);
    *((int *)t29) = 0;
    xsi_set_current_line(227, ng0);
    t2 = (t0 + 2904);
    xsi_process_wait(t2, 100000000LL);
    *((char **)t1) = &&LAB419;
    goto LAB1;

LAB419:    goto LAB1;

}


extern void work_m_00000000003184103806_3115858369_init()
{
	static char *pe[] = {(void *)Always_29_0,(void *)Initial_31_1};
	xsi_register_didat("work_m_00000000003184103806_3115858369", "isim/top_tb_isim_par.exe.sim/work/m_00000000003184103806_3115858369.didat");
	xsi_register_executes(pe);
}
