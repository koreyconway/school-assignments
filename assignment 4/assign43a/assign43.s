	.module assign43.c
	.area text
	.dbfile assign43.c
	.dbfunc e main _main fV
_main::
	.dbline -1
	.dbline 5
; #include <stdio.h>
; #include "hcs12dp256.h"
; 
; 
; void main(){
	.dbline 8
; 
; 	 
; 	 SPI1CR1 = 0x00;		   //Turn off SPI
	clr 0xf0
	.dbline 10
; 	 
; 	 DDRP = 0xFF;
	ldab #255
	stab 0x25a
	.dbline 11
; 	 DDRT = 0xFF;
	ldab #255
	stab 0x242
	.dbline 13
; 	 
; 	 PTP = 0x20; 			   //STEPPER EN at PP5  
	ldab #32
	stab 0x258
	.dbline 15
; 	 
; 	 delay(20);
	ldd #20
	jsr _delay
	.dbline 19
; 	 
; 	 //use _360_clockwise() twice to rotate 
; 	 //stepper motor rotate clockwise 2 turns
; 	 _360_clockwise();
	jsr __360_clockwise
	.dbline 20
; 	 delay(300);
	ldd #300
	jsr _delay
	.dbline 21
; 	 _360_clockwise();
	jsr __360_clockwise
	.dbline 23
; 	 
; 	 delay(300);
	ldd #300
	jsr _delay
	.dbline 26
; 	 //use _360_anti_clockwise() twice to rotate 
; 	 //stepper motor rotate ant-clockwise 2 turns
; 	 _360_anti_clockwise();
	jsr __360_anti_clockwise
	.dbline 27
; 	 delay(300);
	ldd #300
	jsr _delay
	.dbline 28
; 	 _360_anti_clockwise();
	jsr __360_anti_clockwise
	.dbline 32
; 	 
; 	 
; 	 
; 	 printf("end");
	ldd #L4
	jsr _printf
	.dbline -2
	.dbline 34
; 	 
; }
L3:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e _360_anti_clockwise __360_anti_clockwise fV
;              i -> -2,x
__360_anti_clockwise::
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 36
; 
; void _360_anti_clockwise(){
	.dbline 39
	ldd #0
	std -2,x
L6:
	.dbline 39
	.dbline 40
	ldab #96
	stab 0x240
	.dbline 41
	ldd #10
	jsr _delay
	.dbline 42
	ldab #32
	stab 0x240
	.dbline 43
	ldd #10
	jsr _delay
	.dbline 44
	clr 0x240
	.dbline 45
	ldd #10
	jsr _delay
	.dbline 46
	ldab #64
	stab 0x240
	.dbline 47
	ldd #10
	jsr _delay
	.dbline 48
L7:
	.dbline 39
; 	 int i ;
; 	 //stepper motor 360 degree turn anti-clock wise
; 	 for(i=0;i<5;i++){
	ldd -2,x
	addd #1
	std -2,x
	.dbline 39
	ldd -2,x
	cpd #5
	blt L6
	.dbline -2
	.dbline 49
; 	 PTT = 0x60;
; 	 delay(10);
; 	 PTT = 0x20;
; 	 delay(10);
; 	 PTT = 0x00;
; 	 delay(10);
; 	 PTT = 0x40;
; 	 delay(10);	 
; 	 }	
; }
L5:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l i -2 I
	.dbend
	.dbfunc e _360_clockwise __360_clockwise fV
;              i -> -2,x
__360_clockwise::
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 52
; 
; 
; void _360_clockwise(){
	.dbline 55
	ldd #0
	std -2,x
L11:
	.dbline 55
	.dbline 56
	ldab #64
	stab 0x240
	.dbline 57
	ldd #10
	jsr _delay
	.dbline 58
	clr 0x240
	.dbline 59
	ldd #10
	jsr _delay
	.dbline 60
	ldab #32
	stab 0x240
	.dbline 61
	ldd #10
	jsr _delay
	.dbline 62
	ldab #96
	stab 0x240
	.dbline 63
	ldd #10
	jsr _delay
	.dbline 64
L12:
	.dbline 55
; 	 int i ;
; 	 //stepper motor 360 degree turn anti-clock wise
; 	 for(i=0;i<5;i++){
	ldd -2,x
	addd #1
	std -2,x
	.dbline 55
	ldd -2,x
	cpd #5
	blt L11
	.dbline -2
	.dbline 65
; 	 PTT = 0x40;
; 	 delay(10);
; 	 PTT = 0x00;
; 	 delay(10);
; 	 PTT = 0x20;
; 	 delay(10);
; 	 PTT = 0x60;
; 	 delay(10);	 
; 	 }	
; }
L10:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l i -2 I
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
	.dbline 67
; 
; void delay (int ms){
	.dbline 69
; 
; 	 const int delayConstant = 1234;
	ldd #1234
	std -4,x
	.dbline 72
	ldd #0
	std -6,x
	bra L19
L16:
	.dbline 72
; 	 int i, j;
; 	 
; 	 for (i=0; i<ms; i++) {
	.dbline 73
	ldd #0
	std -2,x
	bra L23
L20:
	.dbline 73
	.dbline 74
L21:
	.dbline 73
	ldd -2,x
	addd #1
	std -2,x
L23:
	.dbline 73
	ldd -2,x
	cpd -4,x
	blt L20
	.dbline 75
L17:
	.dbline 72
	ldd -6,x
	addd #1
	std -6,x
L19:
	.dbline 72
	ldd -6,x
	cpd 2,x
	blt L16
	.dbline -2
	.dbline 77
; 	 	 for (j=0; j<delayConstant; j++) {
; 		 }
; 	}
; 	
; }
L15:
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
L4:
	.byte 'e,'n,'d,0
