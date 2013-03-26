
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   020A =    522. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  __text_start
       402A  _keyboard_init
       4066  _keyboard_isr
       416B  _keyboard_getchar
       4170  _keyboard_clearchar
       4174  _main
       41AD  _setbaud
       41DD  _putchar
       4205  __HC12Setup
       420A  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   420A   0001 =      1. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       420A  __idata_start
       420B  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   1000   0001 =      1. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1000  __data_start
       1001  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   1001   0002 =      2. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1001  __textmode
       1001  __bss_start
       1003  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          memory   0000   4000 =  16384. bytes (abs,ovr,rom)

       Addr  Global Symbol
      -----  --------------------------------
       3F8C  _interrupt_vectors

Files Linked      [ module(s) ]

C:\icc\lib\crt12.o	[ crt12.s ]
assign51.o	[ assign51.c ]
vectors_dp256_NoICE.o	[ vectors_dp256_NoICE.c ]
<library>	[ serial.c, putchar.c, setup.s, textmode.s ]

User Global Definitions

init_sp = 0x3dff

User Base Address Definitions

text = 0x4000
data = 0x1000

