	.module assign41.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART1~1\assign41.c
	.dbfunc e main _main fI
;            key -> -1,x
_main::
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 15
; #include <hcs12dp256.h>
; #include <stdio.h>
; 
; #define	KEYBOARD_ROWS		4
; #define	KEYBOARD_COLUMNS	4
; #define KEYBOARD_DEBOUNCE_DELAY	0x5000
; #define KEYBOARD_REPEAT_DELAY	0xF000
; 
; void keyboard_init(void);
; char keyboard_getchar(void);
; void keyboard_delay(unsigned int delay);
; int  keyboard_get_column(void);
; 
; int main()
; {
	.dbline 19
; 	char key;
; 	
; 	// Setup keyboard and terminal
; 	setbaud(BAUD19K);
	ldd #26
	jsr _setbaud
	.dbline 20
; 	keyboard_init();
	jsr _keyboard_init
	bra L5
L4:
	.dbline 22
; 	
; 	while ( 1 ) {
	.dbline 23
; 		key = keyboard_getchar();
	jsr _keyboard_getchar
	stab -1,x
	.dbline 24
; 		putchar(key);
	ldab -1,x
	clra
	jsr _putchar
	.dbline 26
; 		
; 		if ( key == '0' ) {
	ldab -1,x
	cmpb #48
	bne L7
	.dbline 26
	.dbline 27
; 			break;
	bra L6
L7:
	.dbline 29
L5:
	.dbline 22
	bra L4
L6:
	.dbline 31
; 		}
; 	}
; 	
; 	return 1;
	ldd #1
	.dbline -2
L3:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l key -1 c
	.dbend
	.dbfunc e keyboard_init _keyboard_init fV
_keyboard_init::
	.dbline -1
	.dbline 38
; }
; 
; /*
; 	Initialize ports for keyboard
; */
; void keyboard_init()
; {
	.dbline 39
; 	SPI1CR1 = 0x00; // Turn off SPI (not explained why yet)
	clr 0xf0
	.dbline 40
; 	DDRP = 0x0F; // Enable keyboard and disable motors on port P
	ldab #15
	stab 0x25a
	.dbline 41
; 	DDRH = DDRH & 0x0F; // Enable reading from keyboard (High bits of DDRH)
	bclr 0x262,#0xf0
	.dbline -2
	.dbline 42
; }
L9:
	.dbline 0 ; func end
	rts
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART1~1\assign41.c
L11:
	.blkb 2
	.area idata
	.word -1
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART1~1\assign41.c
L12:
	.blkb 2
	.area idata
	.word -1
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART1~1\assign41.c
L13:
	.blkb 2
	.area idata
	.byte 49,50
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART1~1\assign41.c
	.blkb 2
	.area idata
	.byte 51,'A
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART1~1\assign41.c
	.blkb 2
	.area idata
	.byte 52,53
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART1~1\assign41.c
	.blkb 2
	.area idata
	.byte 54,'B
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART1~1\assign41.c
	.blkb 2
	.area idata
	.byte 55,56
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART1~1\assign41.c
	.blkb 2
	.area idata
	.byte 57,'C
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART1~1\assign41.c
	.blkb 2
	.area idata
	.byte 'E,48
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART1~1\assign41.c
	.blkb 2
	.area idata
	.byte 'F,'D
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART1~1\assign41.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART1~1\assign41.c
	.dbfunc e keyboard_getchar _keyboard_getchar fc
	.dbsym s char_map L13 A[16:4:4]c
	.dbsym s last_col L12 I
	.dbsym s last_row L11 I
;            col -> -4,x
;            row -> -2,x
_keyboard_getchar::
	pshx
	tfr s,x
	leas -8,sp
	.dbline -1
	.dbline 48
