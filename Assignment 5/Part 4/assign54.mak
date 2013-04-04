CC = icc12w
CFLAGS =  -IC:\icc\include\ -e  -l -g -Wa-g 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -LC:\icc\lib\ -g -btext:0x4000 -bdata:0x1000 -dinit_sp:0x3DFF -fmots19
FILES = assign54.o vectors_dp256_NoICE.o basicLCD.o 

assign54:	$(FILES)
	$(CC) -o assign54 $(LFLAGS) @assign54.lk  
assign54.o: C:/icc/include/hcs12dp256.h C:/icc/include/hc12def.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/motor.c M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/rti.c\
 M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/keyboard.c C:/icc/include/hcs12dp256.h M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/lcd.c M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/temperature.c C:/icc/include/hcs12dp256.h\
 M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/stepper.c C:/icc/include/hcs12dp256.h M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/buzzer.c C:/icc/include/hcs12dp256.h M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/led.c\
 C:/icc/include/hcs12dp256.h
assign54.o:	M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1\assign54.c
	$(CC) -c $(CFLAGS) M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1\assign54.c
vectors_dp256_NoICE.o:	M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1\vectors_dp256_NoICE.c
	$(CC) -c $(CFLAGS) M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1\vectors_dp256_NoICE.c
basicLCD.o: M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1\DP256reg.s 
basicLCD.o:	M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1\basicLCD.s
	$(CC) -c $(ASFLAGS) M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1\basicLCD.s
