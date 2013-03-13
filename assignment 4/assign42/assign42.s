	.module assign42.c
	.include 'BasicLCD.s'

	.area text
L4:
	.byte 48,48,48,48
	.dbfile assign42.c
	.dbfunc e main _main fV
;       int_temp -> -10,x
;      int_speed -> -8,x
; pointer_to_ascii -> -6,x
;       ret_char -> -4,x
_main::
	pshx
	tfr s,x
	leas -14,sp
	.dbline -1
	.dbline 17
; #include <stdio.h>
; #include "hcs12dp256.h"
; asm (".include 'BasicLCD.s'");
; 
; 
; void delay(int ms);
; 
; 
; //LCD subroutines
; extern void LCD_display(char in);
; extern void Lcd2PP_Init(void);
; extern void LCD_instruction(char in);
; //LCD subroutines overwritten
; void clearScreen(void);
; void DisplayLCD(char string[], char string1[], char string2[]);
; 
; void main (){
	.dbline 19
; 	 
; 	 int int_speed = 0;	   // initial speed
	ldd #0
	std -8,x
	.dbline 20
; 	 int int_temp = 150;	   // initial temprature
	ldd #150
	std -10,x
	.dbline 22
; 	 char *pointer_to_ascii;   
; 	 char ret_char[4] ="0000";
	leay -4,x
	xgdy
	ldy #L4
	pshx
	tfr d,x
	movw 2,y+,2,x+
	movw 0,y,0,x
	pulx
	.dbline 27
; 	 
; 	 //PTS = 0xFF;		   	//enabling U21_EN for the LCD
; 	 //PTT &= ~0x02;			//set RW=0
; 	 
; 	 Lcd2PP_Init();				// initializing the lcd
	jsr _Lcd2PP_Init
	.dbline 29
; 	 
; 	 convert_int_ascii(ret_char ,int_speed);
	movw -8,x,0,sp
	leay -4,x
	xgdy
	jsr _convert_int_ascii
	.dbline 30
; 	 pointer_to_ascii =& ret_char[0];
	leay -4,x
	sty -6,x
	.dbline 32
; 	
; 	 LCD_instruction(0x00);		// setting the lcd to print on 1st row 
	ldd #0
	jsr _LCD_instruction
	.dbline 33
; 	 DisplayLCD( "Speed :" ,pointer_to_ascii, "km/h" );		//print speed
	ldd #L6
	std 2,sp
	movw -6,x,0,sp
	ldd #L5
	jsr _DisplayLCD
	.dbline 35
; 	 
; 	 convert_int_ascii(ret_char ,int_temp);
	ldy -10,x
	sty 0,sp
	leay -4,x
	xgdy
	jsr _convert_int_ascii
	.dbline 36
; 	 pointer_to_ascii =& ret_char[0];
	leay -4,x
	sty -6,x
	.dbline 38
; 	 
; 	 LCD_instruction(0xC0);			 // setting the lcd to print on 2nd row
	ldd #192
	jsr _LCD_instruction
	.dbline 39
; 	 DisplayLCD("Temp :",pointer_to_ascii,"'C");		//print temprature
	ldd #L8
	std 2,sp
	movw -6,x,0,sp
	ldd #L7
	jsr _DisplayLCD
	.dbline 41
L9:
	.dbline 41
; 	 
; 	 for(;;){		  // infinite loop until board is reset
	.dbline 43
; 	 	
; 		if(key_pressed()=='E'){	  //if button 'E' is pressed
	jsr _key_pressed
	cpd #69
	bne L13
	.dbline 43
	.dbline 44
; 			int_speed++;		   //increment speed
	ldd -8,x
	addd #1
	std -8,x
	.dbline 45
; 			convert_int_ascii(ret_char ,int_speed);
	movw -8,x,0,sp
	leay -4,x
	xgdy
	jsr _convert_int_ascii
	.dbline 46
; 			pointer_to_ascii =& ret_char[0];
	leay -4,x
	sty -6,x
	.dbline 47
; 			LCD_instruction(0x00);		// setting the lcd to print on 1st row 
	ldd #0
	jsr _LCD_instruction
	.dbline 48
; 	 		DisplayLCD( "Speed :" ,pointer_to_ascii, "km/h" );		//print speed
	ldd #L6
	std 2,sp
	movw -6,x,0,sp
	ldd #L5
	jsr _DisplayLCD
	.dbline 50
; 			
; 			convert_int_ascii(ret_char ,int_temp);
	ldy -10,x
	sty 0,sp
	leay -4,x
	xgdy
	jsr _convert_int_ascii
	.dbline 51
; 			pointer_to_ascii =& ret_char[0];
	leay -4,x
	sty -6,x
	.dbline 53
; 	 
; 	 		LCD_instruction(0xC0);			 // setting the lcd to print on 2nd row
	ldd #192
	jsr _LCD_instruction
	.dbline 54
; 	 		DisplayLCD("Temp :",pointer_to_ascii,"'C");		//print temprature
	ldd #L8
	std 2,sp
	movw -6,x,0,sp
	ldd #L7
	jsr _DisplayLCD
	.dbline 56
	bra L9
L13:
	.dbline 56
	jsr _key_pressed
	cpd #68
	bne L9
	.dbline 56
	.dbline 57
	ldd -8,x
	subd #1
	std -8,x
	.dbline 58
	movw -8,x,0,sp
	leay -4,x
	xgdy
	jsr _convert_int_ascii
	.dbline 59
	leay -4,x
	sty -6,x
	.dbline 60
	ldd #0
	jsr _LCD_instruction
	.dbline 61
	ldd #L6
	std 2,sp
	movw -6,x,0,sp
	ldd #L5
	jsr _DisplayLCD
	.dbline 63
	ldy -10,x
	sty 0,sp
	leay -4,x
	xgdy
	jsr _convert_int_ascii
	.dbline 64
	leay -4,x
	sty -6,x
	.dbline 66
	ldd #192
	jsr _LCD_instruction
	.dbline 67
	ldd #L8
	std 2,sp
	movw -6,x,0,sp
	ldd #L7
	jsr _DisplayLCD
	.dbline 68
	.dbline 70
	.dbline 41
	.dbline 41
	lbra L9
X0:
	.dbline -2
L3:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l int_temp -10 I
	.dbsym l int_speed -8 I
	.dbsym l pointer_to_ascii -6 pc
	.dbsym l ret_char -4 A[4:4]c
	.dbend
	.dbfunc e clearScreen _clearScreen fV
_clearScreen::
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 76
; 			
; 		}else if(key_pressed()=='D'){
; 			int_speed--;		   //decrement speed
; 			convert_int_ascii(ret_char ,int_speed);
; 			pointer_to_ascii =& ret_char[0];
; 			LCD_instruction(0x00);		// setting the lcd to print on 1st row 
; 	 		DisplayLCD( "Speed :" ,pointer_to_ascii, "km/h" );		//print speed
; 			
; 			convert_int_ascii(ret_char ,int_temp);
; 			pointer_to_ascii =& ret_char[0];
; 	 
; 	 		LCD_instruction(0xC0);			 // setting the lcd to print on 2nd row
; 	 		DisplayLCD("Temp :",pointer_to_ascii,"'C");		//print temprature
; 		}
; 		
; 	 }//end for
; 	 
; 	 
; }
; 
; 
; void clearScreen(void){
	.dbline 77
; 	 LCD_instruction(0x00);
	ldd #0
	jsr _LCD_instruction
	.dbline 78
; 	 DisplayLCD(" "," "," ");
	ldd #L18
	std 2,sp
	ldd #L18
	std 0,sp
	ldd #L18
	jsr _DisplayLCD
	.dbline 79
; 	 LCD_instruction(0xC0);
	ldd #192
	jsr _LCD_instruction
	.dbline 80
; 	 DisplayLCD(" "," "," ");
	ldd #L18
	std 2,sp
	ldd #L18
	std 0,sp
	ldd #L18
	jsr _DisplayLCD
	.dbline -2
	.dbline 81
; }
L17:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e DisplayLCD _DisplayLCD fV
;         number -> -2,x
;        string2 -> 8,x
;        string1 -> 6,x
;         string -> 2,x
_DisplayLCD::
	pshd
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 83
; 
; void DisplayLCD(char string[], char string1[], char string2[]){
	.dbline 84
; 	 int number = 0;
	ldd #0
	std -2,x
	.dbline 86
L20:
	.dbline 86
; 	 
; 	 for(;;){
	.dbline 87
; 	 	LCD_display(*string);
	ldy 2,x
	ldab 0,y
	clra
	jsr _LCD_display
	.dbline 88
; 		string += 0x01;
	ldd 2,x
	addd #1
	std 2,x
	.dbline 89
; 		if(number == 16){
	ldd -2,x
	cpd #16
	bne L24
	.dbline 89
	.dbline 90
; 			LCD_instruction(0xC0);
	ldd #192
	jsr _LCD_instruction
	.dbline 91
; 		}
L24:
	.dbline 92
; 		if( *string == 0 ){
	ldy 2,x
	tst 0,y
	bne L20
	.dbline 92
	.dbline 93
; 			break;
	.dbline 95
; 		}
; 	 }
	.dbline 86
	.dbline 86
L22:
	.dbline 96
L28:
	.dbline 96
; 	 for(;;){
	.dbline 97
; 	 	LCD_display(*string1);
	ldy 6,x
	ldab 0,y
	clra
	jsr _LCD_display
	.dbline 98
; 		string1 += 0x01;
	ldd 6,x
	addd #1
	std 6,x
	.dbline 99
; 		if(number == 16){
	ldd -2,x
	cpd #16
	bne L32
	.dbline 99
	.dbline 100
; 			LCD_instruction(0xC0);
	ldd #192
	jsr _LCD_instruction
	.dbline 101
; 		}
L32:
	.dbline 102
; 		if( *string1 == 0 ){
	ldy 6,x
	tst 0,y
	bne L28
	.dbline 102
	.dbline 103
; 			break;
	.dbline 105
; 		}
; 	 }
	.dbline 96
	.dbline 96
L30:
	.dbline 106
L36:
	.dbline 106
; 	 for(;;){
	.dbline 107
; 	 	LCD_display(*string2);
	ldy 8,x
	ldab 0,y
	clra
	jsr _LCD_display
	.dbline 108
; 		string2 += 0x01;
	ldd 8,x
	addd #1
	std 8,x
	.dbline 109
; 		if(number == 16){
	ldd -2,x
	cpd #16
	bne L40
	.dbline 109
	.dbline 110
; 			LCD_instruction(0xC0);
	ldd #192
	jsr _LCD_instruction
	.dbline 111
; 		}
L40:
	.dbline 112
	ldy 8,x
	tst 0,y
	bne L36
	.dbline 112
	.dbline 113
	.dbline 115
	.dbline 106
	.dbline 106
L38:
	.dbline -2
	.dbline 116
; 		if( *string2 == 0 ){
; 			break;
; 		}
; 	 }
; }
L19:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l number -2 I
	.dbsym l string2 8 pc
	.dbsym l string1 6 pc
	.dbsym l string 2 pc
	.dbend
	.dbfunc e convert_int_ascii _convert_int_ascii fV
