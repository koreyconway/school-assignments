CC = icc12w
CFLAGS =  -IC:\icc\include\ -e  -l -g -Wa-g 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -LC:\icc\lib\ -g -btext:0x4000 -bdata:0x1000 -dinit_sp:0x3DFF -fmots19
FILES = vectors_dp256_NoICE.o assign44.o 

assign44:	$(FILES)
	$(CC) -o assign44 $(LFLAGS) @assign44.lk  
vectors_dp256_NoICE.o:	M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1\vectors_dp256_NoICE.c
	$(CC) -c $(CFLAGS) M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1\vectors_dp256_NoICE.c
assign44.o: C:/icc/include/hcs12dp256.h C:/icc/include/hc12def.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1/../lib/keyboard.c C:/icc/include/hcs12dp256.h\
 M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1/../lib/stepper.c C:/icc/include/hcs12dp256.h M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1/../lib/lcd.c
assign44.o:	M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1\assign44.c
	$(CC) -c $(CFLAGS) M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1\assign44.c
