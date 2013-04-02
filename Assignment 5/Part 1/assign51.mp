
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   08C5 =   2245. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  _keyboard_init
       402A  __text_start
       4057  _keyboard_isr
       4132  _keyboard_getchar
       4146  _lcd_init
       414A  _lcd_print
       4177  _lcd_print_top
       418D  _lcd_print_bottom
       41A3  _lcd_display_speed
       41C2  _lcd_display_temperature
       41E1  _main
       427B  _keyboard_key_pushed_callback
       42D3  _LCD_instruction
       42DF  _LCD_display
       42EB  _Lcd2PP_Init
       43BB  _setbaud
       43EB  _putchar
       4413  _strcpy
       4422  __va_start
       4440  __HC12Setup
       4445  _itoa
       44CD  _islower
       44E5  __ctype
       45E6  _toupper
       4606  __print
       483B  _printf
       4889  _sprintf
       48C5  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   48C5   0015 =     21. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       48C5  __idata_start
       48DA  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   1000   0015 =     21. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1000  __data_start
       1011  _speed
       1013  _temp
       1015  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   1015   001D =     29. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1015  __bss_start
       1030  __textmode
       1032  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          memory   0000   4000 =  16384. bytes (abs,ovr,rom)

       Addr  Global Symbol
      -----  --------------------------------
       3F8C  _interrupt_vectors

Files Linked      [ module(s) ]

C:\icc\lib\crt12.o	[ crt12.s ]
assign51.o	[ assign51.c ]
vectors_dp256_NoICE.o	[ vectors_dp256_NoICE.c ]
basicLCD.o	[ basicLCD.s ]
<library>	[ serial.c, putchar.c, strcpy.s, stdarg.s, setup.s, itoa.s, islower.s, ctype.s, toupper.s, _printf.s ]
[ printf.s, sprintf.s, textmode.s ]

User Global Definitions

init_sp = 0x3dff

User Base Address Definitions

text = 0x4000
data = 0x1000

