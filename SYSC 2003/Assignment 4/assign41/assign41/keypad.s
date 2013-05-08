	.module keypad.c
	.area text
L4:
	.byte 49,50
	.byte 51,'A
	.byte 52,53
	.byte 54,'B
	.byte 55,56
	.byte 57,'C
	.byte 'E,48
	.byte 'F,'D
	.dbfile keypad.c
	.dbfunc e main _main fV
;        key_pad -> -21,x
;           bool -> -5,x
;            col -> -4,x
;            row -> -3,x
;          ret_v -> -2,x
;              r -> -1,x
_main::
	pshx
	tfr s,x
	leas -28,sp
	.dbline -1
	.dbline 5
; #include <stdio.h>
; #include "hcs12dp256.h"
; 
; 
; void main(){
	.dbline 7
; 	 
; 	 char row = 1;
	ldab #1
	stab -3,x
	.dbline 8
; 	 char r = 1;
	ldab #1
	stab -1,x
	.dbline 13
; 	 char col;
; 	 #define HEIGT 4
; 	 #define WIDTH 4
; 	 char key_pad[HEIGT][WIDTH]=                                                    
;          {{'1','2','3','A'},                                              
	leay -21,x
	xgdy
	ldy #L4
	pshx
	tfr d,x
	ldd #8
X0:
	movw 2,y+,2,x+
	dbne d,X0
	pulx
	.dbline 18
;           {'4','5','6','B'},                                              
;           {'7','8','9','C'},                                              
;           {'E','0','F','D'}};
; 		  
; 	 char bool = 1;
	ldab #1
	stab -5,x
	.dbline 21
; 	 char ret_v;
; 
; 	SPI1CR1 = 0x00;		   //Turn off SPI
	clr 0xf0
	.dbline 22
; 	DDRP = 0x0F;		   //set P0-3 as outputs(PP0..3 for Key1..4)
	ldab #15
	stab 0x25a
	.dbline 23
; 	DDRH = 0x0F;		   //set H4-7 as inputs (Key5..8)
	ldab #15
	stab 0x262
	lbra L6
L5:
	.dbline 25
; 	
; 	while (bool){
	.dbline 28
; 		  
; 		  
; 		  PTM = 0x08;	   //Load data into U7 set U7_EN high (PM3) 
	ldab #8
	stab 0x250
	.dbline 29
; 		  PTP = r;	   //Write Key1..4 via PP0..3 
	movb -1,x,0x258
	.dbline 30
; 		  PTM = 0x00;	   //set U7_EN low (PM3)
	clr 0x250
	.dbline 32
; 		  
; 		  ret_v = PTH;	   //get column 
	; vol
	ldab 0x260
	stab -2,x
	.dbline 33
; 		  ret_v &= 0xF0;   //clear the last 4 bits
	bclr -2,x,#0xf
	.dbline 35
; 		  
; 		  if(ret_v == 0x10){
	ldab -2,x
	cmpb #16
	bne L8
	.dbline 35
	.dbline 36
; 		  	col = 0;
	clr -4,x
	.dbline 37
; 		  	printf("key : %c",key_pad[row-1][col]);
	ldab -3,x
	clra
	subd #1
	lsld
	lsld
	leay -21,x
	sty -24,x
	addd -24,x
	std -26,x
	ldab -4,x
	clra
	addd -26,x
	xgdy
	ldab 0,y
	clra
	std 0,sp
	ldd #L10
	jsr _printf
	.dbline 38
; 			printf("\n");
	ldd #L11
	jsr _printf
	.dbline 39
; 			delay(30);
	ldd #30
	jsr _delay
	.dbline 40
	lbra L9
L8:
	.dbline 40
; 		  } else if(ret_v == 0x20){
	ldab -2,x
	cmpb #32
	bne L12
	.dbline 40
	.dbline 41
; 		  	col = 1;
	ldab #1
	stab -4,x
	.dbline 42
; 		  	printf("key : %c",key_pad[row-1][col]);
	ldab -3,x
	clra
	subd #1
	lsld
	lsld
	leay -21,x
	sty -24,x
	addd -24,x
	std -26,x
	ldab -4,x
	clra
	addd -26,x
	xgdy
	ldab 0,y
	clra
	std 0,sp
	ldd #L10
	jsr _printf
	.dbline 43
; 			printf("\n");
	ldd #L11
	jsr _printf
	.dbline 44
; 			delay(30);
	ldd #30
	jsr _delay
	.dbline 45
; 			if(row == 4){
	ldab -3,x
	cmpb #4
	lbne L13
	.dbline 45
	.dbline 46
; 				   break;
	lbra L7
X1:
	.dbline 48
L12:
	.dbline 48
; 			}
; 		  } else if(ret_v == 0x40){
	ldab -2,x
	cmpb #64
	bne L16
	.dbline 48
	.dbline 49
; 		  	col = 2;
	ldab #2
	stab -4,x
	.dbline 50
; 		  	printf("key : %c",key_pad[row-1][col]);
	ldab -3,x
	clra
	subd #1
	lsld
	lsld
	leay -21,x
	sty -24,x
	addd -24,x
	std -26,x
	ldab -4,x
	clra
	addd -26,x
	xgdy
	ldab 0,y
	clra
	std 0,sp
	ldd #L10
	jsr _printf
	.dbline 51
; 			printf("\n");
	ldd #L11
	jsr _printf
	.dbline 52
; 			delay(30);
	ldd #30
	jsr _delay
	.dbline 53
	bra L17
L16:
	.dbline 53
; 		  } else if(ret_v == 0x80){
	ldab -2,x
	cmpb #128
	bne L18
	.dbline 53
	.dbline 54
; 		  	col = 3;
	ldab #3
	stab -4,x
	.dbline 55
; 		  	printf("key : %c",key_pad[row-1][col]);
	ldab -3,x
	clra
	subd #1
	lsld
	lsld
	leay -21,x
	sty -24,x
	addd -24,x
	std -26,x
	ldab -4,x
	clra
	addd -26,x
	xgdy
	ldab 0,y
	clra
	std 0,sp
	ldd #L10
	jsr _printf
	.dbline 56
; 			printf("\n");
	ldd #L11
	jsr _printf
	.dbline 57
; 			delay(30);
	ldd #30
	jsr _delay
	.dbline 58
; 		  } 
L18:
L17:
L13:
L9:
	.dbline 59
; 		  	if(r == 1){
	ldab -1,x
	cmpb #1
	bne L20
	.dbline 59
	.dbline 60
; 				   r = 2;
	ldab #2
	stab -1,x
	.dbline 61
; 				   row = 2;
	ldab #2
	stab -3,x
	.dbline 62
	bra L21
L20:
	.dbline 62
; 			}else if(r == 2){
	ldab -1,x
	cmpb #2
	bne L22
	.dbline 62
	.dbline 63
; 				  r = 4;
	ldab #4
	stab -1,x
	.dbline 64
; 				  row = 3;
	ldab #3
	stab -3,x
	.dbline 65
	bra L23
L22:
	.dbline 65
; 			}else if(r == 4){
	ldab -1,x
	cmpb #4
	bne L24
	.dbline 65
	.dbline 66
; 				  r = 8;
	ldab #8
	stab -1,x
	.dbline 67
; 				  row = 4;
	ldab #4
	stab -3,x
	.dbline 68
	bra L25
L24:
	.dbline 68
; 			}else if(r == 8){
	ldab -1,x
	cmpb #8
	bne L26
	.dbline 68
	.dbline 69
; 				  r = 1;
	ldab #1
	stab -1,x
	.dbline 70
; 				  row = 1;
	ldab #1
	stab -3,x
	.dbline 71
; 			}
L26:
L25:
L23:
L21:
	.dbline 74
L6:
	.dbline 25
	tst -5,x
	lbne L5
L7:
	.dbline 76
; 		  
; 		  
; 	}//end while
; 	
; 	printf("End");
	ldd #L28
	jsr _printf
	.dbline -2
	.dbline 78
; 	
; }
L3:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l key_pad -21 A[16:4:4]c
	.dbsym l bool -5 c
	.dbsym l col -4 c
	.dbsym l row -3 c
	.dbsym l ret_v -2 c
	.dbsym l r -1 c
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
	.dbline 81
; 
; 
; void delay (int ms){
	.dbline 83
; 
; 	 const int delayConstant = 1234;
	ldd #1234
	std -4,x
	.dbline 86
	ldd #0
	std -6,x
	bra L33
L30:
	.dbline 86
; 	 int i, j;
; 	 
; 	 for (i=0; i<ms; i++) {
	.dbline 87
	ldd #0
	std -2,x
	bra L37
L34:
	.dbline 87
	.dbline 88
L35:
	.dbline 87
	ldd -2,x
	addd #1
	std -2,x
L37:
	.dbline 87
	ldd -2,x
	cpd -4,x
	blt L34
	.dbline 89
L31:
	.dbline 86
	ldd -6,x
	addd #1
	std -6,x
L33:
	.dbline 86
	ldd -6,x
	cpd 2,x
	blt L30
	.dbline -2
	.dbline 91
; 	 	 for (j=0; j<delayConstant; j++) {
; 		 }
; 	}
; 	
; }
L29:
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
L28:
	.byte 'E,'n,'d,0
L11:
	.byte 10,0
L10:
	.byte 'k,'e,'y,32,58,32,37,'c,0
