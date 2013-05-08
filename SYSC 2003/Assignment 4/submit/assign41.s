	.module assign41.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART1~1/../lib/keyboard.c
	.dbfunc s keyboard_init _keyboard_init fV
_keyboard_init:
	.dbline -1
	.dbline 19
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
; 	while ( 1 ) {
	.dbline 20
; 		key = keyboard_getchar();
	clr 0xf0
	.dbline 21
; 		putchar(key);
	ldab #15
	stab 0x25a
	.dbline 22
; 		
	bclr 0x262,#0xf0
	.dbline 23
; 		if ( key == '0' ) {
	bset 0x262,#8
	.dbline -2
	.dbline 24
; 			break;
L3:
	.dbline 0 ; func end
	rts
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART1~1/../lib/keyboard.c
L5:
	.blkb 2
	.area idata
	.word -1
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART1~1/../lib/keyboard.c
L6:
	.blkb 2
	.area idata
	.word -1
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART1~1/../lib/keyboard.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART1~1/../lib/keyboard.c
L7:
	.byte 49,50
	.byte 51,'A
	.byte 52,53
	.byte 54,'B
	.byte 55,56
	.byte 57,'C
	.byte 'E,48
	.byte 'F,'D
	.dbfunc e keyboard_getchar _keyboard_getchar fc
	.dbsym s last_col L6 I
	.dbsym s last_row L5 I
;       char_map -> -20,x
;            col -> -4,x
;            row -> -2,x
_keyboard_getchar::
	pshx
	tfr s,x
	leas -26,sp
	.dbline -1
	.dbline 30
; 		}
; 	}
; 	
; 	return 0;
; }
; 
	.dbline 33
; /*
; *
; * The submit program won't let us sumbit the extra files, so here they are... commented out.
	ldd #0
	std -2,x
	.dbline 34
; *
	ldd #0
	std -4,x
	.dbline 36
; */
; 
	leay -20,x
	xgdy
	ldy #L7
	pshx
	tfr d,x
	ldd #8
X0:
	movw 2,y+,2,x+
	dbne d,X0
	pulx
	.dbline 41
; 
; 
; // // /* keyboard.c */
; // // By Korey Conway and Tanzeel Rana
; 
	jsr _keyboard_init
	lbra L9
L8:
	.dbline 43
; // #include <hcs12dp256.h>
; 
	.dbline 44
; // #define	KEYBOARD_ROWS		4
	bset 0x250,#8
	.dbline 45
; // #define	KEYBOARD_COLUMNS	4
	ldd #1
	ldy -2,x
	cpy #0
	beq X1
X2:
	lsld
	dbne y,X2
X1:
	stab 0x258
	.dbline 46
; // #define KEYBOARD_DEBOUNCE_DELAY	0x5000
	bclr 0x250,#0x8
	.dbline 48
; // #define KEYBOARD_REPEAT_DELAY	0xF000
; 
	jsr _keyboard_get_column
	std -4,x
	.dbline 51
; // char keyboard_getchar(void);
; // static void keyboard_init(void);
; // static void keyboard_delay(unsigned int delay);
	ldd -4,x
	cpd #-1
	beq L11
	.dbline 51
	.dbline 52
; // static int  keyboard_get_column(void);
	ldd L5
	cpd -2,x
	bne L13
	ldd L6
	cpd -4,x
	bne L13
	.dbline 52
	.dbline 53
; 
	ldd #0xf000
	jsr _keyboard_delay
	.dbline 54
	bra L14
L13:
	.dbline 54
; // /*
	.dbline 55
; 	// Initialize ports for keyboard
	ldd #20480
	jsr _keyboard_delay
	.dbline 56
; // */
L14:
	.dbline 59
; // static void keyboard_init()
; // {
; 	// SPI1CR1 = 0x00; // Turn off SPI (not explained why yet)
	jsr _keyboard_get_column
	std -22,x
	ldd -4,x
	cpd -22,x
	bne L12
	.dbline 59
	.dbline 61
; 	// DDRP    = 0x0F; // Enable keyboard and disable motors on port P
; 	// DDRH   &= 0x0F; // Enable reading from keyboard (High bits of DDRH)
	movw -2,x,L5
	.dbline 62
; 	// DDRH   |= 0x08; // Enable writing to U7_EN
	movw -4,x,L6
	.dbline 63
; // }
	ldd -2,x
	lsld
	lsld
	leay -20,x
	sty -24,x
	addd -24,x
	std -26,x
	ldd -4,x
	addd -26,x
	xgdy
	ldab 0,y
	clra
	bra L4
X3:
	.dbline 65
L11:
	.dbline 65
