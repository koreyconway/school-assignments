
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   07A5 =   1957. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  _stepper_turn_cw
       402A  __text_start
       4058  _stepper_turn_ccw
       407D  _stepper_set_step
       40CC  _stepper_init
       40D9  _stepper_delay
       40F0  _main
       4108  _rti_init
       4114  _rti_handler
       413E  _trigger_collision
       4145  _rti_every_second
       4163  _collision_avoidance
       42F6  _setbaud
       4326  _putchar
       434E  _strcpy
       435D  __va_start
       437B  __HC12Setup
       4380  _itoa
       4408  _islower
       4420  __ctype
       4521  _toupper
       4541  __print
       4776  _printf
       47A5  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   47A5   000C =     12. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       47A5  __idata_start
       47B1  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   1000   000C =     12. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1000  __data_start
       1000  _collision_detected
       1002  _temperature
       100C  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   100C   001B =     27. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       100C  __bss_start
       1025  __textmode
       1027  __bss_end

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

