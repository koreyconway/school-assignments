	.module assign54.c
	.area data
_current_speed:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/motor.c
	.dbsym s current_speed _current_speed I
_desired_speed:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/motor.c
	.dbsym s desired_speed _desired_speed I
_motor_enabled:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/motor.c
	.dbsym s motor_enabled _motor_enabled I
_motor_paca_count::
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/motor.c
	.dbsym e motor_paca_count _motor_paca_count I
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/motor.c
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
; #include "../lib/temperature.c"
; #include "../lib/stepper.c"
; #include "../lib/buzzer.c"
; #include "../lib/led.c"
; 
; #define DESIRED_TEMPERATURE	100
; #define DIRECTION_NORTH	0
; #define DIRECTION_EAST	1
; #define DIRECTION_SOUTH	2
; #define DIRECTION_WEST	3
; 
; void rti_each_second(void);
; void rti_each_half(void);
; void rti_each_quarter(void);
; 
; void trigger_collision(void);
; void collision_avoidance(void);
; 
; // Global variables
; int collision_detected = 0;
; int speed = 30;
	.dbline 30
; int temperature = 0;
	ldd #1
	std _motor_enabled
	.dbline 33
; int direction = DIRECTION_NORTH;
; 
; int main()
	bset 0xa1,#128
	.dbline 34
