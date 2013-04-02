	.module assign52.c
	.area data
_current_speed:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/motor.c
	.dbsym s current_speed _current_speed I
_desired_speed:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/motor.c
	.dbsym s desired_speed _desired_speed I
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/motor.c
	.dbfunc e motor_init _motor_init fV
_motor_init::
	.dbline -1
	.dbline 24
; // By Korey Conway and Tanzeel Rana
; 
; #include <hcs12dp256.h>
; #include <stdio.h>
; #include "../lib/motor.c"
; #include "../lib/rti.c"
; #include "../lib/keyboard.c"
; #include "../lib/lcd.c"
; 
; void rti_each_second(void);
; void rti_each_half(void);
; void rti_each_quarter(void);
; 
; int speed = 15;
; int temperature = 30;
; 
; int main()
; {
; 	int pspeed = 0;
; 	char key;
; 	
; 	// Setup terminal
; 	setbaud(BAUD19K);
; 	
	.dbline 26
; 	keyboard_init();
; 	lcd_init();
	bset 0xa1,#128
	.dbline 27
; 	motor_init();
	bclr 0xa4,#0x80
	.dbline 28
; 	rti_init();
	bclr 0xa5,#0x80
	.dbline 29
; 	motor_set_speed(speed);
	ldab #255
	stab 0xa9
	.dbline 30
; 	INTR_ON();
	ldab #99
	stab 0xbb
	.dbline 31
; 		
	bclr 0xa3,#0x70
	.dbline 32
; 	lcd_display_speed(speed);
	bset 0x25a,#64
	.dbline 33
; 	lcd_display_temperature(temperature); // Need to redisplay bottom line for some reason
	bset 0x258,#64
	.dbline 34
; 
	clr 0xc3
	.dbline 35
; 	while ( 1 ) {
	bset 0xa0,#128
	.dbline 36
; 		if ( key = keyboard_getchar() ) {
	; vol
	ldab 0x60
	clra
	anda #255
	andb #0
	ora #0
	orb #80
	stab 0x60
	.dbline 37
; 			if ( key == '0' ) {
	ldd #0
	std 0x62
	.dbline -2
	.dbline 38
; 				break;
L3:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc s motor_set_duty _motor_set_duty fV
;           duty -> 2,x
_motor_set_duty:
	pshd
	pshx
	tfr s,x
	.dbline -1
	.dbline 44
; 			} else if ( key == 'E' ) {
; 				++speed;
; 				motor_set_speed(speed);
; 				printf("Increasing speed to %d\n", speed);
; 				lcd_display_speed(speed);
; 				lcd_display_temperature(temperature); // Need to redisplay bottom line for some reason
	.dbline 45
; 			} else if ( key == 'D' ) {
	ldd 2,x
	bge L5
	.dbline 45
	.dbline 46
; 				--speed;
	clr 0xc3
	.dbline 47
	bra L6
L5:
	.dbline 47
; 				motor_set_speed(speed);
	ldd 2,x
	cpd #55
	ble L7
	.dbline 47
	.dbline 48
; 				printf("Decreasing speed to %d\n", speed);
	ldab #55
	stab 0xc3
	.dbline 49
	bra L8
L7:
	.dbline 49
; 				lcd_display_speed(speed);
	.dbline 50
; 				lcd_display_temperature(temperature); // Need to redisplay bottom line for some reason
	ldd 2,x
	stab 0xc3
	.dbline 51
; 			} else {
L8:
L6:
	.dbline -2
	.dbline 52
; 				printf("Pushed: %c\n", key);
L4:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l duty 2 I
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/motor.c
L10:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/motor.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/motor.c
	.dbfunc e motor_update_speed _motor_update_speed fV
	.dbsym s count L10 I
;     diff_speed -> -2,x
_motor_update_speed::
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 55
; 			}
; 		}
; 	}
	.dbline 57
; 	
; 	return 0;
	ldd #0
	std -2,x
	.dbline 60
; }
; 
; void rti_each()
	; vol
	ldd 0x62
	lsld
	lsld
	ldy L10
	leay 1,y
	exg x,y
	idiv
	exg x,y
	sty _current_speed
	.dbline 61
