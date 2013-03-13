	.module assign43.c
	.area text
	.dbfile M:\SYSC20~3\ASSIGN~4\assign43\assign43.c
	.dbfunc e main _main fV
_main::
	.dbline -1
	.dbline 5
; #include <stdio.h>
; #include "hcs12dp256.h"
; 
; 
; void main(){
	.dbline 6
; 	 SPI1CR1 = 0x00;		   //Turn off SPI
	clr 0xf0
	.dbline 7
; 	 DDRP = 0xFF;
	ldab #255
	stab 0x25a
	.dbline 8
; 	 DDRT = 0xFF;
	ldab #255
	stab 0x242
	.dbline 10
; 	 
; 	 PTP = 0x20;
	ldab #32
	stab 0x258
	.dbline 11
; 	 delay(50);
	ldd #50
	jsr _delay
	.dbline 12
; 	 PTT = 0x04;
	ldab #4
	stab 0x240
	.dbline 13
; 	 delay(50);
	ldd #50
	jsr _delay
	.dbline 14
; 	 PTT = 0x04;
	ldab #4
	stab 0x240
	.dbline 15
; 	 delay(50);
	ldd #50
	jsr _delay
	.dbline 16
; 	 PTT = 0x04;
	ldab #4
	stab 0x240
	.dbline 17
; 	 delay(50);
	ldd #50
	jsr _delay
	.dbline 18
; 	 PTT = 0x04;
	ldab #4
	stab 0x240
	.dbline 19
; 	 delay(50);
	ldd #50
	jsr _delay
	.dbline 20
; 	 PTT = 0x04;
	ldab #4
	stab 0x240
	.dbline 21
; 	 delay(50);
	ldd #50
	jsr _delay
	.dbline 22
; 	 PTT = 0x04;
	ldab #4
	stab 0x240
	.dbline 23
; 	 delay(50);
	ldd #50
	jsr _delay
	.dbline 25
; 	
; 	 printf("yo");
	ldd #L4
	jsr _printf
	.dbline 26
; 	 delay(1000);
	ldd #1000
	jsr _delay
	.dbline 29
; 	
; 
; 	 delay(50);
	ldd #50
	jsr _delay
	.dbline 30
; 	 PTT = 0x20;
	ldab #32
	stab 0x240
	.dbline 31
; 	 delay(50);
	ldd #50
	jsr _delay
	.dbline 32
; 	 PTT = 0x20;
	ldab #32
	stab 0x240
	.dbline 33
; 	 delay(50);
	ldd #50
	jsr _delay
	.dbline 34
; 	 PTT = 0x20;
	ldab #32
	stab 0x240
	.dbline 35
; 	 delay(50);
	ldd #50
	jsr _delay
	.dbline 36
; 	 PTT = 0x20;
	ldab #32
	stab 0x240
	.dbline 37
; 	 delay(50);
	ldd #50
	jsr _delay
	.dbline 38
; 	 PTT = 0x20;
	ldab #32
	stab 0x240
	.dbline 39
; 	 delay(50);
	ldd #50
	jsr _delay
	.dbline 40
; 	 PTT = 0x20;
	ldab #32
	stab 0x240
	.dbline 41
; 	 delay(50);
	ldd #50
	jsr _delay
	.dbline 42
; 	 PTP = 0x00;
	clr 0x258
	.dbline 45
; 	 
; 	 
; 	 printf("end");
	ldd #L5
	jsr _printf
	.dbline -2
	.dbline 47
; 	 
; }
L3:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e delay _delay fV
;              i -> -6,x
;  delayConstant -> -4,x
;              j -> -2,x
;             ms -> 2,x
_delay::
	pshd
	pshx
	tfr s,x
	leas -6,sp
	.dbline -1
	.dbline 49
; 
; void delay (int ms){
	.dbline 51
; 
; 	 const int delayConstant = 1234;
	ldd #1234
	std -4,x
	.dbline 54
	ldd #0
	std -6,x
	bra L10
L7:
	.dbline 54
; 	 int i, j;
; 	 
; 	 for (i=0; i<ms; i++) {
	.dbline 55
	ldd #0
	std -2,x
	bra L14
L11:
	.dbline 55
	.dbline 56
L12:
	.dbline 55
	ldd -2,x
	addd #1
	std -2,x
L14:
	.dbline 55
	ldd -2,x
	cpd -4,x
	blt L11
	.dbline 57
L8:
	.dbline 54
	ldd -6,x
	addd #1
	std -6,x
L10:
	.dbline 54
	ldd -6,x
	cpd 2,x
	blt L7
	.dbline -2
	.dbline 59
; 	 	 for (j=0; j<delayConstant; j++) {
; 		 }
; 	}
; 	
; }
L6:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l i -6 I
	.dbsym l delayConstant -4 I
	.dbsym l j -2 I
	.dbsym l ms 2 I
	.dbend
L5:
	.byte 'e,'n,'d,0
L4:
	.byte 'y,'o,0