; {
	bclr 0xa4,#0x80
	.dbline 35
; 	int previous_temperature = 0;
	bclr 0xa5,#0x80
	.dbline 36
; 	char key;
	ldab #255
	stab 0xa9
	.dbline 37
; 	
	ldab #255
	stab 0xbb
	.dbline 38
; 	// Setup terminal
	bclr 0xa3,#0x70
	.dbline 39
; 	setbaud(BAUD19K);
	bset 0x25a,#64
	.dbline 40
; 	
	bset 0x258,#64
	.dbline 41
; 	keyboard_init();
	clr 0xc3
	.dbline 42
; 	lcd_init();
	bset 0xa0,#128
	.dbline 43
; 	motor_init();
	ldd #0
	std 0x62
	.dbline 44
; 	rti_init();
	bset 0x61,#1
	.dbline 45
; 	motor_set_speed(speed);
	ldab #81
	stab 0x60
	.dbline -2
	.dbline 46
; 	temperature_init();
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
; 	stepper_init();
; 	buzzer_init();
; 	led_init();
; 	INTR_ON();
; 	
; 	temperature_start_sample();
	.dbline 53
; 		
	ldd _motor_enabled
	bne L5
	.dbline 53
	.dbline 54
; 	lcd_display_speed(speed);
	bra L4
L5:
	.dbline 57
; 	lcd_display_temperature(temperature);
; 
; 	// Note: the assigment says to have nothing in the main after initilization, but this doesn't make sense.
	ldd 2,x
	cpd #115
	bge L7
	ldd _desired_speed
	ble L7
	.dbline 57
	.dbline 58
; 	//	It is not proper to have terminal (eg. printf) and lcd outputs inside of the ISRs since those need to run quickly to avoid problems
	ldab #115
	stab 0xc3
	.dbline 59
	bra L8
L7:
	.dbline 59
; 	while ( 1 ) { 
	ldd 2,x
	cpd #200
	ble L9
	.dbline 59
	.dbline 60
; 		if ( key = keyboard_getchar() ) {
	ldab #200
	stab 0xc3
	.dbline 61
	bra L10
L9:
	.dbline 61
; 			if ( key == '0' ) {
	.dbline 62
; 				break;
	ldd 2,x
	stab 0xc3
	.dbline 63
; 			} else if ( key == 'E' ) {
L10:
L8:
	.dbline -2
	.dbline 64
; 				if ( speed < MOTOR_MAX_SPEED ) {
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
; 					++speed;
; 					motor_set_speed(speed);
; 					printf("Increasing speed to %d\n", speed);
	.dbline 68
; 				} else {
	bclr 0xa0,#0x80
	.dbline 69
; 					printf("Speed is maxed at %d, cannot increase.\n", speed);
	ldd #0
	std _motor_enabled
	.dbline -2
	.dbline 70
; 				}
L11:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e motor_enable _motor_enable fV
_motor_enable::
	.dbline -1
	.dbline 73
; 				lcd_display_speed(speed);
; 				lcd_display_temperature(temperature);
; 			} else if ( key == 'D' ) {
	.dbline 74
; 				if ( speed > MOTOR_MIN_SPEED ) {
	bset 0xa0,#128
	.dbline 75
; 					--speed;
	ldd #1
	std _motor_enabled
	.dbline -2
	.dbline 76
; 					motor_set_speed(speed);
L12:
	.dbline 0 ; func end
	rts
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/motor.c
L14:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/motor.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/motor.c
	.dbfunc e motor_update_speed _motor_update_speed fV
	.dbsym s count L14 I
;     diff_speed -> -2,x
_motor_update_speed::
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 79
; 					printf("Decreasing speed to %d\n", speed);
; 				} else {
; 					printf("Speed is at minimum, at %d, cannot decrease.\n", speed);
	.dbline 81
; 				}
; 				lcd_display_speed(speed);
	ldd #0
	std -2,x
	.dbline 84
; 				lcd_display_temperature(temperature);
; 			} else if ( key == '5' ) {
; 				trigger_collision();
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
; 			} else {
	ldd L14
	addd #1
	ldy #4
	exg x,y
	idivs
	exg x,y
	std L14
	.dbline 89
; 				printf("Pushed: %c\n", key);
; 			}
; 		}
; 		
	ldd L14
	bne L15
	.dbline 89
	.dbline 91
; 		if ( temperature_is_ready() ) {
; 			temperature = temperature_get();
	ldd #0
	std _motor_paca_count
	.dbline 92
; 			
L15:
	.dbline 96
; 			// Turn the heater on/off to get the desired temperature
; 			if ( temperature < DESIRED_TEMPERATURE ) {
; 				temperature_heater_on();
; 			} else {
	ldd _desired_speed
	subd _current_speed
	std -2,x
	.dbline 97
; 				temperature_heater_off();
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
; 			}
	ldd #130
	jsr _motor_set_duty
	.dbline 99
	bra L18
L17:
	.dbline 99
; 			
	ldd -2,x
	ble L19
	.dbline 99
	.dbline 100
; 			// Update LCD if the temperature has changed
	; vol
	ldab 0xc3
	clra
	addd #1
	jsr _motor_set_duty
	.dbline 101
	bra L20
L19:
	.dbline 101
; 			if ( temperature != previous_temperature ) {
	ldd -2,x
	bge L21
	.dbline 101
	.dbline 102
; 				previous_temperature = temperature;
	; vol
	ldab 0xc3
	clra
	subd #1
	jsr _motor_set_duty
	.dbline 103
; 				printf("Temperature is %d F\n", temperature);
L21:
L20:
L18:
	.dbline -2
	.dbline 105
; 				lcd_display_speed(speed);
; 				lcd_display_temperature(temperature);
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
; 			}			
; 		}		
; 	}
	.dbline 109
; 	
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
; 	return 0;
; }
; 
; void rti_each()
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
; 
; void rti_each_quarter()
; {
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
; 	motor_update_speed();
; }
; 
; void rti_each_half()
	.dbline 122
; {}
	ldd _motor_paca_count
	addd #1
	std _motor_paca_count
	.dbline 123
; 
	bset 0x61,#1
	.dbline -2
	.dbline 124
; void rti_each_second()
L28:
	.dbline 0 ; func end
	rti
	.dbend
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/rti.c
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
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/rti.c
L31:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/rti.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/rti.c
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
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/rti.c
_key:
	.blkb 1
	.area idata
	.byte 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/rti.c
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/keyboard.c
	.dbsym s key _key c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/keyboard.c
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
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/keyboard.c
L40:
	.blkb 2
	.area idata
	.byte 49,50
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 51,'A
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 52,53
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 54,'B
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 55,56
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 57,'C
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 'E,48
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/keyboard.c
	.blkb 2
	.area idata
	.byte 'F,'D
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/keyboard.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/keyboard.c
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
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/lcd.c
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
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/lcd.c
_temperature_value:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/lcd.c
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/temperature.c
	.dbsym s temperature_value _temperature_value I
