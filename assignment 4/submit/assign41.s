	.module assign41.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART1~1/../lib/keyboard.c
	.dbfunc s keyboard_init _keyboard_init fV
_keyboard_init:
	.dbline -1
	.dbline 17
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
; 		key = keyboard_getchar();
; 		putchar(key);
; 		
; 		if ( key == '0' ) {
; 			break;
	.dbline 18
; 		}
	clr 0xf0
	.dbline 19
; 	}
	ldab #15
	stab 0x25a
	.dbline 20
; 	
	bclr 0x262,#0xf0
	.dbline -2
	.dbline 21
; 	return 1;
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
	.dbline 27
; }
; }
; }
; }
; }
; }
	.dbline 30
; }
; }
; }
	ldd #0
	std -2,x
	.dbline 31
; }
	ldd #0
	std -4,x
	.dbline 33
; }
; }
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
	.dbline 38
; }
; }
; }
; }
; }
	jsr _keyboard_init
	lbra L9
L8:
	.dbline 40
; }
; }
	.dbline 41
; }
	ldd #1
	ldy -2,x
	cpy #0
	beq X1
X2:
	lsld
	dbne y,X2
X1:
	stab 0x258
	.dbline 42
; }
	jsr _keyboard_get_column
	std -4,x
	.dbline 45
; }
; }
; }
	ldd -4,x
	cpd #-1
	beq L11
	.dbline 45
	.dbline 46
; }
	ldd L5
	cpd -2,x
	bne L13
	ldd L6
	cpd -4,x
	bne L13
	.dbline 46
	.dbline 47
; }
	ldd #0xf000
	jsr _keyboard_delay
	.dbline 48
	bra L14
L13:
	.dbline 48
; }
	.dbline 49
; }
	ldd #20480
	jsr _keyboard_delay
	.dbline 50
; }
L14:
	.dbline 53
; }
; }
; }
	jsr _keyboard_get_column
	std -22,x
	ldd -4,x
	cpd -22,x
	bne L12
	.dbline 53
	.dbline 55
; }
; }
	movw -2,x,L5
	.dbline 56
; }
	movw -4,x,L6
	.dbline 57
; }
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
	.dbline 59
L11:
	.dbline 59
; }
; }
	ldd -2,x
	cpd L5
	bne L17
	.dbline 59
	.dbline 61
; }
; }
	ldd #-1
	std L6
	.dbline 62
; }
L17:
L12:
	.dbline 65
	ldd -2,x
	addd #1
	ldy #4
	exg x,y
	idivs
	exg x,y
	std -2,x
	.dbline 66
L9:
	.dbline 40
	lbra L8
X4:
	.dbline 68
; }
; }
; }
; }
; }
; }
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
	.dbline 76
; ä
; ä
; ä
; ä
; ä
; ä
; ä
; ä
	.dbline 77
; ä
	ldd #0
	std -2,x
	.dbline 78
; ä
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
	.dbline 81
; ä
; ä
; ä
	ldd -4,x
	bne L20
	.dbline 81
	ldd #-1
	bra L19
L20:
	.dbline 85
	ldd #0
	std -2,x
L22:
	.dbline 85
; ä
; ä
; ä
; ä
	.dbline 86
; ä
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
	.dbline 86
	.dbline 87
; ä
	ldd -2,x
	bra L19
L26:
	.dbline 89
L23:
	.dbline 85
	ldd -2,x
	addd #1
	std -2,x
	.dbline 85
	ldd -2,x
	cpd #4
	blt L22
	.dbline 91
; ä
; ä
; ä
; ä
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
	.dbline 98
; ä
; ä
; ä
; ä
; ä
; ä
; ä
	.dbline 99
	bra L32
L29:
	.dbline 99
	.dbline 99
L30:
	.dbline 99
	ldd 2,x
	subd #1
	std 2,x
L32:
	.dbline 99
; ä
	ldd 2,x
	bne L29
	.dbline -2
	.dbline 100
; ä
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
	.dbline 6
	.dbline 10
	ldd #26
	jsr _setbaud
	bra L35
L34:
	.dbline 12
	.dbline 13
	jsr _keyboard_getchar
	stab -1,x
	.dbline 14
	ldab -1,x
	clra
	jsr _putchar
	.dbline 16
	ldab -1,x
	cmpb #48
	bne L37
	.dbline 16
	.dbline 17
	bra L36
L37:
	.dbline 19
L35:
	.dbline 12
	bra L34
L36:
	.dbline 21
	ldd #1
	.dbline -2
L33:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l key -1 c
	.dbend
