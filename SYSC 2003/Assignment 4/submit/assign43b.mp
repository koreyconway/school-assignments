
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   07AA =   1962. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  _stepper_turn_cw
       402A  __text_start
       405B  _stepper_turn_ccw
       40F6  _main
       410D  _rti_init
       4119  _rti_handler
       4143  _trigger_collision
       414A  _rti_every_second
       4168  _collision_avoidance
       42FB  _setbaud
       432B  _putchar
       4353  _strcpy
       4362  __va_start
       4380  __HC12Setup
       4385  _itoa
       440D  _islower
       4425  __ctype
       4526  _toupper
       4546  __print
       477B  _printf
       47AA  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   47AA   000A =     10. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       47AA  __idata_start
       47B4  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   1000   000A =     10. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1000  __data_start
       1000  _collision_detected
       100A  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   100A   001B =     27. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       100A  __bss_start
       1023  __textmode
       1025  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          memory   0000   4000 =  16384. bytes (abs,ovr,rom)

       Addr  Global Symbol
      -----  --------------------------------
       3F8C  _interrupt_vectors

Files Linked      [ module(s) ]

C:\icc\lib\crt12.o	[ crt12.s ]
assign43b.o	[ assign43b.c ]
vectors_dp256_NoICE.o	[ vectors_dp256_NoICE.c ]
<library>	[ serial.c, putchar.c, strcpy.s, stdarg.s, setup.s, itoa.s, islower.s, ctype.s, toupper.s, _printf.s ]
[ printf.s, textmode.s ]

User Global Definitions

init_sp = 0x3dff

User Base Address Definitions

text = 0x4000
data = 0x1000