_temperature_ready:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/temperature.c
	.dbsym s temperature_ready _temperature_ready I
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/temperature.c
	.dbfunc e temperature_init _temperature_init fV
_temperature_init::
	.dbline -1
	.dbline 20
	.dbline 21
	ldd #0
	std _temperature_ready
	.dbline 26
	ldab #250
	stab 0x82
	.dbline 29
	clr 0x83
	.dbline 33
	ldab #96
	stab 0x84
	.dbline 36
	bset 0x252,#128
	.dbline -2
	.dbline 37
L67:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e temperature_start_sample _temperature_start_sample fV
_temperature_start_sample::
	.dbline -1
	.dbline 43
	.dbline 46
	ldd #0
	std _temperature_ready
	.dbline 47
	ldab #134
	stab 0x85
	.dbline -2
	.dbline 48
L68:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e temperature_is_ready _temperature_is_ready fI
;          ?temp -> -2,x
_temperature_is_ready::
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 54
	.dbline 55
	ldd _temperature_ready
	beq L71
	ldd #1
	std -2,x
	bra L72
L71:
	ldd #0
	std -2,x
L72:
	ldd -2,x
	.dbline -2
L69:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e temperature_get _temperature_get fI
_temperature_get::
	.dbline -1
	.dbline 62
	.dbline 63
	ldd #0
	std _temperature_ready
	.dbline 64
	ldd _temperature_value
	.dbline -2
L73:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e temperature_heater_on _temperature_heater_on fV
_temperature_heater_on::
	.dbline -1
	.dbline 71
	.dbline 72
	bset 0x250,#128
	.dbline -2
	.dbline 73
L74:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e temperature_heater_off _temperature_heater_off fV
_temperature_heater_off::
	.dbline -1
	.dbline 79
	.dbline 80
	bclr 0x250,#0x80
	.dbline -2
	.dbline 81
L75:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e temperature_isr _temperature_isr fV
_temperature_isr::
	.dbline -1
	.dbline 88
	.dbline 89
	; vol
	ldd 0x9c
	anda #3
	andb #255
	lsrd
	lsrd
	lsrd
	subd #5
	std _temperature_value
	.dbline 90
	ldd #1
	std _temperature_ready
	.dbline -2
	.dbline 91
L76:
	.dbline 0 ; func end
	rti
	.dbend
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/stepper.c
	.dbfunc e stepper_turn_cw _stepper_turn_cw fV
;          steps -> 2,x
_stepper_turn_cw::
	pshd
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 19
	.dbline 20
	jsr _stepper_init
	.dbline 21
	bra L81
L78:
	.dbline 21
	.dbline 22
	ldd 2,x
	ldy #4
	exg x,y
	idivs
	exg x,y
	std -2,x
	ldd #3
	subd -2,x
	jsr _stepper_set_step
	.dbline 23
L79:
	.dbline 21
	ldd 2,x
	subd #1
	std 2,x
L81:
	.dbline 21
	ldd 2,x
	bgt L78
	.dbline -2
	.dbline 24
L77:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l steps 2 I
	.dbend
	.dbfunc e stepper_turn_ccw _stepper_turn_ccw fV
;          steps -> 2,x
_stepper_turn_ccw::
	pshd
	pshx
	tfr s,x
	.dbline -1
	.dbline 30
	.dbline 31
	jsr _stepper_init
	.dbline 32
	bra L86
L83:
	.dbline 32
	.dbline 33
	ldd 2,x
	ldy #4
	exg x,y
	idivs
	exg x,y
	jsr _stepper_set_step
	.dbline 34
L84:
	.dbline 32
	ldd 2,x
	subd #1
	std 2,x
