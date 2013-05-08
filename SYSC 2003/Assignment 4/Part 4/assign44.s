	.module assign44.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1/../lib/keyboard.c
	.dbfunc s keyboard_init _keyboard_init fV
_keyboard_init:
	.dbline -1
	.dbline 19
; // By Korey Conway and Tanzeel Rana
; 
; #include <hcs12dp256.h>
; #include <stdio.h>
; #include "../lib/keyboard.c"
; #include "../lib/stepper.c"
; #include "../lib/lcd.c"
; 
; #define RTI_CTL	0x7F // run real-time interrupt at 8Hz
; #define RTI_FREQUENCY	8
; 
; void rti_init(void);
; void rti_handler(void);
; void rti_every_second(void);
; void trigger_collision(void);
; void collision_avoidance(void);
; 
; // Global variables
; int collision_detected = 0;
	.dbline 20
; int temperature = 0;
	clr 0xf0
	.dbline 21
; 
	ldab #15
	stab 0x25a
	.dbline 22
; void lcd_display_speed(int speed);
	bclr 0x262,#0xf0
	.dbline 23
; void lcd_display_temperature(int temp);
	bset 0x262,#8
	.dbline -2
	.dbline 24
; 
L3:
	.dbline 0 ; func end
	rts
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1/../lib/keyboard.c
L5:
	.blkb 2
	.area idata
	.word -1
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1/../lib/keyboard.c
L6:
	.blkb 2
	.area idata
	.word -1
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1/../lib/keyboard.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1/../lib/keyboard.c
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
; int speed = 45;
; int temp  = 31;
; 
; int main()
; {
; 	char key;
	.dbline 33
; 
; 	// Initialization
; 	setbaud(BAUD19K);
	ldd #0
	std -2,x
	.dbline 34
; 	lcd_init();
	ldd #0
	std -4,x
	.dbline 36
; 	rti_init();	
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
; 	// Initial lcd display
; 	lcd_display_speed(speed);
; 	lcd_display_temperature(temp);
; 	
; 	while ( 1 ) {
	jsr _keyboard_init
	lbra L9
L8:
	.dbline 43
; 		key = keyboard_getchar();
; 		
	.dbline 44
; 		if ( key == '0' ) {
	bset 0x250,#8
	.dbline 45
; 			printf("Finished running\n");
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
; 			break;
	bclr 0x250,#0x8
	.dbline 48
; 		} else if ( key == 'E' ) {
; 			++speed;
	jsr _keyboard_get_column
	std -4,x
	.dbline 51
; 			printf("Increasing speed to %d\n", speed);
; 			lcd_display_speed(speed);
; 			lcd_display_temperature(temp); // Need to redisplay bottom line for some reason
	ldd -4,x
	cpd #-1
	beq L11
	.dbline 51
	.dbline 52
; 		} else if ( key == 'D' ) {
	ldd L5
	cpd -2,x
	bne L13
	ldd L6
	cpd -4,x
	bne L13
	.dbline 52
	.dbline 53
; 			--speed;
	ldd #0xf000
	jsr _keyboard_delay
	.dbline 54
	bra L14
L13:
	.dbline 54
; 			printf("Decreasing speed to %d\n", speed);
	.dbline 55
; 			lcd_display_speed(speed);
	ldd #20480
	jsr _keyboard_delay
	.dbline 56
; 			lcd_display_temperature(temp); // Need to redisplay bottom line for some reason
L14:
	.dbline 59
; 		} else if ( key == '5' ) {
; 			printf("Triggering collision\n");
; 			trigger_collision();
	jsr _keyboard_get_column
	std -22,x
	ldd -4,x
	cpd -22,x
	bne L12
	.dbline 59
	.dbline 61
; 		} else {
; 			printf("Key pressed: %c\n", key);
	movw -2,x,L5
	.dbline 62
; 		}
	movw -4,x,L6
	.dbline 63
; 	}
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
; 	return 0;
	ldd -2,x
	cpd L5
	bne L17
	.dbline 65
	.dbline 67
; }
; 
	ldd #-1
	std L6
	.dbline 68
