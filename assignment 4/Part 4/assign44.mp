
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   0761 =   1889. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  _stepper_turn_cw
       402A  __text_start
       4058  _stepper_turn_ccw
       407D  _stepper_set_step
       40CC  _stepper_init
       40F0  _main
       40F4  _rti_init
       4100  _rti_handler
       412A  _trigger_collision
       4131  _rti_every_second
       414F  _collision_avoidance
       42E2  _putchar
       430A  _strcpy
       4319  __va_start
       4337  __HC12Setup
       433C  _itoa
       43C4  _islower
       43DC  __ctype
       44DD  _toupper
       44FD  __print
       4732  _printf
       4761  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   4761   000C =     12. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4761  __idata_start
       476D  __idata_end

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
vectors_dp256_NoICE.o	[ vectors_dp256_NoICE.c ]
assign44.o	[ assign44.c ]
<library>	[ putchar.c, strcpy.s, stdarg.s, setup.s, itoa.s, islower.s, ctype.s, toupper.s, _printf.s, printf.s ]
[ textmode.s ]

User Global Definitions

init_sp = 0x3dff

User Base Address Definitions

text = 0x4000
data = 0x1000

