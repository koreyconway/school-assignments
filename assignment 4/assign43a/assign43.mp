
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   05AF =   1455. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  _main
       402A  __text_start
       4067  __360_anti_clockwise
       40AD  __360_clockwise
       40F3  _delay
       4130  _putchar
       4158  _strcpy
       4167  __va_start
       4185  __HC12Setup
       418A  _itoa
       4212  _islower
       422A  __ctype
       432B  _toupper
       434B  __print
       4580  _printf
       45AF  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   1000   001B =     27. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1000  __bss_start
       1019  __textmode
       101B  __bss_end

Files Linked      [ module(s) ]

C:\icc\lib\crt12.o	[ crt12.s ]
assign43.o	[ assign43.c ]
<library>	[ putchar.c, strcpy.s, stdarg.s, setup.s, itoa.s, islower.s, ctype.s, toupper.s, _printf.s, printf.s ]
[ textmode.s ]

User Global Definitions

init_sp = 0x3dff

User Base Address Definitions

text = 0x4000
data = 0x1000

