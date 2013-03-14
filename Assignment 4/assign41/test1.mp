
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   056F =   1391. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  __text_start
       402A  _main
       40A7  _delay
       40F0  _putchar
       4118  _strcpy
       4127  __va_start
       4145  __HC12Setup
       414A  _itoa
       41D2  _islower
       41EA  __ctype
       42EB  _toupper
       430B  __print
       4540  _printf
       456F  __text_end

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
test1.o	[ test1.c ]
<library>	[ putchar.c, strcpy.s, stdarg.s, setup.s, itoa.s, islower.s, ctype.s, toupper.s, _printf.s, printf.s ]
[ textmode.s ]

User Global Definitions

init_sp = 0x3dff

User Base Address Definitions

text = 0x4000
data = 0x1000

