	.module assign43b.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART3B~1/../lib/stepper.c
	.dbfunc e stepper_turn_cw _stepper_turn_cw fV
;          steps -> 2,x
_stepper_turn_cw::
	pshd
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 19
; // By Korey Conway and Tanzeel Rana
; 
; #include <hcs12dp256.h>
; #include <stdio.h>
; #include "../lib/stepper.c"
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
; int temperature = 0;
; 
	.dbline 20
	bra L7
L4:
	.dbline 20
	.dbline 21
	ldd 2,x
	ldy #4
	exg x,y
	idivs
	exg x,y
	std -2,x
	ldd #3
	subd -2,x
	jsr _stepper_set_step
	.dbline 22
L5:
	.dbline 20
	ldd 2,x
	subd #1
	std 2,x
L7:
	.dbline 20
; int main()
	ldd 2,x
	bgt L4
	.dbline -2
	.dbline 23
; {
; 	setbaud(BAUD19K);
; 	stepper_init();
L3:
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
	.dbline 29
; 	rti_init();
; 	
; 	temperature = 56; // not sure why we need a global temperature variable but the assignment asks for it
; 
; 	while ( 1 );
; 	return 0;
	.dbline 30
	bra L12
L9:
	.dbline 30
	.dbline 31
	ldd 2,x
	ldy #4
	exg x,y
	idivs
	exg x,y
	jsr _stepper_set_step
	.dbline 32
L10:
	.dbline 30
	ldd 2,x
	subd #1
	std 2,x
L12:
	.dbline 30
; }
	ldd 2,x
	bgt L9
	.dbline -2
	.dbline 33
; 
; /*
; 	Initialize the real-time interrupt
L8:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l steps 2 I
	.dbend
	.dbfunc e stepper_set_step _stepper_set_step fV
;     coded_step -> -2,x
;           step -> 2,x
_stepper_set_step::
	pshd
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 39
; */
; void rti_init()
; {
; 	CRGINT |= 0x80;
; 	RTICTL = 0x7F; // runs at 8Hz
; 	asm("cli");
	.dbline 40
; }
	ldd #0
	std -2,x
	.dbline 43
; 
; /*
; 	The RTI handler. For now this simply calls rti_every_second() every second
	ldd 2,x
	cpd #2
	bne L14
	.dbline 43
	.dbline 44
; */
	ldd #3
	std -2,x
	.dbline 45
	bra L15
L14:
	.dbline 45
; #pragma interrupt_handler rti_handler
	ldd 2,x
	cpd #3
	bne L16
	.dbline 45
	.dbline 46
; void rti_handler()
	ldd #2
	std -2,x
	.dbline 47
	bra L17
L16:
	.dbline 47
; {
	.dbline 48
; 	static int count = 0;
	movw 2,x,-2,x
	.dbline 49
; 	
L17:
L15:
	.dbline 52
; 	if ( ++count == RTI_FREQUENCY ) {
; 		count = 0;
; 		rti_every_second();
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
	.dbline 57
; 	}
; 	
; 	// Clear the interrupt
; 	CRGFLG |= 0x80;
; }
	ldd #0xf000
	jsr _stepper_delay
	.dbline -2
	.dbline 58
; 
L13:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l coded_step -2 I
	.dbsym l step 2 I
	.dbend
	.dbfunc e stepper_init _stepper_init fV
_stepper_init::
	.dbline -1
	.dbline 64
; /*
; 	Simulate a collision warning
; */
; void trigger_collision()
; {
; 	collision_detected = 1;
	.dbline 65
; }
	bset 0x25a,#32
	.dbline 66
; 
	bset 0x242,#96
	.dbline 67
