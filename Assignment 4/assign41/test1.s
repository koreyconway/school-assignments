	.module test1.c
	.area text
	.dbfile test1.c
	.dbfunc e main _main fI
;              a -> -2,x
;              x -> -1,x
_main::
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 4
; #include <stdio.h>
; #include "hcs12dp256.h"
; 
; main(){
	.dbline 6
; 
; 	  char a = 0x09;
	ldab #9
	stab -2,x
	.dbline 7
; 	  char x = 0;
	clr -1,x
	.dbline 8
; 	DDRK = 0xFF;	  			   				   // initialize port K for LED output 
	ldab #255
	stab 0x33
	.dbline 10
; 	
; 	PTM = 0x08;									   // initialize port M 3 bit to 1 to enable U7_EN
	ldab #8
	stab 0x250
	.dbline 11
; 	DDRT = 0x0F;								   // initialize the data direction register for port T
	ldab #15
	stab 0x242
	bra L5
L4:
	.dbline 12
; 	while(x<10){
	.dbline 13
; 		printf("x : %d",x);
	ldab -1,x
	clra
	std 0,sp
	ldd #L7
	jsr _printf
	.dbline 14
; 		printf("\n");
	ldd #L8
	jsr _printf
	.dbline 15
; 		printf("a : %d",a);
	ldab -2,x
	clra
	std 0,sp
	ldd #L9
	jsr _printf
	.dbline 16
; 		printf("\n");
	ldd #L8
	jsr _printf
	.dbline 18
; 		
; 		PTT = a;
	movb -2,x,0x240
	.dbline 19
; 		a--;
	ldab -2,x
	clra
	subd #1
	stab -2,x
	.dbline 20
; 		x++;
	ldab -1,x
	clra
	addd #1
	stab -1,x
	.dbline 21
; 		delay(100);
	ldd #100
	jsr _delay
	.dbline 22
; 		if(x==10){
	ldab -1,x
	cmpb #10
	bne L10
	.dbline 22
	.dbline 23
; 			x=0;
	clr -1,x
	.dbline 24
; 			a=9;
	ldab #9
	stab -2,x
	.dbline 26
; 			
; 				PORTK = 0x2F;
	ldab #47
	stab 0x32
	.dbline 27
; 				delay(100);
	ldd #100
	jsr _delay
	.dbline 28
; 				PORTK = 0x00;
	clr 0x32
	.dbline 30
; 			
; 		}
L10:
	.dbline 31
L5:
	.dbline 12
	ldab -1,x
	cmpb #10
	blo L4
	.dbline -2
	.dbline 32
; 	}
; }
L3:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l a -2 c
	.dbsym l x -1 c
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
	.dbline 35
; 
; 
; void delay (int ms){
	.dbline 37
; 
; 	 const int delayConstant = 1234;
	ldd #1234
	std -4,x
	.dbline 40
	ldd #0
	std -6,x
	bra L16
L13:
	.dbline 40
; 	 int i, j;
; 	 
; 	 for (i=0; i<ms; i++) {
	.dbline 41
	ldd #0
	std -2,x
	bra L20
L17:
	.dbline 41
	.dbline 42
L18:
	.dbline 41
	ldd -2,x
	addd #1
	std -2,x
L20:
	.dbline 41
	ldd -2,x
	cpd -4,x
	blt L17
	.dbline 43
L14:
	.dbline 40
	ldd -6,x
	addd #1
	std -6,x
L16:
	.dbline 40
	ldd -6,x
	cpd 2,x
	blt L13
	.dbline -2
	.dbline 45
; 	 	 for (j=0; j<delayConstant; j++) {
; 		 }
; 	}
; 	
; }
L12:
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
L9:
	.byte 'a,32,58,32,37,'d,0
L8:
	.byte 10,0
L7:
	.byte 'x,32,58,32,37,'d,0
