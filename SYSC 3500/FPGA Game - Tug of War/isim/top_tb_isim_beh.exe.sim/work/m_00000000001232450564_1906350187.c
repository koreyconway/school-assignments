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
static const char *ng0 = "//ugradfs/kconway1/win/ELEC3500/Lab 9/xilinx/random.v";
static int ng1[] = {1, 0};
static int ng2[] = {8, 0};
static int ng3[] = {0, 0};
static int ng4[] = {9, 0};



static void Cont_14_0(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;

LAB0:    t1 = (t0 + 2688U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(14, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t5, 0, 8);
    t6 = (t5 + 4);
    t7 = (t4 + 4);
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 9);
    t10 = (t9 & 1);
    *((unsigned int *)t5) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 9);
    t13 = (t12 & 1);
    *((unsigned int *)t6) = t13;
    t14 = (t0 + 3352);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memset(t18, 0, 8);
    t19 = 1U;
    t20 = t19;
    t21 = (t5 + 4);
    t22 = *((unsigned int *)t5);
    t19 = (t19 & t22);
    t23 = *((unsigned int *)t21);
    t20 = (t20 & t23);
    t24 = (t18 + 4);
    t25 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t25 | t19);
    t26 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t26 | t20);
    xsi_driver_vfirst_trans(t14, 0, 0);
    t27 = (t0 + 3256);
    *((int *)t27) = 1;

LAB1:    return;
}

static void Always_16_1(char *t0)
{
    char t13[8];
    char t15[8];
    char t16[8];
    char t17[8];
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
    unsigned int t14;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    unsigned int t24;
    int t25;
    char *t26;
    unsigned int t27;
    int t28;
    int t29;
    char *t30;
    unsigned int t31;
    int t32;
    int t33;
    unsigned int t34;
    int t35;
    unsigned int t36;
    unsigned int t37;
    int t38;
    int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    char *t50;
    char *t51;
    char *t52;
    char *t53;
    char *t54;
    unsigned int t55;

LAB0:    t1 = (t0 + 2936U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(16, ng0);
    t2 = (t0 + 3272);
    *((int *)t2) = 1;
    t3 = (t0 + 2968);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(17, ng0);
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

LAB6:    xsi_set_current_line(19, ng0);

LAB8:    xsi_set_current_line(20, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t13, 0, 8);
    t5 = (t13 + 4);
    t11 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 1);
    *((unsigned int *)t13) = t7;
    t8 = *((unsigned int *)t11);
    t9 = (t8 >> 1);
    *((unsigned int *)t5) = t9;
    t10 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t10 & 511U);
    t14 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t14 & 511U);
    t12 = (t0 + 1768);
    t18 = (t0 + 1768);
    t19 = (t18 + 72U);
    t20 = *((char **)t19);
    t21 = ((char*)((ng2)));
    t22 = ((char*)((ng3)));
    xsi_vlog_convert_partindices(t15, t16, t17, ((int*)(t20)), 2, t21, 32, 1, t22, 32, 1);
    t23 = (t15 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (!(t24));
    t26 = (t16 + 4);
    t27 = *((unsigned int *)t26);
    t28 = (!(t27));
    t29 = (t25 && t28);
    t30 = (t17 + 4);
    t31 = *((unsigned int *)t30);
    t32 = (!(t31));
    t33 = (t29 && t32);
    if (t33 == 1)
        goto LAB9;

LAB10:    xsi_set_current_line(21, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t13, 0, 8);
    t5 = (t13 + 4);
    t11 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 0);
    t8 = (t7 & 1);
    *((unsigned int *)t13) = t8;
    t9 = *((unsigned int *)t11);
    t10 = (t9 >> 0);
    t14 = (t10 & 1);
    *((unsigned int *)t5) = t14;
    t12 = (t0 + 1768);
    t18 = (t12 + 56U);
    t19 = *((char **)t18);
    memset(t15, 0, 8);
    t20 = (t15 + 4);
    t21 = (t19 + 4);
    t24 = *((unsigned int *)t19);
    t27 = (t24 >> 3);
    t31 = (t27 & 1);
    *((unsigned int *)t15) = t31;
    t34 = *((unsigned int *)t21);
    t36 = (t34 >> 3);
    t37 = (t36 & 1);
    *((unsigned int *)t20) = t37;
    t40 = *((unsigned int *)t13);
    t41 = *((unsigned int *)t15);
    t42 = (t40 ^ t41);
    *((unsigned int *)t16) = t42;
    t22 = (t13 + 4);
    t23 = (t15 + 4);
    t26 = (t16 + 4);
    t43 = *((unsigned int *)t22);
    t44 = *((unsigned int *)t23);
    t45 = (t43 | t44);
    *((unsigned int *)t26) = t45;
    t46 = *((unsigned int *)t26);
    t47 = (t46 != 0);
    if (t47 == 1)
        goto LAB11;

LAB12:
LAB13:    t30 = (t0 + 1768);
    t50 = (t0 + 1768);
    t51 = (t50 + 72U);
    t52 = *((char **)t51);
    t53 = ((char*)((ng4)));
    xsi_vlog_generic_convert_bit_index(t17, t52, 2, t53, 32, 1);
    t54 = (t17 + 4);
    t55 = *((unsigned int *)t54);
    t25 = (!(t55));
    if (t25 == 1)
        goto LAB14;

LAB15:
LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(17, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 10, 0LL);
    goto LAB7;

LAB9:    t34 = *((unsigned int *)t17);
    t35 = (t34 + 0);
    t36 = *((unsigned int *)t15);
    t37 = *((unsigned int *)t16);
    t38 = (t36 - t37);
    t39 = (t38 + 1);
    xsi_vlogvar_wait_assign_value(t12, t13, t35, *((unsigned int *)t16), t39, 0LL);
    goto LAB10;

LAB11:    t48 = *((unsigned int *)t16);
    t49 = *((unsigned int *)t26);
    *((unsigned int *)t16) = (t48 | t49);
    goto LAB13;

LAB14:    xsi_vlogvar_wait_assign_value(t30, t16, 0, *((unsigned int *)t17), 1, 0LL);
    goto LAB15;

}


extern void work_m_00000000001232450564_1906350187_init()
{
	static char *pe[] = {(void *)Cont_14_0,(void *)Always_16_1};
	xsi_register_didat("work_m_00000000001232450564_1906350187", "isim/top_tb_isim_beh.exe.sim/work/m_00000000001232450564_1906350187.didat");
	xsi_register_executes(pe);
}
