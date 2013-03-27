
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   0557 =   1367. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  __text_start
       402A  _motor_init
       4054  _motor_set_duty
       4063  _optical_init
       4077  _optical_isr
       4082  _main
       40A8  _setbaud
       40D8  _putchar
       4100  _strcpy
       410F  __va_start
       412D  __HC12Setup
       4132  _itoa
       41BA  _islower
       41D2  __ctype
       42D3  _toupper
       42F3  __print
       4528  _printf
       4557  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   1000   001B =     27. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1000  __bss_start
       1019  __textmode
       101B  __bss_end

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
<library>	[ serial.c, putchar.c, strcpy.s, stdarg.s, setup.s, itoa.s, islower.s, ctype.s, toupper.s, _printf.s ]
[ printf.s, textmode.s ]

User Global Definitions

init_sp = 0x3dff

User Base Address Definitions

text = 0x4000
data = 0x1000

