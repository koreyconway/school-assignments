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
	.dbline 20
; // By Korey Conway and Tanzeel Rana
; 
; #include <hcs12dp256.h>
; #include <stdio.h>
; #include "../lib/keyboard.c"
; #include "../lib/lcd.c"
; 
; int speed = 45;
; int temp  = 31;
; 
; int main()
; {
; 	char key;
; 	
; 	// Setup terminal
; 	setbaud(BAUD19K);
; 	
; 	keyboard_init();
; 	lcd_init();
; 	INTR_ON();
	.dbline 21
; 	
	clr 0xf0
	.dbline 23
; 	lcd_display_speed(speed);
; 	lcd_display_temperature(temp); // Need to redisplay bottom line for some reason
	bset 0x252,#8
	.dbline 25
; 	
; 	while ( 1 ) {
	bset 0x25a,#15
	.dbline 26
; 		if ( key = keyboard_getchar() ) {
	bset 0x250,#8
	.dbline 27
; 			if ( key == '0' ) {
	bset 0x258,#15
	.dbline 28
; 				break;
	bclr 0x250,#0x8
	.dbline 30
; 			} else if ( key == 'E' ) {
; 				++speed;
	bclr 0x262,#0xf0
	.dbline 31
; 				printf("Increasing speed to %d\n", speed);
	bset 0x265,#240
	.dbline 32
; 				lcd_display_speed(speed);
	ldab #255
	stab 0x267
	.dbline 33
; 				lcd_display_temperature(temp); // Need to redisplay bottom line for some reason
	clr 0x264
	.dbline 34
; 			} else if ( key == 'D' ) {
	ldab #240
	stab 0x266
	.dbline -2
	.dbline 35
; 				--speed;
L3:
	.dbline 0 ; func end
	rts
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGM~1\PART1~1/../lib/keyboard.c
L5:
	.blkb 2
	.area idata
	.byte 49,50
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGM~1\PART1~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 51,'A
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGM~1\PART1~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 52,53
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGM~1\PART1~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 54,'B
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGM~1\PART1~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 55,56
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGM~1\PART1~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 57,'C
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGM~1\PART1~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 'E,48
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGM~1\PART1~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 'F,'D
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGM~1\PART1~1/../lib/keyboard.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGM~1\PART1~1/../lib/keyboard.c
	.dbfunc e keyboard_isr _keyboard_isr fV
	.dbsym s char_map L5 A[16:4:4]c
;            row -> -6,x
;       col_mask -> -4,x
;            col -> -2,x
_keyboard_isr::
	pshx
	tfr s,x
	leas -8,sp
	.dbline -1
	.dbline 42
; 				printf("Decreasing speed to %d\n", speed);
; 				lcd_display_speed(speed);
; 				lcd_display_temperature(temp); // Need to redisplay bottom line for some reason
; 			} else {
; 				printf("Pushed: %c\n", key);
; 			}
; 		}
	.dbline 43
; 	}
	ldd #0
	std -6,x
	.dbline 44
; 	
	ldd #0
	std -2,x
	.dbline 52
; 	return 0;
; }
; }
; }
; }
; }
; }
; }
	clr 0x266
	.dbline 54
; }
; }
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
	std -4,x
	.dbline 57
	ldd #0
	std -6,x
L6:
	.dbline 57
; }
; }
; }
	.dbline 58
; }
	bset 0x250,#8
	.dbline 59
; }
	ldd #1
	ldy -6,x
	cpy #0
	beq X0
X1:
	lsld
	dbne y,X1
X0:
	anda #0
	andb #15
	std -8,x
	; vol
	ldab 0x258
	clra
	anda #255
	andb #240
	ora -8,x
	orb -7,x
	stab 0x258
	.dbline 60
; }
	bclr 0x250,#0x8
	.dbline 62
; }
; }
	brclr 0x260,#240,L10
	.dbline 62
	.dbline 64
	ldd #0
	std -2,x
L12:
	.dbline 64
; }
; }
	.dbline 65
; }
	ldd -4,x
	ldy -2,x
	cpy #0
	beq X2
X3:
	asra
	rorb
	dbne y,X3