; 
; // /*
	ldd -2,x
	cpd L5
	bne L17
	.dbline 65
	.dbline 67
; 	// Get a character from the keyboard
; // */
	ldd #-1
	std L6
	.dbline 68
; // char keyboard_getchar()
L17:
L12:
	.dbline 71
	ldd -2,x
	addd #1
	ldy #4
	exg x,y
	idivs
	exg x,y
	std -2,x
	.dbline 72
L9:
	.dbline 43
	lbra L8
X4:
	.dbline 74
; // {
; 	// static int last_row = -1;
; 	// static int last_col = -1;
; 	// int row = 0;
; 	// int col = 0;
; 	// char char_map[KEYBOARD_ROWS][KEYBOARD_COLUMNS] =
	ldd #0
	.dbline -2
L4:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l char_map -20 A[16:4:4]c
	.dbsym l col -4 I
	.dbsym l row -2 I
	.dbend
	.dbfunc s keyboard_get_column _keyboard_get_column fI
;          input -> -4,x
;            col -> -2,x
_keyboard_get_column:
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 82
; 		// {{'1', '2', '3', 'A'},
; 		// {'4', '5', '6', 'B'},
; 		// {'7', '8', '9', 'C'},
; 		// {'E', '0', 'F', 'D'}};
; 	
; 	// keyboard_init();
; 
; 	// while ( 1 ) {
	.dbline 83
; 		// PTM |= 0x08;		// Set U7_EN high (PM3)
	ldd #0
	std -2,x
	.dbline 84
; 		// PTP  = 0x01 << row;	// Enable the correct row
	; vol
	ldab 0x260
	clra
	asra
	rorb
	asra
	rorb
	asra
	rorb
	asra
	rorb
	std -4,x
	.dbline 87
; 		// PTM &= ~0x08;		// Set U7_EN low (PM3)
; 		
; 		// col = keyboard_get_column(); // Get the button that is pushed in that row (if any)
	ldd -4,x
	bne L20
	.dbline 87
	ldd #-1
	bra L19
L20:
	.dbline 91
	ldd #0
	std -2,x
L22:
	.dbline 91
; 
; 		// // Only react if a button was pushed
; 		// if ( col != -1 ) {
; 			// if ( last_row == row && last_col == col ) {
	.dbline 92
; 				// keyboard_delay(KEYBOARD_REPEAT_DELAY); // add delay for debounce
	ldd -4,x
	ldy -2,x
	cpy #0
	beq X5
X6:
	asra
	rorb
	dbne y,X6
X5:
	anda #0
	andb #1
	cpd #0
	beq L26
	.dbline 92
	.dbline 93
; 			// } else {
	ldd -2,x
	bra L19
L26:
	.dbline 95
L23:
	.dbline 91
	ldd -2,x
	addd #1
	std -2,x
	.dbline 91
	ldd -2,x
	cpd #4
	blt L22
	.dbline 97
; 				// keyboard_delay(KEYBOARD_DEBOUNCE_DELAY); // add simple delay for repeat
; 			// }
; 
; 			// // Check if the same button is still being pushed
	ldd #-1
	.dbline -2
L19:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l input -4 I
	.dbsym l col -2 I
	.dbend
	.dbfunc s keyboard_delay _keyboard_delay fV
;          delay -> 2,x
_keyboard_delay:
	pshd
	pshx
	tfr s,x
	.dbline -1
	.dbline 104
; 			// if ( col == keyboard_get_column() ) {
; 				// // save the row/col of the character for repeat delays then return the char
; 				// last_row = row;
; 				// last_col = col;
; 				// return char_map[row][col];
; 			// }
; 		// } else if ( row == last_row )  {
	.dbline 105
	bra L32
L29:
	.dbline 105
	.dbline 105
L30:
	.dbline 105
	ldd 2,x
	subd #1
	std 2,x
L32:
	.dbline 105
; 			// // clear the memory of the last column because the button was released so we don't want a repeat delay anymore
	ldd 2,x
	bne L29
	.dbline -2
	.dbline 106
; 			// last_col = -1; 
L28:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l delay 2 i
	.dbend
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART1~1\assign41.c
	.dbfunc e main _main fI
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
	bra L35
L34:
	.dbline 19
	.dbline 20
	jsr _keyboard_getchar
	stab -1,x
	.dbline 21
	ldab -1,x
	clra
	jsr _putchar
	.dbline 23
	ldab -1,x
	cmpb #48
	bne L37
	.dbline 23
	.dbline 24
	bra L36
L37:
	.dbline 26
L35:
	.dbline 19
	bra L34
L36:
	.dbline 28
	ldd #0
	.dbline -2
L33:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l key -1 c
	.dbend
