
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   01CF =    463. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  _main
       402A  __text_start
       403A  _keyboard_scan
       40A6  _keyboard_pushed
       40F3  _keyboard_init
       4100  _keyboard_get_column
       4139  _delay
       4172  _setbaud
       41A2  _putchar
       41CA  __HC12Setup
       41CF  __text_end

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