X2:
	anda #0
	andb #1
	cpd #0
	beq L16
	.dbline 65
	.dbline 66
; }
	bra L8
L16:
	.dbline 68
L13:
	.dbline 64
	ldd -2,x
	addd #1
	std -2,x
	.dbline 64
	ldd -2,x
	cpd #4
	blt L12
	.dbline 69
; }
; }
; }
	bra L8
L10:
	.dbline 71
L7:
	.dbline 57
	ldd -6,x
	addd #1
	std -6,x
	.dbline 57
	ldd -6,x
	cpd #4
	lblt L6
L8:
	.dbline 73
; }
; }
; }
; }
	ldd -2,x
	cpd #4
	bge L18
	ldd -6,x
	cpd #4
	bge L18
	.dbline 73
	.dbline 74
; }
	ldd -6,x
	lsld
	lsld
	addd #L5
	std -8,x
	ldd -2,x
	addd -8,x
	xgdy
	ldab 0,y
	stab _key
	.dbline 75
	bra L19
L18:
	.dbline 75
; }
	.dbline 76
; }
	clr _key
	.dbline 77
; }
L19:
	.dbline 79
; }
; }
	bset 0x250,#8
	.dbline 80
; }
	bset 0x258,#15
	.dbline 81
; }
	bclr 0x250,#0x8
	.dbline 82
; }
	ldab #255
	stab 0x267
	.dbline 83
; }
	ldab #240
	stab 0x266
	.dbline -2
	.dbline 84
; }
L4:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rti
	.dbsym l row -6 I
	.dbsym l col_mask -4 I
	.dbsym l col -2 I
	.dbend
	.dbfunc e keyboard_getchar _keyboard_getchar fc
;           temp -> -1,x
_keyboard_getchar::
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 90
; H¿
; H¿
; H¿
; H¿
; H¿
; H¿
	.dbline 91
; H¿
	movb _key,-1,x
	.dbline 92
; H¿
	clr _key
	.dbline 93
; H¿
	ldab -1,x
	clra
	.dbline -2
L20:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l temp -1 c
	.dbend
	.dbfile M:\SYSC20~2\Assignments\ASSIGM~1\PART1~1/../lib/lcd.c
	.dbfunc e lcd_init _lcd_init fV
_lcd_init::
	.dbline -1
	.dbline 21
	.dbline 22
	jsr _Lcd2PP_Init
	.dbline -2
	.dbline 23
L21:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e lcd_print _lcd_print fV
;          ?temp -> -2,x
;        address -> 6,x
;         string -> 2,x
_lcd_print::
	pshd
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 29
	.dbline 37
	ldd 6,x
	clra
	jsr _LCD_instruction
	bra L24
L23:
	.dbline 38
	.dbline 39
	movw 2,x,-2,x
	ldd -2,x
	addd #1
	std 2,x
	ldy -2,x
	ldab 0,y
	clra
	jsr _LCD_display
	.dbline 40
L24:
	.dbline 38
	ldy 2,x
	tst 0,y
	bne L23
	.dbline -2
	.dbline 41
L22:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l address 6 I
	.dbsym l string 2 pc
	.dbend
	.dbfunc e lcd_print_top _lcd_print_top fV
;         string -> 2,x
_lcd_print_top::
	pshd
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 47
	.dbline 48
	ldd #0
	std 0,sp
	ldd 2,x
	jsr _lcd_print
	.dbline -2
	.dbline 49
L26:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l string 2 pc
	.dbend
	.dbfunc e lcd_print_bottom _lcd_print_bottom fV
;         string -> 2,x
_lcd_print_bottom::
	pshd
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 55
	.dbline 56
	ldd #192
	std 0,sp
	ldd 2,x
	jsr _lcd_print
	.dbline -2
	.dbline 57
L27:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l string 2 pc
	.dbend
	.dbfunc e lcd_display_speed _lcd_display_speed fV
;         string -> -2,x
;          speed -> 2,x
_lcd_display_speed::
	pshd
	pshx
	tfr s,x
	leas -6,sp
	.dbline -1
	.dbline 63
	.dbline 65
	movw 2,x,2,sp
	ldd #L29
	std 0,sp
	ldd -2,x
	jsr _sprintf
	.dbline 66
	ldd -2,x
	jsr _lcd_print_top
	.dbline -2
	.dbline 67
