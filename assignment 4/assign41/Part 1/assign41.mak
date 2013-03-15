CC = icc12w
CFLAGS =  -IC:\icc\include\ -e  -l -g -Wa-g 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -LC:\icc\lib\ -g -btext:0x4000 -bdata:0x1000 -dinit_sp:0x3DFF -fmots19
FILES = assign41.o 

assign41:	$(FILES)
	$(CC) -o assign41 $(LFLAGS) @assign41.lk  
assign41.o: C:/icc/include/hcs12dp256.h C:/icc/include/hc12def.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h
assign41.o:	M:\SYSC20~2\Assignments\ASSIGN~3\PART1~1\assign41.c
	$(CC) -c $(CFLAGS) M:\SYSC20~2\Assignments\ASSIGN~3\PART1~1\assign41.c
