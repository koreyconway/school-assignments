CC = icc12w
CFLAGS =  -IC:\icc\include\ -e  -l -g -Wa-g 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -LC:\icc\lib\ -g -btext:0x4000 -bdata:0x1000 -dinit_sp:0x3DFF -fmots19
FILES = assign55.o vectors_dp256_NoICE.o 

assign55:	$(FILES)
	$(CC) -o assign55 $(LFLAGS) @assign55.lk  
assign55.o: C:/icc/include/hcs12dp256.h C:/icc/include/hc12def.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h
assign55.o:	M:\SYSC20~2\Assignments\ASSIGN~4\PART5~1\assign55.c
	$(CC) -c $(CFLAGS) M:\SYSC20~2\Assignments\ASSIGN~4\PART5~1\assign55.c
vectors_dp256_NoICE.o:	M:\SYSC20~2\Assignments\ASSIGN~4\PART5~1\vectors_dp256_NoICE.c
	$(CC) -c $(CFLAGS) M:\SYSC20~2\Assignments\ASSIGN~4\PART5~1\vectors_dp256_NoICE.c