; {
	ldd L10
	addd #1
	ldy #4
	exg x,y
	idivs
	exg x,y
	std L10
	.dbline 62
; 	//motor_update_speed();
	ldd L10
	bne L11
	.dbline 62
	.dbline 63
; }
	ldd #0
	std 0x62
	.dbline 64
; 
L11:
	.dbline 67
; void rti_each_quarter()
; {
; 	motor_update_speed();
	ldd _desired_speed
	subd _current_speed
	std -2,x
	.dbline 68
; }
	ldd -2,x
	ble L13
	.dbline 68
	.dbline 69
; 
	; vol
	ldab 0xc3
	clra
	addd #1
	jsr _motor_set_duty
	.dbline 70
	bra L14
L13:
	.dbline 70
; void rti_each_half()
	ldd -2,x
	bge L15
	.dbline 70
	.dbline 71
; {}
	; vol
	ldab 0xc3
	clra
	subd #1
	jsr _motor_set_duty
	.dbline 72
; 
L15:
L14:
	.dbline -2
	.dbline 74
; void rti_each_second()
; {}
L9:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l diff_speed -2 I
	.dbend
	.dbfunc e motor_get_speed _motor_get_speed fI
_motor_get_speed::
	.dbline -1
	.dbline 77
; {}
; {}
; {}
	.dbline 78
; {}
	ldd _current_speed
	.dbline -2
L17:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e motor_set_speed _motor_set_speed fV
;          speed -> 2,x
_motor_set_speed::
	pshd
	pshx
	tfr s,x
	.dbline -1
	.dbline 82
; {}
; {}
; {}
; {}
	.dbline 83
	ldd 2,x
	cpd #10
	bge L21
	ldd 2,x
	cpd #30
	bgt L19
L21:
	.dbline 83
; {}
	.dbline 84
; {}
	movw 2,x,_desired_speed
	.dbline 86
; {}
; {}
	ldd _current_speed
	bne L22
	.dbline 86
	.dbline 87
; {}
	ldab #25
	stab 0xc3
	.dbline 88
; {}
L22:
	.dbline 89
L19:
	.dbline -2
	.dbline 91
; {}
; {}
; {}
L18:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l speed 2 I
	.dbend
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/rti.c
	.dbfunc e rti_init _rti_init fV
_rti_init::
	.dbline -1
	.dbline 20
	.dbline 21
	bset 0x38,#128
	.dbline 22
	ldab #119
	stab 0x3b
	.dbline -2
	.dbline 23
L24:
	.dbline 0 ; func end
	rts
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/rti.c
L26:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/rti.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/rti.c
	.dbfunc e rti_isr _rti_isr fV
	.dbsym s count L26 I
_rti_isr::
	.dbline -1
	.dbline 30
	.dbline 32
	ldd L26
	addd #1
	ldy #8
	exg x,y
	idivs
	exg x,y
	std L26
	.dbline 34
	jsr _rti_each
	.dbline 39
	ldd L26
	ldy #2
	exg x,y
	idivs
	exg x,y
	cpd #0
	bne L27
	.dbline 39
	.dbline 40
	jsr _rti_each_quarter
	.dbline 41
L27:
	.dbline 44
	ldd L26
	ldy #4
	exg x,y
	idivs
	exg x,y
	cpd #0
	bne L29
	.dbline 44
	.dbline 45
	jsr _rti_each_half
	.dbline 46
L29:
	.dbline 48
	ldd L26
	bne L31
	.dbline 48
	.dbline 49
	jsr _rti_each_second
	.dbline 50
L31:
	.dbline 53
	bset 0x37,#128
	.dbline -2
	.dbline 54
L25:
	.dbline 0 ; func end
	rti
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/rti.c
_key:
	.blkb 1
	.area idata
	.byte 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/rti.c
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/keyboard.c
	.dbsym s key _key c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/keyboard.c
	.dbfunc e keyboard_init _keyboard_init fV
_keyboard_init::
	.dbline -1
	.dbline 21
	.dbline 22
	clr 0xf0
	.dbline 24
	bset 0x252,#8
	.dbline 26
	bset 0x25a,#15
	.dbline 27
	bset 0x250,#8
	.dbline 28
	bset 0x258,#15
	.dbline 29
	bclr 0x250,#0x8
	.dbline 31
	bclr 0x262,#0xf0
	.dbline 32
	bset 0x265,#240
	.dbline 33
	ldab #255
	stab 0x267
	.dbline 34
	clr 0x264
	.dbline 35
	ldab #240
	stab 0x266
	.dbline -2
	.dbline 36
