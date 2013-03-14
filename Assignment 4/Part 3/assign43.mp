
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   0150 =    336. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  _main
       402A  __text_start
       4055  _stepper_turn_cw
       4083  _stepper_turn_ccw
       40A8  _stepper_set_step
       40F7  _stepper_init
       4104  _stepper_delay
       411B  _setbaud
       414B  __HC12Setup
       4150  __text_end

Files Linked      [ module(s) ]

C:\icc\lib\crt12.o	[ crt12.s ]
assign43.o	[ assign43.c ]
<library>	[ serial.c, setup.s ]

User Global Definitions

init_sp = 0x3dff

User Base Address Definitions

text = 0x4000
data = 0x1000

