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
_motor_enabled:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/motor.c
	.dbsym s motor_enabled _motor_enabled I
_motor_paca_count::
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/motor.c
	.dbsym e motor_paca_count _motor_paca_count I
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/motor.c
	.dbfunc e motor_init _motor_init fV
_motor_init::
	.dbline -1
	.dbline 29
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
; int speed = 25;
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
; 	keyboard_init();
; 	lcd_init();
; 	motor_init();
; 	rti_init();
; 	motor_set_speed(speed);
	.dbline 30
; 	INTR_ON();
	ldd #1
	std _motor_enabled
	.dbline 33
; 		
; 	lcd_display_speed(speed);
; 	lcd_display_temperature(temperature); // Need to redisplay bottom line for some reason
	bset 0xa1,#128
	.dbline 34
; 
	bclr 0xa4,#0x80
	.dbline 35
; 	// Note: the assigment says to have nothing in the main after initilization, but this doesn't make sense.
	bclr 0xa5,#0x80
	.dbline 36
; 	//	It is not proper to have terminal (eg. printf) and lcd outputs inside of the ISRs since those need to run quickly to avoid problems
	ldab #255
	stab 0xa9
	.dbline 37
; 	while ( 1 ) { 
	ldab #255
	stab 0xbb
	.dbline 38
; 		if ( key = keyboard_getchar() ) {
	bclr 0xa3,#0x70
	.dbline 39
; 			if ( key == '0' ) {
	bset 0x25a,#64
	.dbline 40
; 				break;
	bset 0x258,#64
	.dbline 41
; 			} else if ( key == 'E' ) {
	clr 0xc3
	.dbline 42
; 				if ( speed < MOTOR_MAX_SPEED ) {
	bset 0xa0,#128
	.dbline 43
; 					++speed;
	ldd #0
	std 0x62
	.dbline 44
; 					motor_set_speed(speed);
	bset 0x61,#1
	.dbline 45
; 					printf("Increasing speed to %d\n", speed);
	ldab #81
	stab 0x60
	.dbline -2
	.dbline 46
; 				} else {
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
	.dbline 52
; 					printf("Speed is maxed at %d, cannot increase.\n", speed);
; 				}
; 				lcd_display_speed(speed);
; 				lcd_display_temperature(temperature); // Need to redisplay bottom line for some reason
; 			} else if ( key == 'D' ) {
; 				if ( speed > MOTOR_MIN_SPEED ) {
	.dbline 53
; 					--speed;
	ldd _motor_enabled
	bne L5
	.dbline 53
	.dbline 54
; 					motor_set_speed(speed);
	bra L4
L5:
	.dbline 57
; 					printf("Decreasing speed to %d\n", speed);
; 				} else {
; 					printf("Speed is at minimum, at %d, cannot decrease.\n", speed);
	ldd 2,x
	cpd #115
	bge L7
	ldd _desired_speed
	ble L7
	.dbline 57
	.dbline 58
; 				}
	ldab #115
	stab 0xc3
	.dbline 59
	bra L8
L7:
	.dbline 59
; 				lcd_display_speed(speed);
	ldd 2,x
	cpd #200
	ble L9
	.dbline 59
	.dbline 60
; 				lcd_display_temperature(temperature); // Need to redisplay bottom line for some reason
	ldab #200
	stab 0xc3
	.dbline 61
	bra L10
L9:
	.dbline 61
; 			} else {
	.dbline 62
; 				printf("Pushed: %c\n", key);
	ldd 2,x
	stab 0xc3
	.dbline 63
; 			}
L10:
L8:
	.dbline -2
	.dbline 64
; 		}
L4:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l duty 2 I
	.dbend
	.dbfunc e motor_disable _motor_disable fV
_motor_disable::
	.dbline -1
	.dbline 67
; 	}
; 	
; 	return 0;
	.dbline 68
; }
	bclr 0xa0,#0x80
	.dbline 69
; 
	ldd #0
	std _motor_enabled
	.dbline -2
	.dbline 70
; void rti_each()
L11:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e motor_enable _motor_enable fV
_motor_enable::
	.dbline -1
	.dbline 73
; {}
; 
; void rti_each_quarter()
	.dbline 74
; {
	bset 0xa0,#128
	.dbline 75
; 	motor_update_speed();
	ldd #1
	std _motor_enabled
	.dbline -2
	.dbline 76
; }
L12:
	.dbline 0 ; func end
	rts
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/motor.c
L14:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/motor.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/motor.c
	.dbfunc e motor_update_speed _motor_update_speed fV
	.dbsym s count L14 I
;     diff_speed -> -2,x
_motor_update_speed::
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 79
; 
; void rti_each_half()
; {}
	.dbline 81
; 
; void rti_each_second()
	ldd #0
	std -2,x
	.dbline 84
; {}
; {}
; {}
	ldd _motor_paca_count
	lsld
	lsld
	ldy L14
	leay 1,y
	exg x,y
	idivs
	exg x,y
	sty _current_speed
	.dbline 85
; {}
	ldd L14
	addd #1
	ldy #4
	exg x,y
	idivs
	exg x,y
	std L14
	.dbline 89
