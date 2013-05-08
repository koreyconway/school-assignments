CC = icc12w
CFLAGS =  -IC:\icc\include\ -e  -l -g -Wa-g 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -LC:\icc\lib\ -g -btext:0x4000 -bdata:0x1000 -dinit_sp:0x3DFF -fmots19
FILES = assign43b.o vectors_dp256_NoICE.o 

assign43b:	$(FILES)
	$(CC) -o assign43b $(LFLAGS) @assign43b.lk  
assign43b.o: C:/icc/include/hcs12dp256.h C:/icc/include/hc12def.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h M:\SYSC20~2\Assignments\ASSIGN~3\PART3B~1/../lib/stepper.c C:/icc/include/hcs12dp256.h
assign43b.o:	M:\SYSC20~2\Assignments\ASSIGN~3\PART3B~1\assign43b.c
	$(CC) -c $(CFLAGS) M:\SYSC20~2\Assignments\ASSIGN~3\PART3B~1\assign43b.c
vectors_dp256_NoICE.o:	M:\SYSC20~2\Assignments\ASSIGN~3\PART3B~1\vectors_dp256_NoICE.c
	$(CC) -c $(CFLAGS) M:\SYSC20~2\Assignments\ASSIGN~3\PART3B~1\vectors_dp256_NoICE.c
