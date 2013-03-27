CC = icc12w
CFLAGS =  -IC:\icc\include\ -e  -l -g -Wa-g 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -LC:\icc\lib\ -g -btext:0x4000 -bdata:0x1000 -dinit_sp:0x3DFF -fmots19
FILES = assign52.o vectors_dp256_NoICE.o 

assign52:	$(FILES)
	$(CC) -o assign52 $(LFLAGS) @assign52.lk  
assign52.o: C:/icc/include/hcs12dp256.h C:/icc/include/hc12def.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h M:\SYSC20~2\Assignments\ASSIGM~1\PART2~1/../lib/motor.c
assign52.o:	M:\SYSC20~2\Assignments\ASSIGM~1\PART2~1\assign52.c
	$(CC) -c $(CFLAGS) M:\SYSC20~2\Assignments\ASSIGM~1\PART2~1\assign52.c
vectors_dp256_NoICE.o:	M:\SYSC20~2\Assignments\ASSIGM~1\PART2~1\vectors_dp256_NoICE.c
	$(CC) -c $(CFLAGS) M:\SYSC20~2\Assignments\ASSIGM~1\PART2~1\vectors_dp256_NoICE.c