; void lcd_display_speed(int speed)
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
; {
; 	char *string;
; 	sprintf(string, "Speed: %d", speed);
; 	lcd_print_top(string);
; }
; 
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
; void lcd_display_temperature(int temp)
; {
; 	char *string;
; 	sprintf(string, "Temperature: %dC", temp);
; 	lcd_print_bottom(string);
; }
; 
; /*
	.dbline 83
; 	Initialize the real-time interrupt
	ldd #0
	std -2,x
	.dbline 84
; */
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
; void rti_init()
; {
; 	CRGINT |= 0x80;
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
; 	RTICTL = 0x7F; // runs at 8Hz
; 	asm("cli");
; }
; 
	.dbline 92
; /*
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
; 	The RTI handler. For now this simply calls rti_every_second() every second
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
; */
; #pragma interrupt_handler rti_handler
; void rti_handler()
; {
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
; 	static int count = 0;
; 	
; 	if ( ++count == RTI_FREQUENCY ) {
; 		count = 0;
; 		rti_every_second();
; 	}
; 	
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
; 	// Clear the interrupt
	ldd 2,x
	bne L29
	.dbline -2
	.dbline 106
; 	CRGFLG |= 0x80;
L28:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l delay 2 i
	.dbend
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1/../lib/stepper.c
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
	bra L37
L34:
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
L35:
	.dbline 21
	ldd 2,x
	subd #1
	std 2,x
L37:
	.dbline 21
	ldd 2,x
	bgt L34
	.dbline -2
	.dbline 24
L33:
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
	bra L42
L39:
	.dbline 32
	.dbline 33
	ldd 2,x
	ldy #4
	exg x,y
	idivs
	exg x,y
	jsr _stepper_set_step
	.dbline 34
L40:
	.dbline 32
	ldd 2,x
	subd #1
	std 2,x
L42:
	.dbline 32
	ldd 2,x
	bgt L39
	.dbline -2
	.dbline 35
L38:
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
	bne L44
	.dbline 45
	.dbline 46
	ldd #3
	std -2,x
	.dbline 47
	bra L45
L44:
	.dbline 47
	ldd 2,x
	cpd #3
	bne L46
	.dbline 47
	.dbline 48
	ldd #2
	std -2,x
	.dbline 49
	bra L47
L46:
	.dbline 49
	.dbline 50
	movw 2,x,-2,x
	.dbline 51
L47:
L45:
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
L43:
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
L48:
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
	bra L53
L50:
	.dbline 77
	.dbline 77
L51:
	.dbline 77
	ldd 2,x
	subd #1
	std 2,x
L53:
	.dbline 77
	ldd 2,x
	bne L50
	.dbline -2
	.dbline 78
L49:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l delay 2 i
	.dbend
	.include 'basicLCD.s'

	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1/../lib/lcd.c
	.dbfunc e lcd_init _lcd_init fV
_lcd_init::
	.dbline -1
	.dbline 21
	.dbline 22
	jsr _Lcd2PP_Init
	.dbline -2
	.dbline 23
L54:
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
	bra L57
L56:
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
L57:
	.dbline 38
	ldy 2,x
	tst 0,y
	bne L56
	.dbline -2
	.dbline 41
L55:
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
L59:
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
L60:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l string 2 pc
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1/../lib/lcd.c
_collision_detected::
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1/../lib/lcd.c
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1\assign44.c
	.dbsym e collision_detected _collision_detected I
_temperature::
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1\assign44.c
	.dbsym e temperature _temperature I
_speed::
	.blkb 2
	.area idata
	.word 45
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1\assign44.c
	.dbsym e speed _speed I
_temp::
	.blkb 2
	.area idata
	.word 31
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1\assign44.c
	.dbsym e temp _temp I
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1\assign44.c
	.dbfunc e main _main fI
;            key -> -1,x
_main::
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 29
	.dbline 33
	ldd #26
	jsr _setbaud
	.dbline 34
	jsr _lcd_init
	.dbline 35
	jsr _rti_init
	.dbline 38
	ldd _speed
	jsr _lcd_display_speed
	.dbline 39
	ldd _temp
	jsr _lcd_display_temperature
	lbra L63
L62:
	.dbline 41
	.dbline 42
	jsr _keyboard_getchar
	stab -1,x
	.dbline 44
	ldab -1,x
	cmpb #48
	bne L65
	.dbline 44
	.dbline 45
	ldd #L67
	jsr _printf
	.dbline 46
	bra L64
L65:
	.dbline 47
	ldab -1,x
	cmpb #69
	bne L68
	.dbline 47
	.dbline 48
	ldd _speed
	addd #1
	std _speed
	.dbline 49
	movw _speed,0,sp
	ldd #L70
	jsr _printf
	.dbline 50
	ldd _speed
	jsr _lcd_display_speed
	.dbline 51
	ldd _temp
	jsr _lcd_display_temperature
	.dbline 52
	bra L69
L68:
	.dbline 52
	ldab -1,x
	cmpb #68
	bne L71
	.dbline 52
	.dbline 53
	ldd _speed
	subd #1
	std _speed
	.dbline 54
	movw _speed,0,sp
	ldd #L73
	jsr _printf
	.dbline 55
	ldd _speed
	jsr _lcd_display_speed
	.dbline 56
	ldd _temp
	jsr _lcd_display_temperature
	.dbline 57
	bra L72
L71:
	.dbline 57
	ldab -1,x
	cmpb #53
	bne L74
	.dbline 57
	.dbline 58
	ldd #L76
	jsr _printf
	.dbline 59
	jsr _trigger_collision
	.dbline 60
	bra L75
L74:
	.dbline 60
	.dbline 61
	ldab -1,x
	clra
	std 0,sp
	ldd #L77
	jsr _printf
	.dbline 62
L75:
L72:
L69:
	.dbline 63
L63:
	.dbline 41
	lbra L62
L64:
	.dbline 65
	ldd #0
	.dbline -2
L61:
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
	.dbline 69
	.dbline 71
	movw 2,x,2,sp
	ldd #L79
	std 0,sp
	ldd -2,x
	jsr _sprintf
	.dbline 72
	ldd -2,x
	jsr _lcd_print_top
	.dbline -2
	.dbline 73
L78:
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
	.dbline 76
	.dbline 78
	movw 2,x,2,sp
	ldd #L81
	std 0,sp
	ldd -2,x
	jsr _sprintf
	.dbline 79
	ldd -2,x
	jsr _lcd_print_bottom
	.dbline -2
	.dbline 80
L80:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l string -2 pc
	.dbsym l temp 2 I
	.dbend
	.dbfunc e rti_init _rti_init fV
_rti_init::
	.dbline -1
	.dbline 86
	.dbline 87
	bset 0x38,#128
	.dbline 88
	ldab #127
	stab 0x3b
	.dbline 89
		cli

	.dbline -2
	.dbline 90
L82:
	.dbline 0 ; func end
	rts
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1\assign44.c
L84:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1\assign44.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1\assign44.c
	.dbfunc e rti_handler _rti_handler fV
	.dbsym s count L84 I
;          ?temp -> -2,x
_rti_handler::
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 97
	.dbline 100
	ldd L84
	addd #1
	std -2,x
	movw -2,x,L84
	ldd -2,x
	cpd #8
	bne L85
	.dbline 100
	.dbline 101
	ldd #0
	std L84
	.dbline 102
	jsr _rti_every_second
	.dbline 103
L85:
	.dbline 106
	bset 0x37,#128
	.dbline -2
	.dbline 107
; }
L83:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rti
	.dbend
	.dbfunc e trigger_collision _trigger_collision fV
