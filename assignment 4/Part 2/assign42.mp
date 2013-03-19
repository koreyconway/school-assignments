
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   08C1 =   2241. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  __text_start
       404B  _keyboard_getchar
       4181  _LCD_instruction
       418D  _LCD_display
       4199  _Lcd2PP_Init
       4269  _lcd_init
       426D  _lcd_print
       42B2  _lcd_print_top
       42C8  _lcd_print_bottom
       42DE  _main
       435E  _lcd_display_speed
       437D  _lcd_display_temperature
       43E7  _putchar
       440F  _strcpy
       441E  __va_start
       443C  __HC12Setup
       4441  _itoa
       44C9  _islower
       44E1  __ctype
       45E2  _toupper
       4602  __print
       4837  _printf
       4885  _sprintf
       48C1  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   48C1   0008 =      8. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       48C1  __idata_start
       48C9  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   1000   0008 =      8. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1000  __data_start
       1004  _speed
       1006  _temp
       1008  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   1008   001D =     29. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1008  __bss_start
       1023  __textmode
       1025  __bss_end

Files Linked      [ module(s) ]

C:\icc\lib\crt12.o	[ crt12.s ]
assign42.o	[ assign42.c ]
<library>	[ putchar.c, strcpy.s, stdarg.s, setup.s, itoa.s, islower.s, ctype.s, toupper.s, _printf.s, printf.s ]
[ sprintf.s, textmode.s ]

User Global Definitions

init_sp = 0x3dff

User Base Address Definitions

text = 0x4000
data = 0x1000