L33:
	.dbline 0 ; func end
	rts
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/keyboard.c
L35:
	.blkb 2
	.area idata
	.byte 49,50
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 51,'A
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 52,53
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 54,'B
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 55,56
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 57,'C
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 'E,48
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 'F,'D
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/keyboard.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/keyboard.c
	.dbfunc e keyboard_isr _keyboard_isr fV
	.dbsym s char_map L35 A[16:4:4]c
;            row -> -6,x
;       col_mask -> -4,x
;            col -> -2,x
_keyboard_isr::
	pshx
	tfr s,x
	leas -8,sp
	.dbline -1
	.dbline 43
	.dbline 44
	ldd #0
	std -6,x
	.dbline 45
	ldd #0
	std -2,x
	.dbline 53
	clr 0x266
	.dbline 55
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
L36:
	.dbline 58
	.dbline 59
	bset 0x250,#8
	.dbline 60
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
	bclr 0x250,#0x8
	.dbline 63
	brclr 0x260,#240,L40
	.dbline 63
	.dbline 65
	ldd #0
	std -2,x
L42:
	.dbline 65
	.dbline 66
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
	beq L46
	.dbline 66
	.dbline 67
	bra L38
L46:
	.dbline 69
L43:
	.dbline 65
	ldd -2,x
	addd #1
	std -2,x
	.dbline 65
	ldd -2,x
	cpd #4
	blt L42
	.dbline 70
	bra L38
L40:
	.dbline 72
L37:
	.dbline 58
	ldd -6,x
	addd #1
	std -6,x
	.dbline 58
	ldd -6,x
	cpd #4
	lblt L36
L38:
	.dbline 74
	ldd -2,x
	cpd #4
	bge L48
	ldd -6,x
	cpd #4
	bge L48
	.dbline 74
	.dbline 75
	ldd -6,x
	lsld
	lsld
	addd #L35
	std -8,x
	ldd -2,x
	addd -8,x
	xgdy
	ldab 0,y
	stab _key
	.dbline 77
	bra L49
L48:
	.dbline 77
	.dbline 78
	clr _key
	.dbline 79
L49:
	.dbline 81
	bset 0x250,#8
	.dbline 82
	bset 0x258,#15
	.dbline 83
	bclr 0x250,#0x8
	.dbline 84
	ldab #255
	stab 0x267
	.dbline 85
	ldab #240
	stab 0x266
	.dbline -2
	.dbline 86
L34:
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
; H�
	.dbline 93
; H�
	movb _key,-1,x
	.dbline 94
; H�
	clr _key
	.dbline 95
; H�
	ldab -1,x
	clra
	.dbline -2
L50:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l temp -1 c
	.dbend
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/lcd.c
	.dbfunc e lcd_init _lcd_init fV
_lcd_init::
	.dbline -1
	.dbline 21
	.dbline 22
	jsr _Lcd2PP_Init
	.dbline -2
	.dbline 23
L51:
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
	bra L54
L53:
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
L54:
	.dbline 31
	ldy 2,x
	tst 0,y
	bne L53
	.dbline -2
	.dbline 34
L52:
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
L56:
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
L57:
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
	ldd #L59
	std 0,sp
	ldd -2,x
	jsr _sprintf
	.dbline 59
	ldd -2,x
	jsr _lcd_print_top
	.dbline -2
	.dbline 60
L58:
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
	ldd #L61
	std 0,sp
	ldd -2,x
	jsr _sprintf
	.dbline 69
	ldd -2,x
	jsr _lcd_print_bottom
	.dbline -2
	.dbline 70
L60:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l string -2 pc
	.dbsym l temp 2 I
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/lcd.c
_speed::
	.blkb 2
	.area idata
	.word 15
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/lcd.c
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1\assign52.c
	.dbsym e speed _speed I