L86:
	.dbline 32
	ldd 2,x
	bgt L83
	.dbline -2
	.dbline 35
L82:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l steps 2 I
	.dbend
	.dbfunc s stepper_set_step _stepper_set_step fV
;     coded_step -> -2,x
;           step -> 2,x
_stepper_set_step:
	pshd
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 41
	.dbline 42
	ldd #0
	std -2,x
	.dbline 45
	ldd 2,x
	cpd #2
	bne L88
	.dbline 45
	.dbline 46
	ldd #3
	std -2,x
	.dbline 47
	bra L89
L88:
	.dbline 47
	ldd 2,x
	cpd #3
	bne L90
	.dbline 47
	.dbline 48
	ldd #2
	std -2,x
	.dbline 49
	bra L91
L90:
	.dbline 49
	.dbline 50
	movw 2,x,-2,x
	.dbline 51
L91:
L89:
	.dbline 54
	ldd -2,x
	lsld
	lsld
	lsld
	lsld
	lsld
	std -4,x
	; vol
	ldab 0x240
	clra
	anda #255
	andb #159
	ora -4,x
	orb -3,x
	stab 0x240
	.dbline 59
	ldd #0xf000
	jsr _stepper_delay
	.dbline -2
	.dbline 60
L87:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l coded_step -2 I
	.dbsym l step 2 I
	.dbend
	.dbfunc s stepper_init _stepper_init fV
_stepper_init:
	.dbline -1
	.dbline 66
	.dbline 67
	bset 0x25a,#32
	.dbline 68
	bset 0x242,#96
	.dbline 69
	bset 0x258,#32
	.dbline -2
	.dbline 70
L92:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc s stepper_delay _stepper_delay fV
;          delay -> 2,x
_stepper_delay:
	pshd
	pshx
	tfr s,x
	.dbline -1
	.dbline 76
	.dbline 77
	bra L97
L94:
	.dbline 77
	.dbline 77
L95:
	.dbline 77
	ldd 2,x
	subd #1
	std 2,x
L97:
	.dbline 77
	ldd 2,x
	bne L94
	.dbline -2
	.dbline 78
L93:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l delay 2 i
	.dbend
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/buzzer.c
	.dbfunc e buzzer_init _buzzer_init fV
_buzzer_init::
	.dbline -1
	.dbline 10
	.dbline 11
	bset 0x33,#32
	.dbline -2
	.dbline 12
L98:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e buzzer_on _buzzer_on fV
_buzzer_on::
	.dbline -1
	.dbline 15
	.dbline 16
	bset 0x32,#32
	.dbline -2
	.dbline 17
L99:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e buzzer_off _buzzer_off fV
_buzzer_off::
	.dbline -1
	.dbline 20
	.dbline 21
	bclr 0x32,#0x20
	.dbline -2
	.dbline 22
L100:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/led.c
	.dbfunc e led_init _led_init fV
_led_init::
	.dbline -1
	.dbline 13
	.dbline 14
	bset 0x33,#15
	.dbline -2
	.dbline 15
L101:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e led_all_off _led_all_off fV
_led_all_off::
	.dbline -1
	.dbline 18
	.dbline 19
	bclr 0x32,#0xf
	.dbline -2
	.dbline 20
L102:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e led_red_on _led_red_on fV
_led_red_on::
	.dbline -1
	.dbline 23
	.dbline 24
	bset 0x32,#1
	.dbline -2
	.dbline 25
L103:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e led_yellow_on _led_yellow_on fV
_led_yellow_on::
	.dbline -1
	.dbline 28
	.dbline 29
	bset 0x32,#2
	.dbline -2
	.dbline 30
L104:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e led_orange_on _led_orange_on fV
_led_orange_on::
	.dbline -1
	.dbline 33
	.dbline 34
	bset 0x32,#4
	.dbline -2
	.dbline 35
L105:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e led_green_on _led_green_on fV
_led_green_on::
	.dbline -1
	.dbline 38
	.dbline 39
	bset 0x32,#8
	.dbline -2
	.dbline 40
