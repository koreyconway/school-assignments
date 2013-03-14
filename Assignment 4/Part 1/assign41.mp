
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   01C7 =    455. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  _main
       402A  __text_start
       4056  _keyboard_init
       4063  _keyboard_getchar
       40FD  _keyboard_get_column
       4153  _keyboard_delay
       416A  _setbaud
       419A  _putchar
       41C2  __HC12Setup
       41C7  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   41C7   0014 =     20. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       41C7  __idata_start
       41DB  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   1000   0014 =     20. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1000  __data_start
       1014  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   1014   0002 =      2. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1014  __textmode
       1014  __bss_start
       1016  __bss_end

Files Linked      [ module(s) ]

C:\icc\lib\crt12.o	[ crt12.s ]
assign41.o	[ assign41.c ]
<library>	[ serial.c, putchar.c, setup.s, textmode.s ]

User Global Definitions

init_sp = 0x3dff

User Base Address Definitions

text = 0x4000
data = 0x1000