; 
; /*
; 	Get a character from the keyboard
; */
; char keyboard_getchar()
; {
	.dbline 55
; 	static int last_row = -1, last_col = -1;
; 	static char char_map[KEYBOARD_ROWS][KEYBOARD_COLUMNS] =
; 		{{'1', '2', '3', 'A'},
; 		{'4', '5', '6', 'B'},
; 		{'7', '8', '9', 'C'},
; 		{'E', '0', 'F', 'D'}};
; 	int row = 0;
	ldd #0
	std -2,x
	.dbline 56
; 	int col = 0;
	ldd #0
	std -4,x
	lbra L15
L14:
	.dbline 58
; 
; 	while ( 1 ) {
	.dbline 59
; 		PTP = 0x01 << row; // Enable the correct row
	ldd #1
	ldy -2,x
	cpy #0
	beq X0
X1:
	lsld
	dbne y,X1
X0:
	stab 0x258
	.dbline 60
; 		col = keyboard_get_column(); // Get the button that is pushed in that row (if any)
	jsr _keyboard_get_column
	std -4,x
	.dbline 63
; 
; 		// Only react if a button was pushed
; 		if ( col != -1 ) {
	ldd -4,x
	cpd #-1
	beq L17
	.dbline 63
	.dbline 64
; 			if ( last_row == row && last_col == col ) {
	ldd L11
	cpd -2,x
	bne L19
	ldd L12
	cpd -4,x
	bne L19
	.dbline 64
	.dbline 65
; 				keyboard_delay(KEYBOARD_REPEAT_DELAY); // add delay for debounce
	ldd #0xf000
	jsr _keyboard_delay
	.dbline 66
	bra L20
L19:
	.dbline 66
; 			} else {
	.dbline 67
; 				keyboard_delay(KEYBOARD_DEBOUNCE_DELAY); // add simple delay for repeat
	ldd #20480
	jsr _keyboard_delay
	.dbline 68
; 			}
L20:
	.dbline 71
; 
; 			// Check if the same button is still being pushed
; 			if ( col == keyboard_get_column() ) {
	jsr _keyboard_get_column
	std -6,x
	ldd -4,x
	cpd -6,x
	bne L18
	.dbline 71
	.dbline 73
; 				// save the row/col of the character for repeat delays then return the char
; 				last_row = row;
	movw -2,x,L11
	.dbline 74
; 				last_col = col;
	movw -4,x,L12
	.dbline 75
; 				return char_map[row][col];
	ldd -2,x
	lsld
	lsld
	addd #L13
	std -8,x
	ldd -4,x
	addd -8,x
	xgdy
	ldab 0,y
	clra
	bra L10
X2:
	.dbline 77
L17:
	.dbline 77
; 			}
; 		} else if ( row == last_row )  {
	ldd -2,x
	cpd L11
	bne L23
	.dbline 77
	.dbline 79
; 			// clear the memory of the last column because the button was released so we don't want a repeat delay anymore
; 			last_col = -1; 
	ldd #-1
	std L12
	.dbline 80
; 		}
L23:
L18:
	.dbline 83
	ldd -2,x
	addd #1
	ldy #4
	exg x,y
	idivs
	exg x,y
	std -2,x
	.dbline 84
L15:
	.dbline 58
	lbra L14
X3:
	.dbline -2
	.dbline 85
; 
; 		// change rows each iteration		 
; 		row = (row+1) % KEYBOARD_ROWS;
; 	}
; }
L10:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l col -4 I
	.dbsym l row -2 I
	.dbend
	.dbfunc e keyboard_get_column _keyboard_get_column fI
;          input -> -4,x
;            col -> -2,x
_keyboard_get_column::
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 92
; 
; /*
; 	Returns the column number of the button currently being pushed.
; 	If no button is pushed then it returns -1
; */
; int keyboard_get_column()
; {
	.dbline 93
; 	int col = 0;
	ldd #0
	std -2,x
	.dbline 94
; 	int input = PTH >> 4;
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
	.dbline 97
; 	
; 	// Check for no input first since this is the most common result
; 	if ( !input ) return -1;
	ldd -4,x
	bne L26
	.dbline 97
	ldd #-1
	bra L25
L26:
	.dbline 101
	ldd #0
	std -2,x
L28:
	.dbline 101
; 	
; 	// Check each bit, if one is set return the associated column
; 		// Note: this gives priority to lower bits if 2 buttons are pushed at the same time
; 	for (col = 0; col < KEYBOARD_COLUMNS; col++ )  {
	.dbline 102
; 		if ( (input >> col) & 0x01 ) {
	ldd -4,x
	ldy -2,x
	cpy #0
	beq X4
X5:
	asra
	rorb
	dbne y,X5
X4:
	anda #0
	andb #1
	cpd #0
	beq L32
	.dbline 102
	.dbline 103
; 			return col;
	ldd -2,x
	bra L25
L32:
	.dbline 105
L29:
	.dbline 101
	ldd -2,x
	addd #1
	std -2,x
	.dbline 101
	ldd -2,x
	cpd #4
	blt L28
	.dbline 107
; 		}
; 	}
; 	
; 	return -1;
	ldd #-1
	.dbline -2
L25:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l input -4 I
	.dbsym l col -2 I
	.dbend
	.dbfunc e keyboard_delay _keyboard_delay fV
;          delay -> 2,x
_keyboard_delay::
	pshd
	pshx
	tfr s,x
	.dbline -1
	.dbline 114
; }
; 
; /*
; 	Delay for a time
; */
; void keyboard_delay(unsigned int delay)
; {
	.dbline 115
	bra L38
L35:
	.dbline 115
	.dbline 115
L36:
	.dbline 115
	ldd 2,x
	subd #1
	std 2,x
L38:
	.dbline 115
; 	for ( ; delay > 0 ; delay-- ) {}
	ldd 2,x
	bne L35
	.dbline -2
	.dbline 116
; }
L34:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l delay 2 i
	.dbend
