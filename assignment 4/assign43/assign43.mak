CC = icc12w
CFLAGS =  -IC:\icc\include\ -e  -l -g -Wa-g 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -LC:\icc\lib\ -g -btext:0x4000 -bdata:0x1000 -dinit_sp:0x3DFF -fmots19
FILES = assign43.o basicLCD.o DP256Reg.o 

assign43:	$(FILES)
	$(CC) -o assign43 $(LFLAGS) @assign43.lk  
assign43.o: C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h M:\SYSC20~3\ASSIGN~4\assign43/hcs12dp256.h C:/icc/include/hc12def.h
assign43.o:	M:\SYSC20~3\ASSIGN~4\assign43\assign43.c
	$(CC) -c $(CFLAGS) M:\SYSC20~3\ASSIGN~4\assign43\assign43.c
basicLCD.o: M:\SYSC20~3\ASSIGN~4\assign43\DP256reg.s 
basicLCD.o:	M:\SYSC20~3\ASSIGN~4\assign43\basicLCD.s
	$(CC) -c $(ASFLAGS) M:\SYSC20~3\ASSIGN~4\assign43\basicLCD.s
DP256Reg.o:	M:\SYSC20~3\ASSIGN~4\assign43\DP256Reg.s
	$(CC) -c $(ASFLAGS) M:\SYSC20~3\ASSIGN~4\assign43\DP256Reg.s