; /*
	bset 0x258,#32
	.dbline -2
	.dbline 68
; 	This gets run every second
L18:
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
	.dbline 74
; */
; void rti_every_second()
; {
; 	static int seconds = 0;
; 	
; 	// Run the collision avoidance algorithm
	.dbline 75
	bra L23
L20:
	.dbline 75
	.dbline 75
L21:
	.dbline 75
	ldd 2,x
	subd #1
	std 2,x
L23:
	.dbline 75
; 	collision_avoidance();
	ldd 2,x
	bne L20
	.dbline -2
	.dbline 76
; 	
L19:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l delay 2 i
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART3B~1/../lib/stepper.c
_collision_detected::
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART3B~1/../lib/stepper.c
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART3B~1\assign43b.c
	.dbsym e collision_detected _collision_detected I
_temperature::
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART3B~1\assign43b.c
	.dbsym e temperature _temperature I
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART3B~1\assign43b.c
	.dbfunc e main _main fI
_main::
	.dbline -1
	.dbline 21
	.dbline 22
	ldd #26
	jsr _setbaud
	.dbline 23
	jsr _stepper_init
	.dbline 24
	jsr _rti_init
	.dbline 26
	ldd #56
	std _temperature
L25:
	.dbline 28
L26:
	.dbline 28
	bra L25
X0:
	.dbline 29
	ldd #0
	.dbline -2
L24:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e rti_init _rti_init fV
_rti_init::
	.dbline -1
	.dbline 36
	.dbline 37
	bset 0x38,#128
	.dbline 38
	ldab #127
	stab 0x3b
	.dbline 39
		cli

	.dbline -2
	.dbline 40
L28:
	.dbline 0 ; func end
	rts
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART3B~1\assign43b.c
L30:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART3B~1\assign43b.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART3B~1\assign43b.c
	.dbfunc e rti_handler _rti_handler fV
	.dbsym s count L30 I
;          ?temp -> -2,x
_rti_handler::
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 47
	.dbline 50
	ldd L30
	addd #1
	std -2,x
	movw -2,x,L30
	ldd -2,x
	cpd #8
	bne L31
	.dbline 50
	.dbline 51
	ldd #0
	std L30
	.dbline 52
	jsr _rti_every_second
	.dbline 53
L31:
	.dbline 56
	bset 0x37,#128
	.dbline -2
	.dbline 57
L29:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rti
	.dbend
	.dbfunc e trigger_collision _trigger_collision fV
_trigger_collision::
	.dbline -1
	.dbline 63
	.dbline 64
	ldd #1
	std _collision_detected
	.dbline -2
	.dbline 65
L33:
	.dbline 0 ; func end
	rts
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART3B~1\assign43b.c
L35:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART3B~1\assign43b.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART3B~1\assign43b.c
	.dbfunc e rti_every_second _rti_every_second fV
	.dbsym s seconds L35 I
_rti_every_second::
	.dbline -1
	.dbline 71
	.dbline 75
	jsr _collision_avoidance
	.dbline 78
	ldd L35
	addd #1
	ldy #6
	exg x,y
	idivs
	exg x,y
	std L35
	.dbline 79
	ldd L35
	bne L36
	.dbline 79
	.dbline 80
	jsr _trigger_collision
	.dbline 81
L36:
	.dbline -2
	.dbline 82
; 	// Simulate collisions at an interval
; 	seconds = (seconds + 1) % 6;
; 	if ( seconds == 0 ) {
; 		trigger_collision();
; 	}
; }
L34:
	.dbline 0 ; func end
	rts
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART3B~1\assign43b.c
L39:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART3B~1\assign43b.c
L40:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART3B~1\assign43b.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART3B~1\assign43b.c
	.dbfunc e collision_avoidance _collision_avoidance fV
	.dbsym s state L40 I
	.dbsym s seconds L39 I
