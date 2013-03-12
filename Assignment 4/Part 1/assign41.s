	.module assign41.c
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
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART1~1\assign41.c
	.dbfunc e main _main fI
;          loopi -> -24,x
;       char_arr -> -22,x
;            col -> -6,x
;       row_mask -> -4,x
;            row -> -2,x
_main::
	pshx
	tfr s,x
	leas -30,sp
	.dbline -1
	.dbline 9
; //#include <hc12.h>
; #include <hcs12dp256.h>
; #include <stdio.h>
; 
; //char collision_detection (int speed, unsigned int * proximity);
; //void change_speed(int * speed, int value);
; 
; int main()
; {
	.dbline 10
;    int row_mask = 0x01;
	ldd #1
	std -4,x
	.dbline 11
;    int row = 0;
	ldd #0
	std -2,x
	.dbline 12
;    int col = 0;
	ldd #0
	std -6,x
	.dbline 13
;    char char_arr[4][4] = {{'1', '2', '3', 'A'},
	leay -22,x
	xgdy
	ldy #L4
	pshx
	tfr d,x
	ldd #8
X0:
	movw 2,y+,2,x+
	dbne d,X0
	pulx
	.dbline 17
;    					  {'4', '5', '6', 'B'},
; 					  {'7', '8', '9', 'C'},
; 					  {'E', '0', 'F', 'D'}};
;    int loopi = 0;
	ldd #0
	std -24,x
	.dbline 20
; 					
;    
;    setbaud(BAUD19K);
	ldd #26
	jsr _setbaud
	.dbline 23
;    
;    // Turn off SPI (not explained why yet)
;    SPI1CR1 = 0x00;
	clr 0xf0
	.dbline 26
;    
;    // Enable keyboard and disable motors on port P
;    DDRP = 0x0F;
	ldab #15
	stab 0x25a
	.dbline 29
;    
;    // Enable reading from keyboard (High bits of DDRH)
;    DDRH = DDRH & 0x0F;
	bclr 0x262,#0xf0
	lbra L6
L5:
	.dbline 32
;    
;    
;    while ( 1 ) {
	.dbline 33
;    		 PTP = row_mask;
	ldd -4,x
	stab 0x258
	.dbline 35
; 		 
; 		 col = getKeyboardCol();
	jsr _getKeyboardCol
	std -6,x
	.dbline 38
; 		 
; 		 // Only output if a button was pushed
; 		 if ( PTH & 0xF0 ) {
	brclr 0x260,#240,L8
	.dbline 38
	.dbline 39
; 		    delay(20);
	ldd #20
	jsr _delay
	.dbline 41
; 			
; 			if ( col == getKeyboardCol() ) { 
	jsr _getKeyboardCol
	std -26,x
	ldd -6,x
	cpd -26,x
	bne L10
	.dbline 41
	.dbline 42
; 					 	putchar(char_arr[row][col]);
	ldd -2,x
	lsld
	lsld
	leay -22,x
	sty -28,x
	addd -28,x
	std -30,x
	ldd -6,x
	addd -30,x
	xgdy
	ldab 0,y
	clra
	jsr _putchar
	.dbline 44
; 						//printf("Row %d, column %d\n", row_mask, col);
; 			}
L10:
	.dbline 47
; 			
; 			// Check if '0' was pressed, if so then terminate
; 			if ( col == 1 && row == 3 ) {
	ldd -6,x
	cpd #1
	bne L12
	ldd -2,x
	cpd #3
	bne L12
	.dbline 47
	.dbline 48
; 			   return 1;
	ldd #1
	bra L3
L12:
	.dbline 50
; 			}
; 		 }
L8:
	.dbline 53
; 
; 		 // Change rows each iteration		 
; 		 row++;
	ldd -2,x
	addd #1
	std -2,x
	.dbline 54
; 		 row_mask = 0x01 << row;
	ldd #1
	ldy -2,x
	cpy #0
	beq X1
X2:
	lsld
	dbne y,X2
X1:
	std -4,x
	.dbline 56
; 
; 		 if ( row >= 4 ) {
	ldd -2,x
	cpd #4
	blt L14
	.dbline 56
	.dbline 57
; 		 	row_mask = 0x01;
	ldd #1
	std -4,x
	.dbline 58
; 			row = 0;
	ldd #0
	std -2,x
	.dbline 59
; 		 }
L14:
	.dbline 60
L6:
	.dbline 32
	lbra L5
X3:
	.dbline 62
;    }
;  
;    return 1;
	ldd #1
	.dbline -2
L3:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l loopi -24 I
	.dbsym l char_arr -22 A[16:4:4]c
	.dbsym l col -6 I
	.dbsym l row_mask -4 I
	.dbsym l row -2 I
	.dbend
	.dbfunc e getKeyboardCol _getKeyboardCol fI
;            col -> -2,x
_getKeyboardCol::
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 66
; }
; 
; int getKeyboardCol()
; {
	.dbline 68
;  	 int col;
;      if ( PTH & 0x10 ) {
	brclr 0x260,#16,L17
	.dbline 68
	.dbline 69
; 		col = 0;
	ldd #0
	std -2,x
	.dbline 70
	bra L18
L17:
	.dbline 70
; 	 } else if ( PTH & 0x20 ) {
	brclr 0x260,#32,L19
	.dbline 70
	.dbline 71
; 	    col = 1;
	ldd #1
	std -2,x
	.dbline 72
	bra L20
L19:
	.dbline 72
; 	 } else if ( PTH & 0x40 ) {
	brclr 0x260,#64,L21
	.dbline 72
	.dbline 73
; 	   	col = 2;
	ldd #2
	std -2,x
	.dbline 74
	bra L22
L21:
	.dbline 74
; 	 } else if ( PTH & 0x80 ) {
	brclr 0x260,#128,L23
	.dbline 74
	.dbline 75
; 	    col = 3;
	ldd #3
	std -2,x
	.dbline 76
; 	 }
L23:
L22:
L20:
L18:
	.dbline 77
; 	 return col;
	ldd -2,x
	.dbline -2
L16:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l col -2 I
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
; }
; 
; void delay(int ms)
; {
	.dbline 82
;  	 const int delayConstant = 1234;
	ldd #1234
	std -4,x
	.dbline 84
	ldd #0
	std -6,x
	bra L29
L26:
	.dbline 84
; 	 int i, j;
; 	  for ( i=0; i<ms; i++ ) {
	.dbline 85
	ldd #0
	std -2,x
	bra L33
L30:
	.dbline 85
	.dbline 85
L31:
	.dbline 85
	ldd -2,x
	addd #1
	std -2,x
L33:
	.dbline 85
	ldd -2,x
	cpd -4,x
	blt L30
	.dbline 86
L27:
	.dbline 84
	ldd -6,x
	addd #1
	std -6,x
L29:
	.dbline 84
	ldd -6,x
	cpd 2,x
	blt L26
	.dbline -2
	.dbline 87
;  	  	  for ( j=0; j < delayConstant; j++ ) {}
; 	 }
; }
L25:
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