_trigger_collision::
	.dbline -1
	.dbline 113
; 
; /*
; 	Simulate a collision warning
; */
; void trigger_collision()
; {
	.dbline 114
; 	collision_detected = 1;
	ldd #1
	std _collision_detected
	.dbline -2
	.dbline 115
; }
L87:
	.dbline 0 ; func end
	rts
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1\assign44.c
L89:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1\assign44.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1\assign44.c
	.dbfunc e rti_every_second _rti_every_second fV
	.dbsym s seconds L89 I
_rti_every_second::
	.dbline -1
	.dbline 121
; 
; /*
; 	This gets run every second
; */
; void rti_every_second()
; {
	.dbline 125
; 	static int seconds = 0;
; 	
; 	// Run the collision avoidance algorithm
; 	collision_avoidance();
	jsr _collision_avoidance
	.dbline -2
	.dbline 126
; }
L88:
	.dbline 0 ; func end
	rts
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1\assign44.c
L91:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1\assign44.c
L92:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1\assign44.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART4~1\assign44.c
	.dbfunc e collision_avoidance _collision_avoidance fV
	.dbsym s state L92 I
	.dbsym s seconds L91 I
;          ?temp -> -4,x
;          ?temp -> -2,x
_collision_avoidance::
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 132
; 
; /*
; 	This is executes the algorithm provided in the labs to avoid a collision
; */
; void collision_avoidance()
; {
	.dbline 141
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
	lbeq L93
	.dbline 141
	.dbline 142
	ldd L92
	beq L97
	ldd L92
	cpd #1
	beq L99
	ldd L92
	cpd #2
	beq L103
	lbra L95
X7:
	.dbline 142
; 		switch ( state ) {
L97:
	.dbline 145
; 			case COLLISION_AVOID_STATE_INITIAL:
; 				// we would stop the forward motors here
; 				printf("\n\nCollision warning!!\nStopping motors.\n");
	ldd #L98
	jsr _printf
	.dbline 146
; 				seconds = 0;
	ldd #0
	std L91
	.dbline 147
; 				state = COLLISION_AVOID_STATE_WAIT;
	ldd #1
	std L92
	.dbline 148
; 				break;
	lbra L94
L99:
	.dbline 151
; 			case COLLISION_AVOID_STATE_WAIT:
; 				// wait 2 seconds before changing to next state (total time will be 3 second wait)
; 				printf("Waiting for motors to be stopped\n");
	ldd #L100
	jsr _printf
	.dbline 152
; 				if ( ++seconds >= 2 ) {
	ldd L91
	addd #1
	std -2,x
	movw -2,x,L91
	ldd -2,x
	cpd #2
	blt L94
	.dbline 152
	.dbline 153
; 					seconds = 0;
	ldd #0
	std L91
	.dbline 154
; 					state = COLLISION_AVOID_STATE_ROTATE90;
	ldd #2
	std L92
	.dbline 155
; 				}
	.dbline 156
; 				break;
	bra L94
L103:
	.dbline 158
; 			case COLLISION_AVOID_STATE_ROTATE90:
; 				if ( seconds == 0 ) {
	ldd L91
	bne L104
	.dbline 158
	.dbline 159
; 					printf("Rotating 90 degrees to the right.\n");
	ldd #L106
	jsr _printf
	.dbline 160
; 					stepper_turn_cw(STEPPER_STEPS_PER_QUARTER);
	ldd #5
	jsr _stepper_turn_cw
	.dbline 161
	bra L105
L104:
	.dbline 161
; 				} else {
	.dbline 162
; 					printf("Waiting another second.\n");
	ldd #L107
	jsr _printf
	.dbline 163
; 				}
L105:
	.dbline 165
; 				
; 				if ( ++seconds >= 2 ) {
	ldd L91
	addd #1
	std -4,x
	movw -4,x,L91
	ldd -4,x
	cpd #2
	blt L94
	.dbline 165
	.dbline 167
; 					// Go back into initial state and reset collision detection
; 					seconds = 0;
	ldd #0
	std L91
	.dbline 168
; 					state = COLLISION_AVOID_STATE_INITIAL;
	ldd #0
	std L92
	.dbline 169
; 					collision_detected = 0;
	ldd #0
	std _collision_detected
	.dbline 172
; 					
; 					// We would start the forward motors here
; 				}
	.dbline 173
; 				break;
	bra L94
L95:
	.dbline 175
; 			default:
; 				printf("Unknown collision state, return to initial.\n");
	ldd #L110
	jsr _printf
	.dbline 176
; 				seconds = 0;
	ldd #0
	std L91
	.dbline 177
; 				state = COLLISION_AVOID_STATE_INITIAL;
	ldd #0
	std L92
	.dbline 178
; 				collision_detected = 0;
	ldd #0
	std _collision_detected
	.dbline 179
; 		}
	.dbline 180
	bra L94
L93:
	.dbline 180
	.dbline 181
	ldd #L111
	jsr _printf
	.dbline 182
L94:
	.dbline -2
	.dbline 183
; 	} else {
; 		printf("No collisions detected\n");
; 	}
; }
L90:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbend
L111:
	.byte 'N,'o,32,'c,'o,'l,'l,'i,'s,'i,'o,'n,'s,32,'d,'e
	.byte 't,'e,'c,'t,'e,'d,10,0