;              x -> 6,x
;       ret_char -> 2,x
_convert_int_ascii::
	pshd
	pshx
	tfr s,x
	.dbline -1
	.dbline 118
; 
; void convert_int_ascii(char ret_char[] , int x){
	.dbline 119
; 	 	ret_char[3]=0;		//NULL
	ldy 2,x
	clr 3,y
	.dbline 120
; 		ret_char[2]=(48+(x%10));
	ldd 6,x
	ldy #10
	exg x,y
	idivs
	exg x,y
	addd #48
	ldy 2,x
	stab 2,y
	.dbline 121
; 		x=x/10;
	ldd 6,x
	ldy #10
	exg x,y
	idivs
	exg x,y
	sty 6,x
	.dbline 122
; 		ret_char[1]=(48+(x%10));
	ldd 6,x
	ldy #10
	exg x,y
	idivs
	exg x,y
	addd #48
	ldy 2,x
	stab 1,y
	.dbline 123
; 		x=x/10;
	ldd 6,x
	ldy #10
	exg x,y
	idivs
	exg x,y
	sty 6,x
	.dbline 124
; 		ret_char[0]=(48+(x%10));
	ldd 6,x
	ldy #10
	exg x,y
	idivs
	exg x,y
	addd #48
	ldy 2,x
	stab 0,y
	.dbline -2
	.dbline 126
; 		
; }
L44:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l x 6 I
	.dbsym l ret_char 2 pc
	.dbend
