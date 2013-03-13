	.module assign41.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART1~1\assign41.c
	.dbfunc e main _main fI
_main::
	.dbline -1
	.dbline 16
; //#include <hc12.h>
; #include <hcs12dp256.h>
; #include <stdio.h>
; 
; void delay(int ms);
; void keyboard_init(void);
; int  keyboard_get_column(void);
; void keyboard_scan(void);
; void keyboard_pushed(int row, int col);
; 
; //char collision_detection (int speed, unsigned int * proximity);
; //void change_speed(int * speed, int value);
; 
; 
; int main()
; {
	.dbline 17
; 	setbaud(BAUD19K);
	ldd #26
	jsr _setbaud
	.dbline 18
; 	keyboard_init();
	jsr _keyboard_init
	.dbline 19
; 	keyboard_scan();
	jsr _keyboard_scan
	.dbline 20
; 	return 1;
	ldd #1
	.dbline -2
L3:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e keyboard_scan _keyboard_scan fV
;            col -> -4,x
;            row -> -2,x
_keyboard_scan::
	pshx
	tfr s,x
	leas -8,sp
	.dbline -1
	.dbline 24
; }
; 
; void keyboard_scan()
; {
	.dbline 25
; 	int row = 0;
	ldd #0
	std -2,x
	.dbline 26
; 	int col = 0;
	ldd #0
	std -4,x
	bra L6
L5:
	.dbline 28
; 
; 	while ( 1 ) {
	.dbline 29
; 		PTP = 0x01 << row;
	ldd #1
	ldy -2,x
	cpy #0
	beq X0
X1:
	lsld
	dbne y,X1
X0:
	stab 0x258
	.dbline 31
; 
; 		col = keyboard_get_column();
	jsr _keyboard_get_column
	std -4,x
	.dbline 34
; 
; 		// Only react if a button was pushed
; 		if ( PTH & 0xF0 ) {
	brclr 0x260,#240,L8
	.dbline 34
	.dbline 35
; 			delay(20); // delay for debounce
	ldd #20
	jsr _delay
	.dbline 37
; 
; 			if ( col == keyboard_get_column() ) { 
	jsr _keyboard_get_column
	std -6,x
	ldd -4,x
	cpd -6,x
	bne L10
	.dbline 37
	.dbline 38
; 				keyboard_pushed(row, col);
	movw -4,x,0,sp
	ldd -2,x
	jsr _keyboard_pushed
	.dbline 40
; 				//printf("Row %d, column %d\n", row_mask, col);
; 			}
L10:
	.dbline 41
; 		}
L8:
	.dbline 44
	ldd -2,x
	addd #1
	ldy #4
	exg x,y
	idivs
	exg x,y
	std -2,x
	.dbline 45
L6:
	.dbline 28
	bra L5
X2:
	.dbline -2
	.dbline 46
; 
; 		// Change rows each iteration		 
; 		row = (row+1) % 4;
; 	}
; }
L4:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l col -4 I
	.dbsym l row -2 I
	.dbend
L13:
	.byte 49,50
	.byte 51,'A
	.byte 52,53
	.byte 54,'B
	.byte 55,56
	.byte 57,'C
	.byte 'E,48
	.byte 'F,'D
	.dbfunc e keyboard_pushed _keyboard_pushed fV
;       char_arr -> -16,x
;            col -> 6,x
;            row -> 2,x
_keyboard_pushed::
	pshd
	pshx
	tfr s,x
	leas -20,sp
	.dbline -1
	.dbline 49
	.dbline 51
	leay -16,x
	xgdy
	ldy #L13
	pshx
	tfr d,x
	ldd #8
