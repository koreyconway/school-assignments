CC = icc12w
CFLAGS =  -IC:\icc\include\ -e  -l -g -Wa-g 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -LC:\icc\lib\ -g -btext:0x4000 -bdata:0x1000 -dinit_sp:0x3DFF -fmots19
FILES = assign51.o vectors_dp256_NoICE.o 

assign51:	$(FILES)
	$(CC) -o assign51 $(LFLAGS) @assign51.lk  
assign51.o: C:/icc/include/hcs12dp256.h C:/icc/include/hc12def.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h M:\SYSC20~2\Assignments\ASSIGM~1\PART1~1/../lib/keyboard.c C:/icc/include/hcs12dp256.h
assign51.o:	M:\SYSC20~2\Assignments\ASSIGM~1\PART1~1\assign51.c
	$(CC) -c $(CFLAGS) M:\SYSC20~2\Assignments\ASSIGM~1\PART1~1\assign51.c
vectors_dp256_NoICE.o:	M:\SYSC20~2\Assignments\ASSIGM~1\PART1~1\vectors_dp256_NoICE.c
	$(CC) -c $(CFLAGS) M:\SYSC20~2\Assignments\ASSIGM~1\PART1~1\vectors_dp256_NoICE.c
