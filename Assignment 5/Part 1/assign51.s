	.module assign51.c
	.area data
_key:
	.blkb 1
	.area idata
	.byte 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART1~1/../lib/keyboard.c
	.dbsym s key _key c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART1~1/../lib/keyboard.c
	.dbfunc e keyboard_init _keyboard_init fV
_keyboard_init::
	.dbline -1
	.dbline 21
; // By Korey Conway and Tanzeel Rana
; 
; #include <hcs12dp256.h>
; #include <stdio.h>
; #include "../lib/keyboard.c"
; #include "../lib/lcd.c"
; 
; int speed = 45;
; int temp  = 31;
; //void keyboard_key_pushed_callback(char key);
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
	.dbline 22
; 	
	clr 0xf0
	.dbline 24
; 	lcd_display_speed(speed);
; 	lcd_display_temperature(temp); // Need to redisplay bottom line for some reason
	bset 0x252,#8
	.dbline 26
; 	
; 	while ( 1 ) {
	bset 0x25a,#15
	.dbline 27
; 		if ( key = keyboard_getchar() ) {
	bset 0x250,#8
	.dbline 28
; 			if ( key == '0' ) {
	bset 0x258,#15
	.dbline 29
; 				break;
	bclr 0x250,#0x8
	.dbline 31
; 			} else if ( key == 'E' ) {
; 				++speed;
	bclr 0x262,#0xf0
	.dbline 32
; 				printf("Increasing speed to %d\n", speed);
	bset 0x265,#240
	.dbline 33
; 				lcd_display_speed(speed);
	ldab #255
	stab 0x267
	.dbline 34
; 				lcd_display_temperature(temp); // Need to redisplay bottom line for some reason
	clr 0x264
	.dbline 35
; 			} else if ( key == 'D' ) {
	ldab #240
	stab 0x266
	.dbline -2
	.dbline 36
; 				--speed;
L3:
	.dbline 0 ; func end
	rts
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART1~1/../lib/keyboard.c
L5:
	.blkb 2
	.area idata
	.byte 49,50
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART1~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 51,'A
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART1~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 52,53
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART1~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 54,'B
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART1~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 55,56
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART1~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 57,'C
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART1~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 'E,48
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART1~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 'F,'D
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART1~1/../lib/keyboard.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART1~1/../lib/keyboard.c
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
	.dbline 43
; 				printf("Decreasing speed to %d\n", speed);
; 				lcd_display_speed(speed);
; 				lcd_display_temperature(temp); // Need to redisplay bottom line for some reason
; 			} else {
; 				printf("Pushed: %c\n", key);
; 			}
; 		}
	.dbline 44
; 	}
	ldd #0
	std -6,x
	.dbline 45
; 	
	ldd #0
	std -2,x
	.dbline 53
; 	return 0;
; }
; 
; 
; // void keyboard_key_pushed_callback(char key)
; // {}
; 
; 
	clr 0x266
	.dbline 55
; 
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
	std -4,x
	.dbline 58
	ldd #0
	std -6,x
L6:
	.dbline 58
; 
; 
; 
	.dbline 59
; 
	bset 0x250,#8
	.dbline 60
; 
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
	.dbline 61
; 
	bclr 0x250,#0x8
	.dbline 63
; 
; 
	brclr 0x260,#240,L10
	.dbline 63
	.dbline 65
	ldd #0
	std -2,x
L12:
	.dbline 65
; 
; 
	.dbline 66
; 
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
	.dbline 66
	.dbline 67
; 
	bra L8
L16:
	.dbline 69
L13:
	.dbline 65
	ldd -2,x
	addd #1
	std -2,x
	.dbline 65
	ldd -2,x
	cpd #4
	blt L12
	.dbline 70
; 
; 
; 
	bra L8
L10:
	.dbline 72
L7:
	.dbline 58
	ldd -6,x
	addd #1
	std -6,x
	.dbline 58
	ldd -6,x
	cpd #4
	lblt L6
L8:
	.dbline 74
; 
; 
; 
; 
	ldd -2,x
	cpd #4
	bge L18
	ldd -6,x
	cpd #4
	bge L18
	.dbline 74
	.dbline 75
; 
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
	.dbline 77
	bra L19
L18:
	.dbline 77
; 
; 
	.dbline 78
; 
	clr _key
	.dbline 79
; 
L19:
	.dbline 81
; 
; 
	bset 0x250,#8
	.dbline 82
; 
	bset 0x258,#15
	.dbline 83