L106:
	.dbline 0 ; func end
	rts
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/led.c
_collision_detected::
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1/../lib/led.c
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1\assign54.c
	.dbsym e collision_detected _collision_detected I
_speed::
	.blkb 2
	.area idata
	.word 30
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1\assign54.c
	.dbsym e speed _speed I
_temperature::
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1\assign54.c
	.dbsym e temperature _temperature I
_direction::
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1\assign54.c
	.dbsym e direction _direction I
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1\assign54.c
	.dbfunc e main _main fI
;          ?temp -> -4,x
; previous_temperature -> -3,x
;            key -> -1,x
_main::
	pshx
	tfr s,x
	leas -6,sp
	.dbline -1
	.dbline 34
	.dbline 35
	ldd #0
	std -3,x
	.dbline 39
	ldd #26
	jsr _setbaud
	.dbline 41
	jsr _keyboard_init
	.dbline 42
	jsr _lcd_init
	.dbline 43
	jsr _motor_init
	.dbline 44
	jsr _rti_init
	.dbline 45
	ldd _speed
	jsr _motor_set_speed
	.dbline 46
	jsr _temperature_init
	.dbline 47
	jsr _stepper_init
	.dbline 48
	jsr _buzzer_init
	.dbline 49
	jsr _led_init
	.dbline 50
		cli

	.dbline 52
	jsr _temperature_start_sample
	.dbline 54
	ldd _speed
	jsr _lcd_display_speed
	.dbline 55
	ldd _temperature
	jsr _lcd_display_temperature
	lbra L109
L108:
	.dbline 59
	.dbline 60
	jsr _keyboard_getchar
	stab -4,x
	movb -4,x,-1,x
	tst -4,x
	lbeq L111
	.dbline 60
	.dbline 61
	ldab -1,x
	cmpb #48
	bne L113
	.dbline 61
	.dbline 62
	lbra L110
L113:
	.dbline 63
	ldab -1,x
	cmpb #69
	bne L115
	.dbline 63
	.dbline 64
	ldd _speed
	cpd #30
	bge L117
	.dbline 64
	.dbline 65
	ldd _speed
	addd #1
	std _speed
	.dbline 66
	ldd _speed
	jsr _motor_set_speed
	.dbline 67
	movw _speed,0,sp
	ldd #L119
	jsr _printf
	.dbline 68
	bra L118
L117:
	.dbline 68
	.dbline 69
	movw _speed,0,sp
	ldd #L120
	jsr _printf
	.dbline 70
L118:
	.dbline 71
	ldd _speed
	jsr _lcd_display_speed
	.dbline 72
	ldd _temperature
	jsr _lcd_display_temperature
	.dbline 73
	bra L116
L115:
	.dbline 73
	ldab -1,x
	cmpb #68
	bne L121
	.dbline 73
	.dbline 74
	ldd _speed
	ble L123
	.dbline 74
	.dbline 75
	ldd _speed
	subd #1
	std _speed
	.dbline 76
	ldd _speed
	jsr _motor_set_speed
	.dbline 77
	movw _speed,0,sp
	ldd #L125
	jsr _printf
	.dbline 78
	bra L124
L123:
	.dbline 78
	.dbline 79
	movw _speed,0,sp
	ldd #L126
	jsr _printf
	.dbline 80
L124:
	.dbline 81
	ldd _speed
	jsr _lcd_display_speed
	.dbline 82
	ldd _temperature
	jsr _lcd_display_temperature
	.dbline 83
	bra L122
L121:
	.dbline 83
	ldab -1,x
	cmpb #53
	bne L127
	.dbline 83
	.dbline 84
	jsr _trigger_collision
	.dbline 85
	bra L128
L127:
	.dbline 85
	.dbline 86
	ldab -1,x
	clra
	std 0,sp
	ldd #L129
	jsr _printf
	.dbline 87
L128:
L122:
L116:
	.dbline 88
