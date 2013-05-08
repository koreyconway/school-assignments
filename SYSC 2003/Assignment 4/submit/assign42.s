	.module assign42.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART2~1/../lib/keyboard.c
	.dbfunc s keyboard_init _keyboard_init fV
_keyboard_init:
	.dbline -1
	.dbline 19
; // By Korey Conway and Tanzeel Rana
; 
; #include <hcs12dp256.h>
; #include <stdio.h>
; #include "../lib/keyboard.c"
; #include "../lib/lcd.c"
; 
; void lcd_display_speed(int speed);
; void lcd_display_temperature(int temp);
; 
; int speed = 45;
; int temp  = 31;
; 
; int main()
; {
; 	char key;
; 	
; 	// Setup keyboard, terminal, and lcd
; 	lcd_init();
	.dbline 20
; 	
	clr 0xf0
	.dbline 21
; 	// Initial lcd display
	ldab #15
	stab 0x25a
	.dbline 22
; 	lcd_display_speed(speed);
	bclr 0x262,#0xf0
	.dbline 23
; 	lcd_display_temperature(temp);
	bset 0x262,#8
	.dbline -2
	.dbline 24
; 	
L3:
	.dbline 0 ; func end
	rts
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART2~1/../lib/keyboard.c
L5:
	.blkb 2
	.area idata
	.word -1
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART2~1/../lib/keyboard.c
L6:
	.blkb 2
	.area idata
	.word -1
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART2~1/../lib/keyboard.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART2~1/../lib/keyboard.c
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
; 	while ( 1 ) {
; 		key = keyboard_getchar();
; 		putchar(key);
; 		
; 		if ( key == '0' ) {
; 			break;
	.dbline 33
; 		} else if ( key == 'E' ) {
; 			++speed;
; 			printf("Increasing speed to %d\n", speed);
	ldd #0
	std -2,x
	.dbline 34
; 			lcd_display_speed(speed);
	ldd #0
	std -4,x
	.dbline 36
; 			lcd_display_temperature(temp); // Need to redisplay bottom line for some reason
; 		} else if ( key == 'D' ) {
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
; 			--speed;
; 			printf("Decreasing speed to %d\n", speed);
; 			lcd_display_speed(speed);
; 			lcd_display_temperature(temp); // Need to redisplay bottom line for some reason
; 		}
	jsr _keyboard_init
	lbra L9
L8:
	.dbline 43
; 	}
; 	
	.dbline 44
; 	return 0;
	bset 0x250,#8
	.dbline 45
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
	.dbline 46
; 
	bclr 0x250,#0x8
	.dbline 48
; void lcd_display_speed(int speed)
; {
	jsr _keyboard_get_column
	std -4,x
	.dbline 51
; 	char *string;
; 	sprintf(string, "Speed: %d", speed);
; 	lcd_print_top(string);
	ldd -4,x
	cpd #-1
	beq L11
	.dbline 51
	.dbline 52
; }
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
; void lcd_display_temperature(int temp)
	.dbline 55
; {
	ldd #20480
	jsr _keyboard_delay
	.dbline 56
; 	char *string;
L14:
	.dbline 59
; 	sprintf(string, "Temperature: %dC", temp);
; 	lcd_print_bottom(string);
; }
	jsr _keyboard_get_column
	std -22,x
	ldd -4,x
	cpd -22,x
	bne L12
	.dbline 59
	.dbline 61
; }
; }
	movw -2,x,L5
	.dbline 62
; }
	movw -4,x,L6
	.dbline 63
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
	.dbline 65
L11:
	.dbline 65
; }
; }
	ldd -2,x
	cpd L5
	bne L17
	.dbline 65
	.dbline 67
; }
; }
	ldd #-1
	std L6
	.dbline 68
; }
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
	.dbline 82
; ä
; ä
; ä
; ä
; ä
; ä
; ä
; ä
	.dbline 83
; ä
	ldd #0
	std -2,x
	.dbline 84
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
	.dbline 87
; ä
; ä
; ä
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
; ä
; ä
; ä
; ä
	.dbline 92
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
	.dbline 92
	.dbline 93
; ä
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
	.dbline 104
; ä
; ä
; ä
; ä
; ä
; ä
; ä
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
; ä
	ldd 2,x
	bne L29
	.dbline -2
	.dbline 106