L46:
	.byte 49,50
	.byte 51,'A
	.byte 52,53
	.byte 54,'B
	.byte 55,56
	.byte 57,'C
	.byte 'E,48
	.byte 'F,'D
	.dbfunc e key_pressed _key_pressed fc
;        key_pad -> -22,x
;       ret_char -> -6,x
;            col -> -5,x
;           bool -> -4,x
;            row -> -3,x
;          ret_v -> -2,x
;              r -> -1,x
_key_pressed::
	pshx
	tfr s,x
	leas -26,sp
	.dbline -1
	.dbline 128
; 
; char key_pressed(void){
	.dbline 131
; 	 
; 	 char ret_char;
; 	 char row = 1;
	ldab #1
	stab -3,x
	.dbline 132
; 	 char r = 1;
	ldab #1
	stab -1,x
	.dbline 137
; 	 char col;
; 	 #define HEIGT 4
; 	 #define WIDTH 4
; 	 char key_pad[HEIGT][WIDTH]=                                                    
;          {{'1','2','3','A'},                                              
	leay -22,x
	xgdy
	ldy #L46
	pshx
	tfr d,x
	ldd #8
X1:
	movw 2,y+,2,x+
	dbne d,X1
	pulx
	.dbline 142
;           {'4','5','6','B'},                                              
;           {'7','8','9','C'},                                              
;           {'E','0','F','D'}};
; 		  
; 	 char bool = 1;
	ldab #1
	stab -4,x
	.dbline 145
; 	 char ret_v;
; 
; 	SPI1CR1 = 0x00;		   //Turn off SPI
	clr 0xf0
	.dbline 146
; 	DDRP = 0x0F;		   //set P0-3 as outputs(PP0..3 for Key1..4)
	ldab #15
	stab 0x25a
	.dbline 147
; 	DDRH = 0x0F;		   //set H4-7 as inputs (Key5..8)
	ldab #15
	stab 0x262
	lbra L48
L47:
	.dbline 149
; 	
; 	while (bool){
	.dbline 152
; 		  
; 		  
; 		  PTM = 0x08;	   //Load data into U7 set U7_EN high (PM3) 
	ldab #8
	stab 0x250
	.dbline 153
; 		  PTP = r;	   //Write Key1..4 via PP0..3 
	movb -1,x,0x258
	.dbline 154
; 		  PTM = 0x00;	   //set U7_EN low (PM3)
	clr 0x250
	.dbline 156
; 		  
; 		  ret_v = PTH;	   //get column 
	; vol
	ldab 0x260
	stab -2,x
	.dbline 157
; 		  ret_v &= 0xF0;   //clear the last 4 bits
	bclr -2,x,#0xf
	.dbline 159
; 		  
; 		  if(ret_v == 0x10){
	ldab -2,x
	cmpb #16
	bne L50
	.dbline 159
	.dbline 160
; 		  	col = 0;
	clr -5,x
	.dbline 161
; 		  	ret_char = key_pad[row-1][col];
	ldab -3,x
	clra
	subd #1
	lsld
	lsld
	leay -22,x
	sty -24,x
	addd -24,x
	std -26,x
	ldab -5,x
	clra
	addd -26,x
	xgdy
	ldab 0,y
	stab -6,x
	.dbline 162
; 			bool = 0;
	clr -4,x
	.dbline 163
; 			delay(30);
	ldd #30
	jsr _delay
	.dbline 164
	lbra L51
L50:
	.dbline 164
; 		  } else if(ret_v == 0x20){
	ldab -2,x
	cmpb #32
	bne L52
	.dbline 164
	.dbline 165
; 		  	col = 1;
	ldab #1
	stab -5,x
	.dbline 166
; 		  	ret_char = key_pad[row-1][col];
	ldab -3,x
	clra
	subd #1
	lsld
	lsld
	leay -22,x
	sty -24,x
	addd -24,x
	std -26,x
	ldab -5,x
	clra
	addd -26,x
	xgdy
	ldab 0,y
	stab -6,x
	.dbline 167
; 			bool = 0;
	clr -4,x
	.dbline 168
; 			delay(30);
	ldd #30
	jsr _delay
	.dbline 169
; 			if(row == 4){
	ldab -3,x
	cmpb #4
	bne L53
	.dbline 169
	.dbline 170
; 				   break;
	lbra L49
X2:
	.dbline 172
L52:
	.dbline 172
; 			}
; 		  } else if(ret_v == 0x40){
	ldab -2,x
	cmpb #64
	bne L56
	.dbline 172
	.dbline 173
; 		  	col = 2;
	ldab #2
	stab -5,x
	.dbline 174
; 		  	ret_char = key_pad[row-1][col];
	ldab -3,x
	clra
	subd #1
	lsld
	lsld
	leay -22,x
	sty -24,x
	addd -24,x
	std -26,x
	ldab -5,x
	clra
	addd -26,x
	xgdy
	ldab 0,y
	stab -6,x
	.dbline 175
; 			bool = 0;
	clr -4,x
	.dbline 176
; 			delay(30);
	ldd #30
	jsr _delay
	.dbline 177
	bra L57
L56:
	.dbline 177
; 		  } else if(ret_v == 0x80){
	ldab -2,x
	cmpb #128
	bne L58
	.dbline 177
	.dbline 178
; 		  	col = 3;
	ldab #3
	stab -5,x
	.dbline 179
; 		  	ret_char = key_pad[row-1][col];
	ldab -3,x
	clra
	subd #1
	lsld
	lsld
	leay -22,x
	sty -24,x
	addd -24,x
	std -26,x
	ldab -5,x
	clra
	addd -26,x
	xgdy
	ldab 0,y
	stab -6,x
	.dbline 180
; 			bool = 0;
	clr -4,x
	.dbline 181
; 			delay(30);
	ldd #30
	jsr _delay
	.dbline 182
; 		  } 
L58:
L57:
L53:
L51:
	.dbline 183
; 		  	if(r == 1){
	ldab -1,x
	cmpb #1
	bne L60
	.dbline 183
	.dbline 184
; 				   r = 2;
	ldab #2
	stab -1,x
	.dbline 185
; 				   row = 2;
	ldab #2
	stab -3,x
	.dbline 186
	bra L61
L60:
	.dbline 186
; 			}else if(r == 2){
	ldab -1,x
	cmpb #2
	bne L62
	.dbline 186
	.dbline 187
; 				  r = 4;
	ldab #4
	stab -1,x
	.dbline 188
; 				  row = 3;
	ldab #3
	stab -3,x
	.dbline 189
	bra L63
L62:
	.dbline 189
; 			}else if(r == 4){
	ldab -1,x
	cmpb #4
	bne L64
	.dbline 189
	.dbline 190
; 				  r = 8;
	ldab #8
	stab -1,x
	.dbline 191
; 				  row = 4;
	ldab #4
	stab -3,x
	.dbline 192
	bra L65
L64:
	.dbline 192
; 			}else if(r == 8){
	ldab -1,x
	cmpb #8
	bne L66
	.dbline 192
	.dbline 193
; 				  r = 1;
	ldab #1
	stab -1,x
	.dbline 194
; 				  row = 1;
	ldab #1
	stab -3,x
	.dbline 195
; 			}
L66:
L65:
L63:
L61:
	.dbline 196
L48:
	.dbline 149
	tst -4,x
	lbne L47
L49:
	.dbline 197
; 	}//end while
; 	return ret_char;
	ldab -6,x
	clra
	.dbline -2
L45:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l key_pad -22 A[16:4:4]c
	.dbsym l ret_char -6 c
	.dbsym l col -5 c
	.dbsym l bool -4 c
	.dbsym l row -3 c
	.dbsym l ret_v -2 c
	.dbsym l r -1 c
	.dbend
	.dbfunc e delay _delay fV
;  delayConstant -> -6,x
;              i -> -4,x
;              j -> -2,x
;             ms -> 2,x
_delay::
	pshd
	pshx
	tfr s,x
	leas -6,sp
	.dbline -1
	.dbline 200
; }
; 
; void delay(int ms){
	.dbline 201
; 	 const int delayConstant = 1234;
	ldd #1234
	std -6,x
	.dbline 204
	ldd #0
	std -4,x
	bra L72
L69:
	.dbline 204
; 	 int i,j;
; 	 
; 	 for(i=0;i<ms;i++){
	.dbline 205
	ldd #0
	std -2,x
	bra L76
L73:
	.dbline 205
	.dbline 206
L74:
	.dbline 205
	ldd -2,x
	addd #1
	std -2,x
L76:
	.dbline 205
	ldd -2,x
	cpd 2,x
	blt L73
	.dbline 207
L70:
	.dbline 204
	ldd -4,x
	addd #1
	std -4,x
L72:
	.dbline 204
	ldd -4,x
	cpd 2,x
	blt L69
	.dbline -2
	.dbline 208
; 	 	   for(j=0;j<ms;j++){
; 		   }
; 	 }
; }
L68:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l delayConstant -6 I
	.dbsym l i -4 I
	.dbsym l j -2 I
	.dbsym l ms 2 I
	.dbend
L18:
	.byte 32,0
L8:
	.byte 39,'C,0
L7:
	.byte 'T,'e,'m,'p,32,58,0
L6:
	.byte 'k,'m,47,'h,0
L5:
	.byte 'S,'p,'e,'e,'d,32,58,0