L110:
	.byte 'U,'n,'k,'n,'o,'w,'n,32,'c,'o,'l,'l,'i,'s,'i,'o
	.byte 'n,32,'s,'t,'a,'t,'e,44,32,'r,'e,'t,'u,'r,'n,32
	.byte 't,'o,32,'i,'n,'i,'t,'i,'a,'l,46,10,0
L107:
	.byte 'W,'a,'i,'t,'i,'n,'g,32,'a,'n,'o,'t,'h,'e,'r,32
	.byte 's,'e,'c,'o,'n,'d,46,10,0
L106:
	.byte 'R,'o,'t,'a,'t,'i,'n,'g,32,57,48,32,'d,'e,'g,'r
	.byte 'e,'e,'s,32,'t,'o,32,'t,'h,'e,32,'r,'i,'g,'h,'t
	.byte 46,10,0
L100:
	.byte 'W,'a,'i,'t,'i,'n,'g,32,'f,'o,'r,32,'m,'o,'t,'o
	.byte 'r,'s,32,'t,'o,32,'b,'e,32,'s,'t,'o,'p,'p,'e,'d
	.byte 10,0
L98:
	.byte 10,10,'C,'o,'l,'l,'i,'s,'i,'o,'n,32,'w,'a,'r,'n
	.byte 'i,'n,'g,33,33,10,'S,'t,'o,'p,'p,'i,'n,'g,32,'m
	.byte 'o,'t,'o,'r,'s,46,10,0
L81:
	.byte 'T,'e,'m,'p,'e,'r,'a,'t,'u,'r,'e,58,32,37,'d,'C
	.byte 0
L79:
	.byte 'S,'p,'e,'e,'d,58,32,37,'d,0
L77:
	.byte 'K,'e,'y,32,'p,'r,'e,'s,'s,'e,'d,58,32,37,'c,10
	.byte 0
L76:
	.byte 'T,'r,'i,'g,'g,'e,'r,'i,'n,'g,32,'c,'o,'l,'l,'i
	.byte 's,'i,'o,'n,10,0
L73:
	.byte 'D,'e,'c,'r,'e,'a,'s,'i,'n,'g,32,'s,'p,'e,'e,'d
	.byte 32,'t,'o,32,37,'d,10,0
L70:
	.byte 'I,'n,'c,'r,'e,'a,'s,'i,'n,'g,32,'s,'p,'e,'e,'d
	.byte 32,'t,'o,32,37,'d,10,0
L67:
	.byte 'F,'i,'n,'i,'s,'h,'e,'d,32,'r,'u,'n,'n,'i,'n,'g
	.byte 10,0
