
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   0EAC =   3756. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  _motor_init
       402A  __text_start
       40A0  _motor_disable
       40AB  _motor_enable
       40B6  _motor_update_speed
       4132  _motor_get_speed
       4136  _motor_set_speed
       4150  _motor_paca_isr
       415E  _rti_init
       4168  _rti_isr
       41B2  _keyboard_init
       41DF  _keyboard_isr
       42B3  _keyboard_getchar
       42C7  _lcd_init
       42CB  _lcd_print
       42F8  _lcd_print_top
       430E  _lcd_print_bottom
       4324  _lcd_display_speed
       4343  _lcd_display_temperature
       4362  _temperature_init
       437A  _temperature_start_sample
       4386  _temperature_is_ready
       43A2  _temperature_get
       43AC  _temperature_heater_on
       43B1  _temperature_heater_off
       43B6  _temperature_isr
       43CD  _stepper_turn_cw
       43FE  _stepper_turn_ccw
       4499  _buzzer_init
       449E  _buzzer_on
       44A3  _buzzer_off
       44A8  _led_init
       44AD  _led_all_off
       44B2  _led_red_on
       44B7  _led_yellow_on
       44BC  _led_orange_on
       44C1  _led_green_on
       44C6  _main
       4607  _rti_each
       4608  _rti_each_quarter
       460C  _rti_each_half
       460D  _rti_each_second
       465F  _trigger_collision
       4666  _collision_avoidance
       48BA  _LCD_instruction
       48C6  _LCD_display
       48D2  _Lcd2PP_Init
       49A2  _setbaud
       49D2  _putchar
       49FA  _strcpy
       4A09  __va_start
       4A27  __HC12Setup
       4A2C  _itoa
       4AB4  _islower
       4ACC  __ctype
       4BCD  _toupper
       4BED  __print
       4E22  _printf
       4E70  _sprintf
       4EAC  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   4EAC   002F =     47. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4EAC  __idata_start
       4EDB  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   1000   002F =     47. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1000  __data_start
       1006  _motor_paca_count
       1021  _collision_detected
       1023  _speed
       1025  _temperature
       1027  _direction
       102F  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   102F   001D =     29. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       102F  __bss_start
       104A  __textmode
       104C  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          memory   0000   4000 =  16384. bytes (abs,ovr,rom)

       Addr  Global Symbol
      -----  --------------------------------
       3F8C  _interrupt_vectors

Files Linked      [ module(s) ]

C:\icc\lib\crt12.o	[ crt12.s ]
assign54.o	[ assign54.c ]
vectors_dp256_NoICE.o	[ vectors_dp256_NoICE.c ]
basicLCD.o	[ basicLCD.s ]
<library>	[ serial.c, putchar.c, strcpy.s, stdarg.s, setup.s, itoa.s, islower.s, ctype.s, toupper.s, _printf.s ]
[ printf.s, sprintf.s, textmode.s ]

User Global Definitions

init_sp = 0x3dff

User Base Address Definitions

text = 0x4000
data = 0x1000

