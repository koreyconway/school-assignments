	.module assign51.c
	.area data
_key:
	.blkb 1
	.area idata
	.byte 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGM~1\PART1~1/../lib/keyboard.c
	.dbsym s key _key c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGM~1\PART1~1/../lib/keyboard.c
	.dbfunc e keyboard_init _keyboard_init fV
_keyboard_init::
	.dbline -1
	.dbline 21
; // By Korey Conway and Tanzeel Rana
; 
; /*
; * READ THIS NOTE!!!! INCLUDED FILES ARE IN THIS FILE, COMMENTED OUT BELOW
; * The submit program won't let us sumbit the extra files, so here they are... commented out.
; */
; 
; #include <hcs12dp256.h>
; #include <stdio.h>
; #include "../lib/keyboard.c"
; 
; int main()
; {
; 	char key;
; 	
; 	// Setup terminal
; 	setbaud(BAUD19K);
; 	
; 	keyboard_init();
; 	INTR_ON();
; 	
	.dbline 22
; 	while ( 1 ) {
	clr 0xf0
	.dbline 24
; 		if ( key = keyboard_getchar() ) {
; 			putchar(key);
	bset 0x252,#8
	.dbline 26
; 			
; 			if ( key == '0' ) {
	bset 0x25a,#15
	.dbline 27
; 				break;
	bset 0x250,#8
	.dbline 28
; 			}
	bset 0x258,#15
	.dbline 29
; 			
	bclr 0x250,#0x8
	.dbline 31
; 			keyboard_clearchar();
; 		}
	bclr 0x262,#0xf0
	.dbline 32
; 	}
	bset 0x265,#240
	.dbline 33
; 	
	ldab #255
	stab 0x267
	.dbline 34
; 	return 0;
	clr 0x264
	.dbline 35
; }
	bset 0x266,#240
	.dbline -2
	.dbline 36
; 
L3:
	.dbline 0 ; func end
	rts
	.dbend
L5:
	.byte 49,50
	.byte 51,'A
	.byte 52,53
	.byte 54,'B
	.byte 55,56
	.byte 57,'C
	.byte 'E,48
	.byte 'F,'D
	.dbfunc e keyboard_isr _keyboard_isr fV
;       char_map -> -24,x
;            row -> -8,x
;       col_mask -> -6,x
;            col -> -4,x
;              i -> -2,x
_keyboard_isr::
	pshx
	tfr s,x
	leas -28,sp
	.dbline -1
	.dbline 43
; /*
; *
; * The submit program won't let us sumbit the extra files, so here they are... commented out.
; *
; */
; 
; 
	.dbline 45
; 
; // // /* keyboard.c */
	ldd #0
	std -8,x
	.dbline 46
; // // By Korey Conway and Tanzeel Rana
	ldd #0
	std -4,x
	.dbline 47
; 
	; vol
	ldab 0x267
	clra
	asra
	rorb
	asra
	rorb
	asra
	rorb
	asra
	rorb
	std -6,x
	.dbline 49
; // #include <hcs12dp256.h>
; 
	leay -24,x
	xgdy
	ldy #L5
	pshx
	tfr d,x
	ldd #8
X0:
	movw 2,y+,2,x+
	dbne d,X0
	pulx
	.dbline 54
; // #define	KEYBOARD_ROWS		4
; // #define	KEYBOARD_COLUMNS	4
; // #define KEYBOARD_DEBOUNCE_DELAY	0x5000
; // #define KEYBOARD_REPEAT_DELAY	0xF000
; 
		sei

	.dbline 57
	ldd #0
	std -8,x
L6:
	.dbline 57
; // char keyboard_getchar(void);
; // static void keyboard_init(void);
; // static void keyboard_delay(unsigned int delay);
	.dbline 58
; // static int  keyboard_get_column(void);
	bset 0x250,#8
	.dbline 59
; 
	ldd #1
	ldy -8,x
	cpy #0
	beq X1
X2:
	lsld
	dbne y,X2
X1:
	anda #0
	andb #15
	std -26,x
	; vol
	ldab 0x258
	clra
	anda #255
	andb #240
	ora -26,x
	orb -25,x
	stab 0x258
	.dbline 60
	ldd #0
	std -2,x
L10:
	.dbline 60
L11:
	.dbline 60
; // /*
	ldd -2,x
	addd #1
	std -2,x
	.dbline 60
	ldd -2,x
	cpd #5000
	blt L10
	.dbline 61
; 	// Initialize ports for keyboard
	bclr 0x250,#0x8
	.dbline 63
; // */
; // static void keyboard_init()
	brclr 0x260,#240,L14
	.dbline 63
	.dbline 65
	ldd #0
	std -4,x
L16:
	.dbline 65
; // {
; 	// SPI1CR1 = 0x00; // Turn off SPI (not explained why yet)
	.dbline 66
