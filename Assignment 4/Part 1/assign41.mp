
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   01D5 =    469. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  __text_start
       403A  _main
       4106  _getKeyboardCol
       413F  _delay
       4178  _setbaud
       41A8  _putchar
       41D0  __HC12Setup
       41D5  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   1000   0002 =      2. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1000  __textmode
       1000  __bss_start
       1002  __bss_end

Files Linked      [ module(s) ]

C:\icc\lib\crt12.o	[ crt12.s ]
assign41.o	[ assign41.c ]
<library>	[ serial.c, putchar.c, setup.s, textmode.s ]

User Global Definitions

init_sp = 0x3dff

User Base Address Definitions

text = 0x4000
data = 0x1000