X3:
	movw 2,y+,2,x+
	dbne d,X3
	pulx
	.dbline 56
	ldd 2,x
	lsld
	lsld
	leay -16,x
	sty -18,x
	addd -18,x
	std -20,x
	ldd 6,x
	addd -20,x
	xgdy
	ldab 0,y
	clra
	jsr _putchar
	.dbline 57
	ldd 6,x
	cpd #1
	bne L14
	ldd 2,x
	cpd #3
	bne L14
	.dbline 57
	.dbline 58
		SWI

	.dbline 59
L14:
	.dbline -2
	.dbline 60
; 
; void keyboard_pushed(int row, int col)
; {
; 	char char_arr[4][4] =
; 		{{'1', '2', '3', 'A'},
; 		{'4', '5', '6', 'B'},
; 		{'7', '8', '9', 'C'},
; 		{'E', '0', 'F', 'D'}};
; 
; 	putchar(char_arr[row][col]);
; 	if ( col == 1 && row == 3 ) {
; 		asm("SWI");
; 	}
; }
L12:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l char_arr -16 A[16:4:4]c
	.dbsym l col 6 I
	.dbsym l row 2 I
	.dbend
	.dbfunc e keyboard_init _keyboard_init fV
_keyboard_init::
	.dbline -1
	.dbline 63
; 
; void keyboard_init()
; {
	.dbline 64
; 	SPI1CR1 = 0x00; // Turn off SPI (not explained why yet)
	clr 0xf0
	.dbline 65
; 	DDRP = 0x0F; // Enable keyboard and disable motors on port P
	ldab #15
	stab 0x25a
	.dbline 66
; 	DDRH = DDRH & 0x0F; // Enable reading from keyboard (High bits of DDRH)
	bclr 0x262,#0xf0
	.dbline -2
	.dbline 67
; }
L16:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e keyboard_get_column _keyboard_get_column fI
;            col -> -2,x
_keyboard_get_column::
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 70
; 
; int keyboard_get_column()
; {
	.dbline 72
; 	int col;
; 	if ( PTH & 0x10 ) {
	brclr 0x260,#16,L18
	.dbline 72
	.dbline 73
; 		col = 0;
	ldd #0
	std -2,x
	.dbline 74
	bra L19
L18:
	.dbline 74
; 	} else if ( PTH & 0x20 ) {
	brclr 0x260,#32,L20
	.dbline 74
	.dbline 75
; 		col = 1;
	ldd #1
	std -2,x
	.dbline 76
	bra L21
L20:
	.dbline 76
; 	} else if ( PTH & 0x40 ) {
	brclr 0x260,#64,L22
	.dbline 76
	.dbline 77
; 		col = 2;
	ldd #2
	std -2,x
	.dbline 78
	bra L23
L22:
	.dbline 78
; 	} else if ( PTH & 0x80 ) {
	brclr 0x260,#128,L24
	.dbline 78
	.dbline 79
; 		col = 3;
	ldd #3
	std -2,x
	.dbline 80
; 	}
L24:
L23:
L21:
L19:
	.dbline 81
; 	return col;
	ldd -2,x
	.dbline -2
L17:
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
	.dbline 85
; }
; 
; void delay(int ms)
; {
	.dbline 86
; 	const int delayConstant = 1234;
	ldd #1234
	std -4,x
	.dbline 88
	ldd #0
	std -6,x
	bra L30
L27:
	.dbline 88
; 	int i, j;
; 	for ( i=0; i<ms; i++ ) {
	.dbline 89
	ldd #0
	std -2,x
	bra L34
L31:
	.dbline 89
	.dbline 89
L32:
	.dbline 89
	ldd -2,x
	addd #1
	std -2,x
L34:
	.dbline 89
	ldd -2,x
	cpd -4,x
	blt L31
	.dbline 90
L28:
	.dbline 88
	ldd -6,x
	addd #1
	std -6,x
L30:
	.dbline 88
	ldd -6,x
	cpd 2,x
	blt L27
	.dbline -2
	.dbline 91
; 		for ( j=0; j < delayConstant; j++ ) {}
; 	}
; }
L26:
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