; {}
; {}
; {}
; {}
	ldd L14
	bne L15
	.dbline 89
	.dbline 91
; {}
; {}
	ldd #0
	std _motor_paca_count
	.dbline 92
; {}
L15:
	.dbline 96
; {}
; {}
; {}
; {}
	ldd _desired_speed
	subd _current_speed
	std -2,x
	.dbline 97
; {}
	ldd -2,x
	beq L17
	ldd _current_speed
	bne L17
	; vol
	ldab 0xc3
	cmpb #130
	bhs L17
	.dbline 97
	.dbline 98
; {}
	ldd #130
	jsr _motor_set_duty
	.dbline 99
	bra L18
L17:
	.dbline 99
; {}
	ldd -2,x
	ble L19
	.dbline 99
	.dbline 100
; {}
	; vol
	ldab 0xc3
	clra
	addd #1
	jsr _motor_set_duty
	.dbline 101
	bra L20
L19:
	.dbline 101
; {}
	ldd -2,x
	bge L21
	.dbline 101
	.dbline 102
; {}
	; vol
	ldab 0xc3
	clra
	subd #1
	jsr _motor_set_duty
	.dbline 103
; {}
L21:
L20:
L18:
	.dbline -2
	.dbline 105
; {}
; {}
L13:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l diff_speed -2 I
	.dbend
	.dbfunc e motor_get_speed _motor_get_speed fI
_motor_get_speed::
	.dbline -1
	.dbline 108
; {}
; {}
; {}
	.dbline 109
; {}
	ldd _current_speed
	.dbline -2
L23:
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
	.dbline 113
; {}
; {}
; {}
; {}
	.dbline 114
	ldd 2,x
	bge L27
	ldd 2,x
	cpd #30
	bgt L25
L27:
	.dbline 114
	.dbline 115
	movw 2,x,_desired_speed
	.dbline 116
L25:
	.dbline -2
	.dbline 117
; {}
; {}
; {}
; {}
L24:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l speed 2 I
	.dbend
	.dbfunc e motor_paca_isr _motor_paca_isr fV
_motor_paca_isr::
	.dbline -1
	.dbline 121
; ä
; ä
; ä
; ä
	.dbline 122
; ä
	ldd _motor_paca_count
	addd #1
	std _motor_paca_count
	.dbline 123
; ä
	bset 0x61,#1
	.dbline -2
	.dbline 124
; ä
L28:
	.dbline 0 ; func end
	rti
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
L29:
	.dbline 0 ; func end
	rts
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/rti.c
L31:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/rti.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/rti.c
	.dbfunc e rti_isr _rti_isr fV
	.dbsym s count L31 I
_rti_isr::
	.dbline -1
	.dbline 30
	.dbline 32
	ldd L31
	addd #1
	ldy #8
	exg x,y
	idivs
	exg x,y
	std L31
	.dbline 34
	jsr _rti_each
	.dbline 39
	ldd L31
	ldy #2
	exg x,y
	idivs
	exg x,y
	cpd #0
	bne L32
	.dbline 39
	.dbline 40
	jsr _rti_each_quarter
	.dbline 41
L32:
	.dbline 44
	ldd L31
	ldy #4
	exg x,y
	idivs
	exg x,y
	cpd #0
	bne L34
	.dbline 44
	.dbline 45
	jsr _rti_each_half
	.dbline 46
L34:
	.dbline 48
	ldd L31
	bne L36
	.dbline 48
	.dbline 49
	jsr _rti_each_second
	.dbline 50
L36:
	.dbline 53
	bset 0x37,#128
	.dbline -2
	.dbline 54
L30:
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
L38:
	.dbline 0 ; func end
	rts
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART2~1/../lib/keyboard.c
L40:
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
	.dbsym s char_map L40 A[16:4:4]c
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
L41:
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
	brclr 0x260,#240,L45
	.dbline 63
	.dbline 65
	ldd #0
	std -2,x
L47:
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
	beq L51
	.dbline 66
	.dbline 67
	bra L43
L51:
	.dbline 69
L48:
	.dbline 65
	ldd -2,x
	addd #1
	std -2,x
	.dbline 65
	ldd -2,x
	cpd #4
	blt L47
	.dbline 70
	bra L43
L45:
	.dbline 72
L42:
	.dbline 58
	ldd -6,x
	addd #1
	std -6,x
	.dbline 58
	ldd -6,x
	cpd #4
	lblt L41
L43:
	.dbline 74
	ldd -2,x
	cpd #4
	bge L53
	ldd -6,x
	cpd #4
	bge L53
	.dbline 74
	.dbline 75
	ldd -6,x
	lsld
	lsld
	addd #L40
	std -8,x
	ldd -2,x
	addd -8,x
	xgdy
	ldab 0,y
	stab _key
	.dbline 77
	bra L54
L53:
	.dbline 77
	.dbline 78
	clr _key
	.dbline 79
L54:
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
L39:
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
	.dbline 93
	movb _key,-1,x
	.dbline 94
	clr _key
	.dbline 95
	ldab -1,x
	clra
	.dbline -2
