
Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   4000   0591 =   1425. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4000  __start
       4028  _exit
       402A  __text_start
       402A  _motor_init
       4054  _motor_set_duty
       406E  _optical_init
       4083  _optical_isr
       40BC  _main
       40E2  _setbaud
       4112  _putchar
       413A  _strcpy
       4149  __va_start
       4167  __HC12Setup
       416C  _itoa
       41F4  _islower
       420C  __ctype
       430D  _toupper
       432D  __print
       4562  _printf
       4591  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   4591   0002 =      2. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       4591  __idata_start
       4593  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   1000   0002 =      2. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1000  __data_start
       1002  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   1002   001B =     27. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1002  __bss_start
       101B  __textmode
       101D  __bss_end

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