; ä
L28:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l delay 2 i
	.dbend
	.include 'basicLCD.s'

	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART2~1/../lib/lcd.c
	.dbfunc e lcd_init _lcd_init fV
_lcd_init::
	.dbline -1
	.dbline 21
	.dbline 22
	jsr _Lcd2PP_Init
	.dbline -2
	.dbline 23
L33:
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
	ldab #15
	stab 0x242
	.dbline 31
	clr 0x240
	.dbline 32
	ldab #254
	stab 0x252
	.dbline 33
	clr 0x250
	.dbline 34
	bset 0x25a,#15
	.dbline 35
	bclr 0xf0,#0x40
	.dbline 37
	ldd 6,x
	clra
	jsr _LCD_instruction
	bra L36
L35:
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
L36:
	.dbline 38
	ldy 2,x
	tst 0,y
	bne L35
	.dbline -2
	.dbline 41
L34:
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
L38:
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
L39:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l string 2 pc
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART2~1/../lib/lcd.c
_speed::
	.blkb 2
	.area idata
	.word 45
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART2~1/../lib/lcd.c
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART2~1\assign42.c
	.dbsym e speed _speed I
_temp::
	.blkb 2
	.area idata
	.word 31
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART2~1\assign42.c
	.dbsym e temp _temp I
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART2~1\assign42.c
	.dbfunc e main _main fI
;            key -> -1,x
_main::
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 15
	.dbline 19
	jsr _lcd_init
	.dbline 22
	ldd _speed
	jsr _lcd_display_speed
	.dbline 23
	ldd _temp
	jsr _lcd_display_temperature
	bra L42
L41:
	.dbline 25
	.dbline 26
	jsr _keyboard_getchar
	stab -1,x
	.dbline 27
	ldab -1,x
	clra
	jsr _putchar
	.dbline 29
	ldab -1,x
	cmpb #48
	bne L44
	.dbline 29
	.dbline 30
	bra L43
L44:
	.dbline 31
	ldab -1,x
	cmpb #69
	bne L46
	.dbline 31
	.dbline 32
	ldd _speed
	addd #1
	std _speed
	.dbline 33
	movw _speed,0,sp
	ldd #L48
	jsr _printf
	.dbline 34
	ldd _speed
	jsr _lcd_display_speed
	.dbline 35
	ldd _temp
	jsr _lcd_display_temperature
	.dbline 36
	bra L47
L46:
	.dbline 36
	ldab -1,x
	cmpb #68
	bne L49
	.dbline 36
	.dbline 37
	ldd _speed
	subd #1
	std _speed
	.dbline 38
	movw _speed,0,sp
	ldd #L51
	jsr _printf
	.dbline 39
	ldd _speed
	jsr _lcd_display_speed
	.dbline 40
	ldd _temp
	jsr _lcd_display_temperature
	.dbline 41
L49:
L47:
	.dbline 42
L42:
	.dbline 25
	bra L41
L43:
	.dbline 44
	ldd #0
	.dbline -2
L40:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l key -1 c
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
	.dbline 48
	.dbline 50
	movw 2,x,2,sp
	ldd #L53
	std 0,sp
	ldd -2,x
	jsr _sprintf
	.dbline 51
	ldd -2,x
	jsr _lcd_print_top
	.dbline -2
	.dbline 52
L52:
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
	.dbline 55
	.dbline 57
	movw 2,x,2,sp
	ldd #L55
	std 0,sp
	ldd -2,x
	jsr _sprintf
	.dbline 58
	ldd -2,x
	jsr _lcd_print_bottom
	.dbline -2
	.dbline 59
L54:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l string -2 pc
	.dbsym l temp 2 I
	.dbend
L55:
	.byte 'T,'e,'m,'p,'e,'r,'a,'t,'u,'r,'e,58,32,37,'d,'C
	.byte 0
L53:
	.byte 'S,'p,'e,'e,'d,58,32,37,'d,0
L51:
	.byte 'D,'e,'c,'r,'e,'a,'s,'i,'n,'g,32,'s,'p,'e,'e,'d
	.byte 32,'t,'o,32,37,'d,10,0
L48:
	.byte 'I,'n,'c,'r,'e,'a,'s,'i,'n,'g,32,'s,'p,'e,'e,'d
	.byte 32,'t,'o,32,37,'d,10,0