L111:
	.dbline 90
	jsr _temperature_is_ready
	cpd #0
	beq L130
	.dbline 90
	.dbline 91
	jsr _temperature_get
	std _temperature
	.dbline 94
	ldd _temperature
	cpd #100
	bge L132
	.dbline 94
	.dbline 95
	jsr _temperature_heater_on
	.dbline 96
	bra L133
L132:
	.dbline 96
	.dbline 97
	jsr _temperature_heater_off
	.dbline 98
L133:
	.dbline 101
	ldd _temperature
	cpd -3,x
	beq L134
	.dbline 101
	.dbline 102
	movw _temperature,-3,x
	.dbline 103
	movw _temperature,0,sp
	ldd #L136
	jsr _printf
	.dbline 104
	ldd _speed
	jsr _lcd_display_speed
	.dbline 105
	ldd _temperature
	jsr _lcd_display_temperature
	.dbline 106
L134:
	.dbline 107
L130:
	.dbline 108
L109:
	.dbline 59
	lbra L108
L110:
	.dbline 110
	ldd #0
	.dbline -2
L107:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l previous_temperature -3 I
	.dbsym l key -1 c
	.dbend
	.dbfunc e rti_each _rti_each fV
_rti_each::
	.dbline -1
	.dbline 114
	.dbline -2
	.dbline 114
L137:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e rti_each_quarter _rti_each_quarter fV
_rti_each_quarter::
	.dbline -1
	.dbline 117
	.dbline 118
	jsr _motor_update_speed
	.dbline -2
	.dbline 119
L138:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e rti_each_half _rti_each_half fV
_rti_each_half::
	.dbline -1
	.dbline 122
	.dbline -2
	.dbline 122
L139:
	.dbline 0 ; func end
	rts
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1\assign54.c
L141:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1\assign54.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1\assign54.c
	.dbfunc e rti_each_second _rti_each_second fV
	.dbsym s count L141 I
_rti_each_second::
	.dbline -1
	.dbline 125
; {
	.dbline 127
; 	static int count = 0;
; 	count = (count + 1) % 8;
	ldd L141
	addd #1
	ldy #8
	exg x,y
	idivs
	exg x,y
	std L141
	.dbline 129
; 	
; 	collision_avoidance();
	jsr _collision_avoidance
	.dbline 131
; 	
; 	if ( count == 0 ) {
	ldd L141
	bne L142
	.dbline 131
	.dbline 132
; 		temperature_start_sample(); // Start a new sample
	jsr _temperature_start_sample
	.dbline 133
; 	}
L142:
	.dbline 135
; 	
; 	led_all_off();
	jsr _led_all_off
	.dbline 136
	ldd _direction
	beq L146
	ldd _direction
	cpd #1
	beq L147
	ldd _direction
	cpd #2
	beq L148
	ldd _direction
	cpd #3
	beq L149
	bra L144
X4:
	.dbline 136
; 	switch (direction) {
L146:
	.dbline 138
; 		case DIRECTION_NORTH:
; 			led_red_on();
	jsr _led_red_on
	.dbline 139
; 			break;
	bra L145
L147:
	.dbline 141
; 		case DIRECTION_EAST:
; 			led_yellow_on();
	jsr _led_yellow_on
	.dbline 142
; 			break;
	bra L145
L148:
	.dbline 144
; 		case DIRECTION_SOUTH:
; 			led_green_on();
	jsr _led_green_on
	.dbline 145
; 			break;
	bra L145
L149:
	.dbline 147
; 		case DIRECTION_WEST:
; 			led_orange_on();
	jsr _led_orange_on
	.dbline 148
; 			break;
L144:
L145:
	.dbline -2
	.dbline 151
; 	}
; 	
; }
L140:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e trigger_collision _trigger_collision fV
_trigger_collision::
	.dbline -1
	.dbline 157
; 
; /*
; 	Simulate a collision warning
; */
; void trigger_collision()
; {
	.dbline 158
; 	collision_detected = 1;
	ldd #1
	std _collision_detected
	.dbline -2
	.dbline 159
; }
L150:
	.dbline 0 ; func end
	rts
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1\assign54.c
L152:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1\assign54.c
L153:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1\assign54.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART4~1\assign54.c
	.dbfunc e collision_avoidance _collision_avoidance fV
	.dbsym s state L153 I
	.dbsym s seconds L152 I