; 
	bclr 0x250,#0x8
	.dbline 84
; 
	ldab #255
	stab 0x267
	.dbline 85
; 
	ldab #240
	stab 0x266
	.dbline -2
	.dbline 86
; 
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
	.dbline 92
; H¿
; H¿
; H¿
; H¿
; H¿
; H¿
	.dbline 93
; H¿
	movb _key,-1,x
	.dbline 94
; H¿
	clr _key
	.dbline 95
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
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART1~1/../lib/lcd.c
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
	.dbline 30
	ldd 6,x
	clra
	jsr _LCD_instruction
	bra L24
L23:
	.dbline 31
	.dbline 32
	movw 2,x,-2,x
	ldd -2,x
	addd #1
	std 2,x
	ldy -2,x
	ldab 0,y
	clra
	jsr _LCD_display
	.dbline 33
L24:
	.dbline 31
	ldy 2,x
	tst 0,y
	bne L23
	.dbline -2
	.dbline 34
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
	.dbline 40
	.dbline 41
	ldd #0
	std 0,sp
	ldd 2,x
	jsr _lcd_print
	.dbline -2
	.dbline 42
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
	.dbline 48
	.dbline 49
	ldd #192
	std 0,sp
	ldd 2,x
	jsr _lcd_print
	.dbline -2
	.dbline 50
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
	.dbline 56
	.dbline 58
	movw 2,x,2,sp
	ldd #L29
	std 0,sp
	ldd -2,x
	jsr _sprintf
	.dbline 59
	ldd -2,x
	jsr _lcd_print_top
	.dbline -2
	.dbline 60
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
	.dbline 66
	.dbline 68
	movw 2,x,2,sp
	ldd #L31
	std 0,sp
	ldd -2,x
	jsr _sprintf
	.dbline 69
	ldd -2,x
	jsr _lcd_print_bottom
	.dbline -2
	.dbline 70
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
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART1~1/../lib/lcd.c
_speed::
	.blkb 2
	.area idata
	.word 45
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART1~1/../lib/lcd.c
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART1~1\assign51.c
	.dbsym e speed _speed I
_temp::
	.blkb 2
	.area idata
	.word 31
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART1~1\assign51.c
	.dbsym e temp _temp I
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART1~1\assign51.c
	.dbfunc e main _main fI
;          ?temp -> -2,x
;            key -> -1,x
_main::
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 13
	.dbline 17
	ldd #26
	jsr _setbaud
	.dbline 19
	jsr _keyboard_init
	.dbline 20
	jsr _lcd_init
	.dbline 21
		cli

	.dbline 23
	ldd _speed
	jsr _lcd_display_speed
	.dbline 24
	ldd _temp
	jsr _lcd_display_temperature
	bra L34
L33:
	.dbline 26
	.dbline 27
	jsr _keyboard_getchar
	stab -2,x
	movb -2,x,-1,x
	tst -2,x
	beq L36
	.dbline 27
	.dbline 28
	ldab -1,x
	cmpb #48
	bne L38
	.dbline 28
	.dbline 29
	bra L35
L38:
	.dbline 30
	ldab -1,x
	cmpb #69
	bne L40
	.dbline 30
	.dbline 31
	ldd _speed
	addd #1
	std _speed
	.dbline 32
	movw _speed,0,sp
	ldd #L42
	jsr _printf
	.dbline 33
	ldd _speed
	jsr _lcd_display_speed
	.dbline 34
	ldd _temp
	jsr _lcd_display_temperature
	.dbline 35
	bra L41
L40:
	.dbline 35
	ldab -1,x
	cmpb #68
	bne L43
	.dbline 35
	.dbline 36
	ldd _speed
	subd #1
	std _speed
	.dbline 37
	movw _speed,0,sp
	ldd #L45
	jsr _printf
	.dbline 38
	ldd _speed
	jsr _lcd_display_speed
	.dbline 39
	ldd _temp
	jsr _lcd_display_temperature
	.dbline 40
	bra L44
L43:
	.dbline 40
	.dbline 41
	ldab -1,x
	clra
	std 0,sp
	ldd #L46
	jsr _printf
	.dbline 42
L44:
L41:
	.dbline 43
L36:
	.dbline 44
L34:
	.dbline 26
	bra L33
L35:
	.dbline 46
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
	.byte 'T,'e,'m,'p,'e,'r,'a,'t,'u,'r,'e,58,37,'d,'F,0
L29:
	.byte 'S,'p,'e,'e,'d,58,32,37,'d,0
