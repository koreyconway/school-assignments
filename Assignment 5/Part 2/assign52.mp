
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   0A2D =   2605. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  __text_start
       402A  _motor_init
       408F  _motor_update_speed
       40F3  _motor_get_speed
       40F7  _motor_set_speed
       411E  _rti_init
       4128  _rti_isr
       4172  _keyboard_init
       419F  _keyboard_isr
       4273  _keyboard_getchar
       4287  _lcd_init
       428B  _lcd_print
       42B8  _lcd_print_top
       42CE  _lcd_print_bottom
       42E4  _lcd_display_speed
       4303  _lcd_display_temperature
       4322  _main
       43DD  _rti_each
       43DE  _rti_each_quarter
       43E2  _rti_each_half
       43E3  _rti_each_second
       443B  _LCD_instruction
       4447  _LCD_display
       4453  _Lcd2PP_Init
       4523  _setbaud
       4553  _putchar
       457B  _strcpy
       458A  __va_start
       45A8  __HC12Setup
       45AD  _itoa
       4635  _islower
       464D  __ctype
       474E  _toupper
       476E  __print
       49A3  _printf
       49F1  _sprintf
       4A2D  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   4A2D   001D =     29. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4A2D  __idata_start
       4A4A  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   1000   001D =     29. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1000  __data_start
       1019  _speed
       101B  _temperature
       101D  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   101D   001D =     29. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       101D  __bss_start
       1038  __textmode
       103A  __bss_end

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

