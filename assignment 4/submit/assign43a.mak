CC = icc12w
CFLAGS =  -IC:\icc\include\ -e  -l -g -Wa-g 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -LC:\icc\lib\ -g -btext:0x4000 -bdata:0x1000 -dinit_sp:0x3DFF -fmots19
FILES = assign43a.o 

assign43a:	$(FILES)
	$(CC) -o assign43a $(LFLAGS) @assign43a.lk  
assign43a.o: C:/icc/include/hcs12dp256.h C:/icc/include/hc12def.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h M:\SYSC20~2\Assignments\ASSIGN~3\PART3A~1/../lib/stepper.c C:/icc/include/hcs12dp256.h
assign43a.o:	M:\SYSC20~2\Assignments\ASSIGN~3\PART3A~1\assign43a.c
	$(CC) -c $(CFLAGS) M:\SYSC20~2\Assignments\ASSIGN~3\PART3A~1\assign43a.c
