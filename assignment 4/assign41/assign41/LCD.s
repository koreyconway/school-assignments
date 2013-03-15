	.module LCD.c
	.area text
	.dbfile LCD.c
	.dbfunc e lcd_istruction _lcd_istruction fV
;             d1 -> -1,x
;           data -> 3,x
_lcd_istruction::
	pshd
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 5
; #include <stdio.h>
; #include "hcs12dp256.h"
; 
; 
; void lcd_istruction(char data){
	.dbline 7
; 	 
; 	 char d1 = 0x00;
	clr -1,x
	.dbline 8
; 	 d1 = data;
	movb 3,x,-1,x
	.dbline 9
; 	 d1 = d1 >> 4;
	ldab -1,x
	clra
	asra
	rorb
	asra
	rorb
	asra
	rorb
	asra
	rorb
	stab -1,x
	.dbline 10
; 	 PTP |= d1;
	ldab -1,x
	clra
	std -4,x
	; vol
	ldab 0x258
	clra
	ora -4,x
	orb -3,x
	stab 0x258
	.dbline 11
; 	 PTT &= ~0x04;		 //set RS=0 as it is an instruction
	bclr 0x240,#0x4
	.dbline 12
; 	 PTT |= 0x08;		 
	bset 0x240,#8
	.dbline 13
; 	 delay(100);
	ldd #100
	jsr _delay
	.dbline 14
; 	 PTT &= ~0x08;
	bclr 0x240,#0x8
	.dbline 16
; 	 
; 	 d1 = data;
	movb 3,x,-1,x
	.dbline 17
; 	 d1 &= 0x0F;
	bclr -1,x,#0xf0
	.dbline 18
; 	 PTP |= d1;
	ldab -1,x
	clra
	std -4,x
	; vol
	ldab 0x258
	clra
	ora -4,x
	orb -3,x
	stab 0x258
	.dbline 19
; 	 PTT &= ~0x04;		 //set RS=0 as it is an instruction
	bclr 0x240,#0x4
	.dbline 20
; 	 PTT |= 0x08;
	bset 0x240,#8
	.dbline 21
; 	 delay(100);
	ldd #100
	jsr _delay
	.dbline 22
; 	 PTT &= ~0x08;
	bclr 0x240,#0x8
	.dbline -2
	.dbline 24
; 	 
; }
L3:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l d1 -1 c
	.dbsym l data 2 I
	.dbsym l data 3 c
	.dbend
	.dbfunc e lcd_data _lcd_data fV
;             d1 -> -1,x
;           data -> 3,x
_lcd_data::
	pshd
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 26
; 
; void lcd_data(char data){
	.dbline 28
; 	 
; 	 char d1 = 0x00;
	clr -1,x
	.dbline 29
; 	 d1 = data;
	movb 3,x,-1,x
	.dbline 30
; 	 d1 = d1 >> 4;
	ldab -1,x
	clra
	asra
	rorb
	asra
	rorb
	asra
	rorb
	asra
	rorb
	stab -1,x
	.dbline 31
; 	 PTP |= d1;
	ldab -1,x
	clra
	std -4,x
	; vol
	ldab 0x258
	clra
	ora -4,x
	orb -3,x
	stab 0x258
	.dbline 32
; 	 PTT |= 0x04;		 //set RS=1 as it is data
	bset 0x240,#4
	.dbline 33
; 	 PTT |= 0x08;
	bset 0x240,#8
	.dbline 34
; 	 delay(100);
	ldd #100
	jsr _delay
	.dbline 35
; 	 PTT &= ~0x08;
	bclr 0x240,#0x8
	.dbline 37
; 	 
; 	 d1 = data;
	movb 3,x,-1,x
	.dbline 38
; 	 d1 &= 0x0F;
	bclr -1,x,#0xf0
	.dbline 39
; 	 PTP |= d1;
	ldab -1,x
	clra
	std -4,x
	; vol
	ldab 0x258
	clra
	ora -4,x
	orb -3,x
	stab 0x258
	.dbline 40
; 	 PTT |= 0x04;		 //set RS=1 as it is data
	bset 0x240,#4
	.dbline 41
; 	 PTT |= 0x08;
	bset 0x240,#8
	.dbline 42
; 	 delay(100);
	ldd #100
	jsr _delay
	.dbline 43
; 	 PTT &= ~0x08;
	bclr 0x240,#0x8
	.dbline -2
	.dbline 45
; 	 
; }
L4:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l d1 -1 c
	.dbsym l data 2 I
	.dbsym l data 3 c
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
	.dbline 47
; 
; void delay (int ms){
	.dbline 49
; 
; 	 const int delayConstant = 1234;
	ldd #1234
	std -4,x
	.dbline 52
	ldd #0
	std -6,x
	bra L9
L6:
	.dbline 52
; 	 int i, j;
; 	 
; 	 for (i=0; i<ms; i++) {
	.dbline 53
	ldd #0
	std -2,x
	bra L13
L10:
	.dbline 53
	.dbline 54
L11:
	.dbline 53
	ldd -2,x
	addd #1
	std -2,x
L13:
	.dbline 53
	ldd -2,x
	cpd -4,x
	blt L10
	.dbline 55
L7:
	.dbline 52
	ldd -6,x
	addd #1
	std -6,x
L9:
	.dbline 52
	ldd -6,x
	cpd 2,x
	blt L6
	.dbline -2
	.dbline 57
; 	 	 for (j=0; j<delayConstant; j++) {
; 		 }
; 	}
; 	
; }
L5:
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
	.dbfunc e main _main fV
;           test -> -1,x
_main::
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 59
; 
; void main(){
	.dbline 61
; 	 
; 	char test = 0x00;
	clr -1,x
	.dbline 63
; 		  
; 	PTS = 0xFF;		   		//enabling U21_EN for the LCD
	ldab #255
	stab 0x248
	.dbline 64
; 	PTT &= ~0x02;			//set RW=0
	bclr 0x240,#0x2
	.dbline 66
; 	
; 	lcd_istruction(0x38);		  //function set
	ldd #56
	jsr _lcd_istruction
	.dbline 67
; 	lcd_istruction(0x0E);		  //Display on/off control
	ldd #14
	jsr _lcd_istruction
	.dbline 68
; 	lcd_istruction(0x06);		  //Entry Mode set
	ldd #6
	jsr _lcd_istruction
	.dbline 69
; 	lcd_istruction(0x01);		  //clear display
	ldd #1
	jsr _lcd_istruction
	bra L16
L15:
	.dbline 71
	.dbline 72
	ldab -1,x
	clra
	jsr _lcd_data
	.dbline 73
	ldab -1,x
	clra
	std 0,sp
	ldd #L18
	jsr _printf
	.dbline 74
	ldab -1,x
	clra
	addd #1
	stab -1,x
	.dbline 75
L16:
	.dbline 71
; 	
; 	while(test<0xFF){
	ldab -1,x
	cmpb #255
	blo L15
	.dbline 76
; 	lcd_data(test);
; 	printf("test : ",test);
; 	test++;
; 	}
; 	printf("End");
	ldd #L19
	jsr _printf
	.dbline -2
	.dbline 78
; 	
; }
L14:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l test -1 c
	.dbend
L19:
	.byte 'E,'n,'d,0
L18:
	.byte 't,'e,'s,'t,32,58,32,0