L55:
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
L56:
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
	bra L59
L58:
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
L59:
	.dbline 31
	ldy 2,x
	tst 0,y
	bne L58
	.dbline -2
	.dbline 34
L57:
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
L61:
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
L62:
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
	ldd #L64
	std 0,sp
	ldd -2,x
	jsr _sprintf
	.dbline 59
	ldd -2,x
	jsr _lcd_print_top
	.dbline -2
	.dbline 60
L63:
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
	ldd #L66
	std 0,sp
	ldd -2,x
	jsr _sprintf
	.dbline 69
	ldd -2,x
	jsr _lcd_print_bottom
	.dbline -2
	.dbline 70
L65:
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
	.word 25
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
	lbra L69
L68:
	.dbline 37
	.dbline 38
	jsr _keyboard_getchar
	stab -4,x
	movb -4,x,-1,x
	tst -4,x
	lbeq L71
	.dbline 38
	.dbline 39
	ldab -1,x
	cmpb #48
	bne L73
	.dbline 39
	.dbline 40
	lbra L70
L73:
	.dbline 41
	ldab -1,x
	cmpb #69
	bne L75
	.dbline 41
	.dbline 42
	ldd _speed
	cpd #30
	bge L77
	.dbline 42
	.dbline 43
	ldd _speed
	addd #1
	std _speed
	.dbline 44
	ldd _speed
	jsr _motor_set_speed
	.dbline 45
	movw _speed,0,sp
	ldd #L79
	jsr _printf
	.dbline 46
	bra L78
L77:
	.dbline 46
	.dbline 47
	movw _speed,0,sp
	ldd #L80
	jsr _printf
	.dbline 48
L78:
	.dbline 49
	ldd _speed
	jsr _lcd_display_speed
	.dbline 50
	ldd _temperature
	jsr _lcd_display_temperature
	.dbline 51
	bra L76
L75:
	.dbline 51
	ldab -1,x
	cmpb #68
	bne L81
	.dbline 51
	.dbline 52
	ldd _speed
	ble L83
	.dbline 52
	.dbline 53
	ldd _speed
	subd #1
	std _speed
	.dbline 54
	ldd _speed
	jsr _motor_set_speed
	.dbline 55
	movw _speed,0,sp
	ldd #L85
	jsr _printf
	.dbline 56
	bra L84
L83:
	.dbline 56
	.dbline 57
	movw _speed,0,sp
	ldd #L86
	jsr _printf
	.dbline 58
L84:
	.dbline 59
	ldd _speed
	jsr _lcd_display_speed
	.dbline 60
	ldd _temperature
	jsr _lcd_display_temperature
	.dbline 61
	bra L82
L81:
	.dbline 61
	.dbline 62
	ldab -1,x
	clra
	std 0,sp
	ldd #L87
	jsr _printf
	.dbline 63
L82:
L76:
	.dbline 64
L71:
	.dbline 65
L69:
	.dbline 37
	lbra L68
L70:
	.dbline 67
	ldd #0
	.dbline -2
L67:
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
	.dbline 71
	.dbline -2
	.dbline 71
L88:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e rti_each_quarter _rti_each_quarter fV
_rti_each_quarter::
	.dbline -1
	.dbline 74
	.dbline 75
	jsr _motor_update_speed
	.dbline -2
	.dbline 76
L89:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e rti_each_half _rti_each_half fV
_rti_each_half::
	.dbline -1
	.dbline 79
	.dbline -2
	.dbline 79
L90:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e rti_each_second _rti_each_second fV
_rti_each_second::
	.dbline -1
	.dbline 82
	.dbline -2
	.dbline 82
L91:
	.dbline 0 ; func end
	rts
	.dbend
L87:
	.byte 'P,'u,'s,'h,'e,'d,58,32,37,'c,10,0
L86:
	.byte 'S,'p,'e,'e,'d,32,'i,'s,32,'a,'t,32,'m,'i,'n,'i
	.byte 'm,'u,'m,44,32,'a,'t,32,37,'d,44,32,'c,'a,'n,'n
	.byte 'o,'t,32,'d,'e,'c,'r,'e,'a,'s,'e,46,10,0
L85:
	.byte 'D,'e,'c,'r,'e,'a,'s,'i,'n,'g,32,'s,'p,'e,'e,'d
	.byte 32,'t,'o,32,37,'d,10,0
L80:
	.byte 'S,'p,'e,'e,'d,32,'i,'s,32,'m,'a,'x,'e,'d,32,'a
	.byte 't,32,37,'d,44,32,'c,'a,'n,'n,'o,'t,32,'i,'n,'c
	.byte 'r,'e,'a,'s,'e,46,10,0
L79:
	.byte 'I,'n,'c,'r,'e,'a,'s,'i,'n,'g,32,'s,'p,'e,'e,'d
	.byte 32,'t,'o,32,37,'d,10,0
L66:
	.byte 'T,'e,'m,'p,'e,'r,'a,'t,'u,'r,'e,58,37,'d,'F,0
L64:
	.byte 'S,'p,'e,'e,'d,58,32,37,'d,0
