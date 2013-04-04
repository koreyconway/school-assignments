
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   08BC =   2236. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  __text_start
       402A  _keyboard_init
       4057  _keyboard_isr
       412B  _keyboard_getchar
       413F  _lcd_init
       4143  _lcd_print
       4170  _lcd_print_top
       4186  _lcd_print_bottom
       419C  _lcd_display_speed
       41BB  _lcd_display_temperature
       41DA  _main
       42CA  _LCD_instruction
       42D6  _LCD_display
       42E2  _Lcd2PP_Init
       43B2  _setbaud
       43E2  _putchar
       440A  _strcpy
       4419  __va_start
       4437  __HC12Setup
       443C  _itoa
       44C4  _islower
       44DC  __ctype
       45DD  _toupper
       45FD  __print
       4832  _printf
       4880  _sprintf
       48BC  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   48BC   0015 =     21. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       48BC  __idata_start
       48D1  __idata_end

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