; 	// DDRP    = 0x0F; // Enable keyboard and disable motors on port P
	ldd -6,x
	ldy -4,x
	cpy #0
	beq X3
X4:
	asra
	rorb
	dbne y,X4
X3:
	anda #0
	andb #1
	cpd #0
	beq L20
	.dbline 66
	.dbline 67
; 	// DDRH   &= 0x0F; // Enable reading from keyboard (High bits of DDRH)
	bra L8
L20:
	.dbline 69
L17:
	.dbline 65
	ldd -4,x
	addd #1
	std -4,x
	.dbline 65
	ldd -4,x
	cpd #4
	blt L16
	.dbline 70
; 	// DDRH   |= 0x08; // Enable writing to U7_EN
; // }
; 
	bra L8
L14:
	.dbline 72
L7:
	.dbline 57
	ldd -8,x
	addd #1
	std -8,x
	.dbline 57
	ldd -8,x
	cpd #4
	lblt L6
L8:
	.dbline 74
; // /*
; 	// Get a character from the keyboard
; // */
; // char keyboard_getchar()
	ldd -4,x
	cpd #4
	bge L22
	ldd -8,x
	cpd #4
	bge L22
	.dbline 74
	.dbline 75
; // {
	ldd -8,x
	lsld
	lsld
	leay -24,x
	sty -26,x
	addd -26,x
	std -28,x
	ldd -4,x
	addd -28,x
	xgdy
	ldab 0,y
	stab _key
	.dbline 76
	bra L23
L22:
	.dbline 76
; 	// static int last_row = -1;
	.dbline 77
; 	// static int last_col = -1;
	clr _key
	.dbline 78
; 	// int row = 0;
L23:
	.dbline 80
; 	// int col = 0;
; 	// char char_map[KEYBOARD_ROWS][KEYBOARD_COLUMNS] =
	bset 0x250,#8
	.dbline 81
; 		// {{'1', '2', '3', 'A'},
	bset 0x258,#15
	.dbline 82
; 		// {'4', '5', '6', 'B'},
	bclr 0x250,#0x8
	.dbline 83
; 		// {'7', '8', '9', 'C'},
	ldab #255
	stab 0x267
	.dbline 84
; 		// {'E', '0', 'F', 'D'}};
		cli

	.dbline -2
	.dbline 85
; 	
L4:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rti
	.dbsym l char_map -24 A[16:4:4]c
	.dbsym l row -8 I
	.dbsym l col_mask -6 I
	.dbsym l col -4 I
	.dbsym l i -2 I
	.dbend
	.dbfunc e keyboard_getchar _keyboard_getchar fc
_keyboard_getchar::
	.dbline -1
	.dbline 91
; 	// keyboard_init();
; 
; 	// while ( 1 ) {
; 		// PTM |= 0x08;		// Set U7_EN high (PM3)
; 		// PTP  = 0x01 << row;	// Enable the correct row
; 		// PTM &= ~0x08;		// Set U7_EN low (PM3)
	.dbline 92
; 		
	ldab _key
	clra
	.dbline -2
L24:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e keyboard_clearchar _keyboard_clearchar fV
_keyboard_clearchar::
	.dbline -1
	.dbline 99
; 		// col = keyboard_get_column(); // Get the button that is pushed in that row (if any)
; 
; 		// // Only react if a button was pushed
; 		// if ( col != -1 ) {
; 			// if ( last_row == row && last_col == col ) {
; 				// keyboard_delay(KEYBOARD_REPEAT_DELAY); // add delay for debounce
; 			// } else {
	.dbline 100
; 				// keyboard_delay(KEYBOARD_DEBOUNCE_DELAY); // add simple delay for repeat
	clr _key
	.dbline -2
	.dbline 101
; 			// }
L25:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfile M:\SYSC20~2\Assignments\ASSIGM~1\PART1~1\assign51.c
	.dbfunc e main _main fI
;          ?temp -> -2,x
;            key -> -1,x
_main::
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 13
	.dbline 17
	ldd #26
	jsr _setbaud
	.dbline 19
	jsr _keyboard_init
	.dbline 20
		cli

	bra L28
L27:
	.dbline 22
	.dbline 23
	jsr _keyboard_getchar
	stab -2,x
	movb -2,x,-1,x
	tst -2,x
	beq L30
	.dbline 23
	.dbline 24
	ldab -1,x
	clra
	jsr _putchar
	.dbline 26
	ldab -1,x
	cmpb #48
	bne L32
	.dbline 26
	.dbline 27
	bra L29
L32:
	.dbline 30
	jsr _keyboard_clearchar
	.dbline 31
L30:
	.dbline 32
L28:
	.dbline 22
	bra L27
L29:
	.dbline 34
	ldd #0
	.dbline -2
L26:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l key -1 c
	.dbend
