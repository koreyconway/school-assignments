CC = icc12w
CFLAGS =  -IC:\icc\include\ -e  -l -g -Wa-g 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -LC:\icc\lib\ -g -btext:0x4000 -bdata:0x1000 -dinit_sp:0x3DFF -fmots19
FILES = assign42.o 

assign42:	$(FILES)
	$(CC) -o assign42 $(LFLAGS) @assign42.lk  
assign42.o: C:/icc/include/hcs12dp256.h C:/icc/include/hc12def.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h M:\SYSC20~2\Assignments\ASSIGN~3\PART2~1/../lib/keyboard.c C:/icc/include/hcs12dp256.h\
 M:\SYSC20~2\Assignments\ASSIGN~3\PART2~1/../lib/lcd.c
assign42.o:	M:\SYSC20~2\Assignments\ASSIGN~3\PART2~1\assign42.c
	$(CC) -c $(CFLAGS) M:\SYSC20~2\Assignments\ASSIGN~3\PART2~1\assign42.c