;          ?temp -> -4,x
;          ?temp -> -2,x
_collision_avoidance::
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 88
; 
; /*
; 	This is executes the algorithm provided in the labs to avoid a collision
; */
; void collision_avoidance()
; {
	.dbline 97
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
	lbeq L41
	.dbline 97
	.dbline 98
	ldd L40
	beq L45
	ldd L40
	cpd #1
	beq L47
	ldd L40
	cpd #2
	beq L51
	lbra L43
X1:
	.dbline 98
; 		switch ( state ) {
L45:
	.dbline 101
; 			case COLLISION_AVOID_STATE_INITIAL:
; 				// we would stop the forward motors here
; 				printf("\n\nCollision warning!!\nStopping motors.\n");
	ldd #L46
	jsr _printf
	.dbline 102
; 				seconds = 0;
	ldd #0
	std L39
	.dbline 103
; 				state = COLLISION_AVOID_STATE_WAIT;
	ldd #1
	std L40
	.dbline 104
; 				break;
	lbra L42
L47:
	.dbline 107
; 			case COLLISION_AVOID_STATE_WAIT:
; 				// wait 2 seconds before changing to next state (total time will be 3 second wait)
; 				printf("Waiting for motors to be stopped\n");
	ldd #L48
	jsr _printf
	.dbline 108
; 				if ( ++seconds >= 2 ) {
	ldd L39
	addd #1
	std -2,x
	movw -2,x,L39
	ldd -2,x
	cpd #2
	blt L42
	.dbline 108
	.dbline 109
; 					seconds = 0;
	ldd #0
	std L39
	.dbline 110
; 					state = COLLISION_AVOID_STATE_ROTATE90;
	ldd #2
	std L40
	.dbline 111
; 				}
	.dbline 112
; 				break;
	bra L42
L51:
	.dbline 114
; 			case COLLISION_AVOID_STATE_ROTATE90:
; 				if ( seconds == 0 ) {
	ldd L39
	bne L52
	.dbline 114
	.dbline 115
; 					printf("Rotating 90 degrees to the right.\n");
	ldd #L54
	jsr _printf
	.dbline 116
; 					stepper_turn_cw(STEPPER_STEPS_PER_QUARTER);
	ldd #5
	jsr _stepper_turn_cw
	.dbline 117
	bra L53
L52:
	.dbline 117
; 				} else {
	.dbline 118
; 					printf("Waiting another second.\n");
	ldd #L55
	jsr _printf
	.dbline 119
; 				}
L53:
	.dbline 121
; 				
; 				if ( ++seconds >= 2 ) {
	ldd L39
	addd #1
	std -4,x
	movw -4,x,L39
	ldd -4,x
	cpd #2
	blt L42
	.dbline 121
	.dbline 123
; 					// Go back into initial state and reset collision detection
; 					seconds = 0;
	ldd #0
	std L39
	.dbline 124
; 					state = COLLISION_AVOID_STATE_INITIAL;
	ldd #0
	std L40
	.dbline 125
; 					collision_detected = 0;
	ldd #0
	std _collision_detected
	.dbline 128
; 					
; 					// We would start the forward motors here
; 				}
	.dbline 129
; 				break;
	bra L42
L43:
	.dbline 131
; 			default:
; 				printf("Unknown collision state, return to initial.\n");
	ldd #L58
	jsr _printf
	.dbline 132
; 				seconds = 0;
	ldd #0
	std L39
	.dbline 133
; 				state = COLLISION_AVOID_STATE_INITIAL;
	ldd #0
	std L40
	.dbline 134
; 				collision_detected = 0;
	ldd #0
	std _collision_detected
	.dbline 135
; 		}
	.dbline 136
	bra L42
L41:
	.dbline 136
	.dbline 137
	ldd #L59
	jsr _printf
	.dbline 138
L42:
	.dbline -2
	.dbline 139
; 	} else {
; 		printf("No collisions detected\n");
; 	}
; }
L38:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbend
L59:
	.byte 'N,'o,32,'c,'o,'l,'l,'i,'s,'i,'o,'n,'s,32,'d,'e
	.byte 't,'e,'c,'t,'e,'d,10,0
L58:
	.byte 'U,'n,'k,'n,'o,'w,'n,32,'c,'o,'l,'l,'i,'s,'i,'o
	.byte 'n,32,'s,'t,'a,'t,'e,44,32,'r,'e,'t,'u,'r,'n,32
	.byte 't,'o,32,'i,'n,'i,'t,'i,'a,'l,46,10,0
L55:
	.byte 'W,'a,'i,'t,'i,'n,'g,32,'a,'n,'o,'t,'h,'e,'r,32
	.byte 's,'e,'c,'o,'n,'d,46,10,0
L54:
	.byte 'R,'o,'t,'a,'t,'i,'n,'g,32,57,48,32,'d,'e,'g,'r
	.byte 'e,'e,'s,32,'t,'o,32,'t,'h,'e,32,'r,'i,'g,'h,'t
	.byte 46,10,0
L48:
	.byte 'W,'a,'i,'t,'i,'n,'g,32,'f,'o,'r,32,'m,'o,'t,'o
	.byte 'r,'s,32,'t,'o,32,'b,'e,32,'s,'t,'o,'p,'p,'e,'d
	.byte 10,0
L46:
	.byte 10,10,'C,'o,'l,'l,'i,'s,'i,'o,'n,32,'w,'a,'r,'n
	.byte 'i,'n,'g,33,33,10,'S,'t,'o,'p,'p,'i,'n,'g,32,'m
	.byte 'o,'t,'o,'r,'s,46,10,0