L28:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l string -2 pc
	.dbsym l speed 2 I
	.dbend
	.dbfunc e lcd_display_temperature _lcd_display_temperature fV
;         string -> -2,x
;           temp -> 2,x
_lcd_display_temperature::
	pshd
	pshx
	tfr s,x
	leas -6,sp
	.dbline -1
	.dbline 73
	.dbline 75
	movw 2,x,2,sp
	ldd #L31
	std 0,sp
	ldd -2,x
	jsr _sprintf
	.dbline 76
	ldd -2,x
	jsr _lcd_print_bottom
	.dbline -2
	.dbline 77
L30:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l string -2 pc
	.dbsym l temp 2 I
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGM~1\PART1~1/../lib/lcd.c
_speed::
	.blkb 2
	.area idata
	.word 45
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGM~1\PART1~1/../lib/lcd.c
	.dbfile M:\SYSC20~2\Assignments\ASSIGM~1\PART1~1\assign51.c
	.dbsym e speed _speed I
_temp::
	.blkb 2
	.area idata
	.word 31
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGM~1\PART1~1\assign51.c
	.dbsym e temp _temp I
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGM~1\PART1~1\assign51.c
	.dbfunc e main _main fI
;          ?temp -> -2,x
;            key -> -1,x
_main::
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 12
	.dbline 16
	ldd #26
	jsr _setbaud
	.dbline 18
	jsr _keyboard_init
	.dbline 19
	jsr _lcd_init
	.dbline 20
		cli

	.dbline 22
	ldd _speed
	jsr _lcd_display_speed
	.dbline 23
	ldd _temp
	jsr _lcd_display_temperature
	bra L34
L33:
	.dbline 25
	.dbline 26
	jsr _keyboard_getchar
	stab -2,x
	movb -2,x,-1,x
	tst -2,x
	beq L36
	.dbline 26
	.dbline 27
	ldab -1,x
	cmpb #48
	bne L38
	.dbline 27
	.dbline 28
	bra L35
L38:
	.dbline 29
	ldab -1,x
	cmpb #69
	bne L40
	.dbline 29
	.dbline 30
	ldd _speed
	addd #1
	std _speed
	.dbline 31
	movw _speed,0,sp
	ldd #L42
	jsr _printf
	.dbline 32
	ldd _speed
	jsr _lcd_display_speed
	.dbline 33
	ldd _temp
	jsr _lcd_display_temperature
	.dbline 34
	bra L41
L40:
	.dbline 34
	ldab -1,x
	cmpb #68
	bne L43
	.dbline 34
	.dbline 35
	ldd _speed
	subd #1
	std _speed
	.dbline 36
	movw _speed,0,sp
	ldd #L45
	jsr _printf
	.dbline 37
	ldd _speed
	jsr _lcd_display_speed
	.dbline 38
	ldd _temp
	jsr _lcd_display_temperature
	.dbline 39
	bra L44
L43:
	.dbline 39
	.dbline 40
	ldab -1,x
	clra
	std 0,sp
	ldd #L46
	jsr _printf
	.dbline 41
L44:
L41:
	.dbline 42
L36:
	.dbline 43
L34:
	.dbline 25
	bra L33
L35:
	.dbline 45
	ldd #0
	.dbline -2
L32:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l key -1 c
	.dbend
L46:
	.byte 'P,'u,'s,'h,'e,'d,58,32,37,'c,10,0
L45:
	.byte 'D,'e,'c,'r,'e,'a,'s,'i,'n,'g,32,'s,'p,'e,'e,'d
	.byte 32,'t,'o,32,37,'d,10,0
L42:
	.byte 'I,'n,'c,'r,'e,'a,'s,'i,'n,'g,32,'s,'p,'e,'e,'d
	.byte 32,'t,'o,32,37,'d,10,0
L31:
	.byte 'T,'e,'m,'p,'e,'r,'a,'t,'u,'r,'e,58,32,37,'d,'C
	.byte 0
L29:
	.byte 'S,'p,'e,'e,'d,58,32,37,'d,0