_temperature::
	.blkb 2
	.area idata
	.word 30
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1\assign52.c
	.dbsym e temperature _temperature I
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1\assign52.c
	.dbfunc e main _main fI
;          ?temp -> -4,x
;         pspeed -> -3,x
;            key -> -1,x
_main::
	pshx
	tfr s,x
	leas -6,sp
	.dbline -1
	.dbline 18
	.dbline 19
	ldd #0
	std -3,x
	.dbline 23
	ldd #26
	jsr _setbaud
	.dbline 25
	jsr _keyboard_init
	.dbline 26
	jsr _lcd_init
	.dbline 27
	jsr _motor_init
	.dbline 28
	jsr _rti_init
	.dbline 29
	ldd _speed
	jsr _motor_set_speed
	.dbline 30
		cli

	.dbline 32
	ldd _speed
	jsr _lcd_display_speed
	.dbline 33
	ldd _temperature
	jsr _lcd_display_temperature
	lbra L64
L63:
	.dbline 35
	.dbline 36
	jsr _keyboard_getchar
	stab -4,x
	movb -4,x,-1,x
	tst -4,x
	beq L66
	.dbline 36
	.dbline 37
	ldab -1,x
	cmpb #48
	bne L68
	.dbline 37
	.dbline 38
	bra L65
L68:
	.dbline 39
	ldab -1,x
	cmpb #69
	bne L70
	.dbline 39
	.dbline 40
	ldd _speed
	addd #1
	std _speed
	.dbline 41
	ldd _speed
	jsr _motor_set_speed
	.dbline 42
	movw _speed,0,sp
	ldd #L72
	jsr _printf
	.dbline 43
	ldd _speed
	jsr _lcd_display_speed
	.dbline 44
	ldd _temperature
	jsr _lcd_display_temperature
	.dbline 45
	bra L71
L70:
	.dbline 45
	ldab -1,x
	cmpb #68
	bne L73
	.dbline 45
	.dbline 46
	ldd _speed
	subd #1
	std _speed
	.dbline 47
	ldd _speed
	jsr _motor_set_speed
	.dbline 48
	movw _speed,0,sp
	ldd #L75
	jsr _printf
	.dbline 49
	ldd _speed
	jsr _lcd_display_speed
	.dbline 50
	ldd _temperature
	jsr _lcd_display_temperature
	.dbline 51
	bra L74
L73:
	.dbline 51
	.dbline 52
	ldab -1,x
	clra
	std 0,sp
	ldd #L76
	jsr _printf
	.dbline 53
L74:
L71:
	.dbline 54
L66:
	.dbline 55
L64:
	.dbline 35
	lbra L63
L65:
	.dbline 57
	ldd #0
	.dbline -2
L62:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l pspeed -3 I
	.dbsym l key -1 c
	.dbend
	.dbfunc e rti_each _rti_each fV
_rti_each::
	.dbline -1
	.dbline 61
	.dbline -2
	.dbline 63
L77:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e rti_each_quarter _rti_each_quarter fV
_rti_each_quarter::
	.dbline -1
	.dbline 66
	.dbline 67
	jsr _motor_update_speed
	.dbline -2
	.dbline 68
L78:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e rti_each_half _rti_each_half fV
_rti_each_half::
	.dbline -1
	.dbline 71
	.dbline -2
	.dbline 71
L79:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e rti_each_second _rti_each_second fV
_rti_each_second::
	.dbline -1
	.dbline 74
	.dbline -2
	.dbline 74
L80:
	.dbline 0 ; func end
	rts
	.dbend
L76:
	.byte 'P,'u,'s,'h,'e,'d,58,32,37,'c,10,0
L75:
	.byte 'D,'e,'c,'r,'e,'a,'s,'i,'n,'g,32,'s,'p,'e,'e,'d
	.byte 32,'t,'o,32,37,'d,10,0
L72:
	.byte 'I,'n,'c,'r,'e,'a,'s,'i,'n,'g,32,'s,'p,'e,'e,'d
	.byte 32,'t,'o,32,37,'d,10,0
L61:
	.byte 'T,'e,'m,'p,'e,'r,'a,'t,'u,'r,'e,58,32,37,'d,'C
	.byte 0
L59:
	.byte 'S,'p,'e,'e,'d,58,32,37,'d,0
