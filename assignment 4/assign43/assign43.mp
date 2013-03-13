
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   0689 =   1673. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  __text_start
       402A  _main
       40E2  _delay
       4122  _LCD_instruction
       412E  _LCD_display
       413A  _Lcd2PP_Init
       420A  _putchar
       4232  _strcpy
       4241  __va_start
       425F  __HC12Setup
       4264  _itoa
       42EC  _islower
       4304  __ctype
       4405  _toupper
       4425  __print
       465A  _printf
       4689  __text_end

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
basicLCD.o	[ basicLCD.s ]
DP256Reg.o	[ DP256Reg.s ]
<library>	[ putchar.c, strcpy.s, stdarg.s, setup.s, itoa.s, islower.s, ctype.s, toupper.s, _printf.s, printf.s ]
[ textmode.s ]

User Global Definitions

init_sp = 0x3dff

User Base Address Definitions

text = 0x4000
data = 0x1000

