
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   0BF5 =   3061. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  __text_start
       404B  _keyboard_getchar
       4181  _stepper_turn_cw
       41B2  _stepper_turn_ccw
       424D  _LCD_instruction
       4259  _LCD_display
       4265  _Lcd2PP_Init
       4335  _lcd_init
       4339  _lcd_print
       437E  _lcd_print_top
       4394  _lcd_print_bottom
       43AA  _main
       4455  _lcd_display_speed
       4474  _lcd_display_temperature
       4493  _rti_init
       449F  _rti_handler
       44C9  _trigger_collision
       44D0  _rti_every_second
       44D4  _collision_avoidance
       46EB  _setbaud
       471B  _putchar
       4743  _strcpy
       4752  __va_start
       4770  __HC12Setup
       4775  _itoa
       47FD  _islower
       4815  __ctype
       4916  _toupper
       4936  __print
       4B6B  _printf
       4BB9  _sprintf
       4BF5  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   4BF5   0014 =     20. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4BF5  __idata_start
       4C09  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   1000   0014 =     20. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1000  __data_start
       1004  _collision_detected
       1006  _temperature
       1008  _speed
       100A  _temp
       1014  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   1014   001D =     29. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1014  __bss_start
       102F  __textmode
       1031  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          memory   0000   4000 =  16384. bytes (abs,ovr,rom)

       Addr  Global Symbol
      -----  --------------------------------
       3F8C  _interrupt_vectors

Files Linked      [ module(s) ]

C:\icc\lib\crt12.o	[ crt12.s ]
vectors_dp256_NoICE.o	[ vectors_dp256_NoICE.c ]
assign44.o	[ assign44.c ]
<library>	[ serial.c, putchar.c, strcpy.s, stdarg.s, setup.s, itoa.s, islower.s, ctype.s, toupper.s, _printf.s ]
[ printf.s, sprintf.s, textmode.s ]

User Global Definitions

init_sp = 0x3dff

User Base Address Definitions

text = 0x4000
data = 0x1000