;          ?temp -> -4,x
;          ?temp -> -2,x
_collision_avoidance::
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 166
; 
; 
; /*
; 	This is executes the algorithm provided in the labs to avoid a collision
; */
; void collision_avoidance()
; {
	.dbline 175
; 	#define COLLISION_AVOID_STATE_INITIAL	0
; 	#define COLLISION_AVOID_STATE_WAIT		1
; 	#define COLLISION_AVOID_STATE_ROTATE90	2
; 	#define COLLISION_AVOID_STATE_CONTINUE	3
; 
; 	static int seconds = 0;
; 	static int state = 0;
; 	
; 	if ( collision_detected ) {
	ldd _collision_detected
	lbeq L154
	.dbline 175
	.dbline 176
	ldd L153
	beq L158
	ldd L153
	cpd #1
	beq L160
	ldd L153
	cpd #2
	beq L164
	lbra L156
X5:
	.dbline 176
; 		switch ( state ) {
L158:
	.dbline 178
; 			case COLLISION_AVOID_STATE_INITIAL:
; 				buzzer_on();
	jsr _buzzer_on
	.dbline 179
; 				motor_disable(); // we would stop the forward motors here
	jsr _motor_disable
	.dbline 180
; 				printf("\n\nCollision warning!!\nStopping motors.\n");
	ldd #L159
	jsr _printf
	.dbline 181
; 				seconds = 0;
	ldd #0
	std L152
	.dbline 182
; 				state = COLLISION_AVOID_STATE_WAIT;
	ldd #1
	std L153
	.dbline 183
; 				break;
	lbra L155
L160:
	.dbline 186
; 			case COLLISION_AVOID_STATE_WAIT:
; 				// wait 2 seconds before changing to next state (total time will be 3 second wait)
; 				buzzer_off();
	jsr _buzzer_off
	.dbline 187
; 				printf("Waiting for motors to be stopped\n");
	ldd #L161
	jsr _printf
	.dbline 188
; 				if ( ++seconds >= 2 ) {
	ldd L152
	addd #1
	std -2,x
	movw -2,x,L152
	ldd -2,x
	cpd #2
	lblt L155
	.dbline 188
	.dbline 189
; 					seconds = 0;
	ldd #0
	std L152
	.dbline 190
; 					state = COLLISION_AVOID_STATE_ROTATE90;
	ldd #2
	std L153
	.dbline 191
; 				}
	.dbline 192
; 				break;
	bra L155
L164:
	.dbline 194
; 			case COLLISION_AVOID_STATE_ROTATE90:
; 				if ( seconds == 0 ) {
	ldd L152
	bne L165
	.dbline 194
	.dbline 195
; 					printf("Rotating 90 degrees to the right.\n");
	ldd #L167
	jsr _printf
	.dbline 196
; 					stepper_turn_cw(STEPPER_STEPS_PER_QUARTER);
	ldd #5
	jsr _stepper_turn_cw
	.dbline 197
	bra L166
L165:
	.dbline 197
; 				} else {
	.dbline 198
; 					printf("Waiting another second.\n");
	ldd #L168
	jsr _printf
	.dbline 199
; 				}
L166:
	.dbline 201
; 				
; 				if ( ++seconds >= 2 ) {
	ldd L152
	addd #1
	std -4,x
	movw -4,x,L152
	ldd -4,x
	cpd #2
	blt L155
	.dbline 201
	.dbline 203
; 					// Go back into initial state and reset collision detection
; 					seconds = 0;
	ldd #0
	std L152
	.dbline 204
; 					state = COLLISION_AVOID_STATE_INITIAL;
	ldd #0
	std L153
	.dbline 205
; 					collision_detected = 0;
	ldd #0
	std _collision_detected
	.dbline 206
; 					direction = (direction + 1) % 4; // update the direction
	ldd _direction
	addd #1
	ldy #4
	exg x,y
	idivs
	exg x,y
	std _direction
	.dbline 207
; 					motor_enable(); // We would start the forward motors here
	jsr _motor_enable
	.dbline 208
; 				}
	.dbline 209
; 				break;
	bra L155
L156:
	.dbline 211
; 			default:
; 				printf("Unknown collision state, return to initial.\n");
	ldd #L171
	jsr _printf
	.dbline 212
; 				seconds = 0;
	ldd #0
	std L152
	.dbline 213
; 				state = COLLISION_AVOID_STATE_INITIAL;
	ldd #0
	std L153
	.dbline 214
; 				collision_detected = 0;
	ldd #0
	std _collision_detected
	.dbline 215
; 		}
	.dbline 216
L154:
	.dbline 216
	.dbline 218
L155:
	.dbline -2
	.dbline 219
; 	} else {
; 		//printf("No collisions detected\n");
; 	}
; }
L151:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbend
L171:
	.byte 'U,'n,'k,'n,'o,'w,'n,32,'c,'o,'l,'l,'i,'s,'i,'o
	.byte 'n,32,'s,'t,'a,'t,'e,44,32,'r,'e,'t,'u,'r,'n,32
	.byte 't,'o,32,'i,'n,'i,'t,'i,'a,'l,46,10,0
