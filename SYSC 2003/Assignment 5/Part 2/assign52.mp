
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   0AED =   2797. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  __text_start
       402A  _motor_init
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
       4362  _main
       4448  _rti_each
       4449  _rti_each_quarter
       444D  _rti_each_half
       444E  _rti_each_second
       44FB  _LCD_instruction
       4507  _LCD_display
       4513  _Lcd2PP_Init
       45E3  _setbaud
       4613  _putchar
       463B  _strcpy
       464A  __va_start
       4668  __HC12Setup
       466D  _itoa
       46F5  _islower
       470D  __ctype
       480E  _toupper
       482E  __print
       4A63  _printf
       4AB1  _sprintf
       4AED  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   4AED   0021 =     33. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4AED  __idata_start
       4B0E  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   1000   0021 =     33. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1000  __data_start
       1006  _motor_paca_count
       101D  _speed
       101F  _temperature
       1021  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   1021   001D =     29. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1021  __bss_start
       103C  __textmode
       103E  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          memory   0000   4000 =  16384. bytes (abs,ovr,rom)

       Addr  Global Symbol
      -----  --------------------------------
       3F8C  _interrupt_vectors

Files Linked      [ module(s) ]

C:\icc\lib\crt12.o	[ crt12.s ]
assign52.o	[ assign52.c ]
vectors_dp256_NoICE.o	[ vectors_dp256_NoICE.c ]
basicLCD.o	[ basicLCD.s ]
<library>	[ serial.c, putchar.c, strcpy.s, stdarg.s, setup.s, itoa.s, islower.s, ctype.s, toupper.s, _printf.s ]
[ printf.s, sprintf.s, textmode.s ]

User Global Definitions

init_sp = 0x3dff

User Base Address Definitions

text = 0x4000
data = 0x1000