L168:
	.byte 'W,'a,'i,'t,'i,'n,'g,32,'a,'n,'o,'t,'h,'e,'r,32
	.byte 's,'e,'c,'o,'n,'d,46,10,0
L167:
	.byte 'R,'o,'t,'a,'t,'i,'n,'g,32,57,48,32,'d,'e,'g,'r
	.byte 'e,'e,'s,32,'t,'o,32,'t,'h,'e,32,'r,'i,'g,'h,'t
	.byte 46,10,0
L161:
	.byte 'W,'a,'i,'t,'i,'n,'g,32,'f,'o,'r,32,'m,'o,'t,'o
	.byte 'r,'s,32,'t,'o,32,'b,'e,32,'s,'t,'o,'p,'p,'e,'d
	.byte 10,0
L159:
	.byte 10,10,'C,'o,'l,'l,'i,'s,'i,'o,'n,32,'w,'a,'r,'n
	.byte 'i,'n,'g,33,33,10,'S,'t,'o,'p,'p,'i,'n,'g,32,'m
	.byte 'o,'t,'o,'r,'s,46,10,0
L136:
	.byte 'T,'e,'m,'p,'e,'r,'a,'t,'u,'r,'e,32,'i,'s,32,37
	.byte 'd,32,'F,10,0
L129:
	.byte 'P,'u,'s,'h,'e,'d,58,32,37,'c,10,0
L126:
	.byte 'S,'p,'e,'e,'d,32,'i,'s,32,'a,'t,32,'m,'i,'n,'i
	.byte 'm,'u,'m,44,32,'a,'t,32,37,'d,44,32,'c,'a,'n,'n
	.byte 'o,'t,32,'d,'e,'c,'r,'e,'a,'s,'e,46,10,0
L125:
	.byte 'D,'e,'c,'r,'e,'a,'s,'i,'n,'g,32,'s,'p,'e,'e,'d
	.byte 32,'t,'o,32,37,'d,10,0
L120:
	.byte 'S,'p,'e,'e,'d,32,'i,'s,32,'m,'a,'x,'e,'d,32,'a
	.byte 't,32,37,'d,44,32,'c,'a,'n,'n,'o,'t,32,'i,'n,'c
	.byte 'r,'e,'a,'s,'e,46,10,0
L119:
	.byte 'I,'n,'c,'r,'e,'a,'s,'i,'n,'g,32,'s,'p,'e,'e,'d
	.byte 32,'t,'o,32,37,'d,10,0
L66:
	.byte 'T,'e,'m,'p,'e,'r,'a,'t,'u,'r,'e,58,37,'d,'F,0
L64:
	.byte 'S,'p,'e,'e,'d,58,32,37,'d,0
