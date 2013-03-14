	.module assign43.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART3~1\assign43.c
	.dbfunc e main _main fI
; shifted_instruction -> -4,x
;    instruction -> -2,x
_main::
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 17
; #include <hcs12dp256.h>
; #include <stdio.h>
; 
; #define	STEPPER_DELAY	0XF000
; #define STEPPER_CW		0
; #define STEPPER_CCW		1
; #define STEPPER_STEPS_PER_TURN	5*4
; 
; void stepper_init(void);
; void stepper_turn(int quater_turns, int direction);
; void stepper_turn_cw(int quarter_turns);
; //void stepper_turn_ccw(int quarter_turns);
; void  stepper_set_step(int step);
; void stepper_delay(unsigned int delay);
; 
; int main()
; {
	.dbline 18
; 	int instruction = 0;
	ldd #0
	std -2,x
	.dbline 19
; 	int shifted_instruction = 0;
	ldd #0
	std -4,x
	.dbline 21
; 	
; 	setbaud(BAUD19K);	
	ldd #26
	jsr _setbaud
	.dbline 22
; 	stepper_init();
	jsr _stepper_init
	.dbline 23
; 	stepper_turn_cw(STEPPER_STEPS_PER_TURN * 2);
	ldd #40
	jsr _stepper_turn_cw
	.dbline 24
; 	stepper_turn_ccw(STEPPER_STEPS_PER_TURN * 2);
	ldd #40
	jsr _stepper_turn_ccw
	.dbline 25
; 	return 1;
	ldd #1
	.dbline -2
L3:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l shifted_instruction -4 I
	.dbsym l instruction -2 I
	.dbend
	.dbfunc e stepper_turn_cw _stepper_turn_cw fV
;          steps -> 2,x
_stepper_turn_cw::
	pshd
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 32
; }
; 
; /*
; 	Turn clock-wise a given number of steps
; */
; void stepper_turn_cw(int steps)
; {
	.dbline 33
	bra L8
L5:
	.dbline 33
	.dbline 34
	ldd 2,x
	ldy #4
	exg x,y
	idivs
	exg x,y
	std -2,x
	ldd #3
	subd -2,x
	jsr _stepper_set_step
	.dbline 35
L6:
	.dbline 33
	ldd 2,x
	subd #1
	std 2,x
L8:
	.dbline 33
; 	for ( ; steps > 0; steps-- ) {
	ldd 2,x
	bgt L5
	.dbline -2
	.dbline 36
; 		stepper_set_step(3 - (steps % 4));
; 	}
; }
L4:
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
	.dbline 42
; 
; /*
; 	Turn clock-wise a given number of steps
; */
; void stepper_turn_ccw(int steps)
; {
	.dbline 43
	bra L13
L10:
	.dbline 43
	.dbline 44
	ldd 2,x
	ldy #4
	exg x,y
	idivs
	exg x,y
	jsr _stepper_set_step
	.dbline 45
L11:
	.dbline 43
	ldd 2,x
	subd #1
	std 2,x
L13:
	.dbline 43
; 	for ( ; steps > 0; steps-- ) {
	ldd 2,x
	bgt L10
	.dbline -2
	.dbline 46
; 		stepper_set_step(steps % 4);
; 	}
; }
L9:
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
	.dbline 52
; 
; /*
; 
; */
; void stepper_set_step(int step)
; {
	.dbline 53
; 	int coded_step = 0;
	ldd #0
	std -2,x
	.dbline 56
; 	
; 	// Get the coded step value for this step
; 	if ( step == 2 ) {
	ldd 2,x
	cpd #2
	bne L15
	.dbline 56
	.dbline 57
; 		coded_step = 3;
	ldd #3
	std -2,x
	.dbline 58
	bra L16
L15:
	.dbline 58
; 	} else if ( step == 3 ) {
	ldd 2,x
	cpd #3
	bne L17
	.dbline 58
	.dbline 59
; 		coded_step = 2;
	ldd #2
	std -2,x
	.dbline 60
	bra L18
L17:
	.dbline 60
; 	} else {
	.dbline 61
; 		coded_step = step;
	movw 2,x,-2,x
	.dbline 62
; 	}
L18:
L16:
	.dbline 65
; 
; 	// Set the bits in port T
; 	PTT = (PTT & ~0x60) | (coded_step << 5);
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
	.dbline 70
; 	
; 	//printf("Instruction: %X\nShifted Instruction: %X\nPTT: %X\n\n", instruction, shifted_instruction, PTT);
; 	
; 	// Delay to allow enough time for the step to take place
; 	stepper_delay(STEPPER_DELAY);
	ldd #0xf000
	jsr _stepper_delay
	.dbline -2
	.dbline 71
; } 
L14:
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
	.dbline 77
; 
; /*
; 	Initialize ports for the stepper motor
; */
; void stepper_init()
; {
	.dbline 78
; 	DDRP = DDRP | 0x20; // Enable output for the enable bit
	bset 0x25a,#32
	.dbline 79
; 	DDRT = DDRT | 0x60; // Enable output to the stepper motor
	bset 0x242,#96
	.dbline 80
; 	PTP  = PTP  | 0x20; // Enable the stepper motor
	bset 0x258,#32
	.dbline -2
	.dbline 81
; }
L19:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e stepper_delay _stepper_delay fV
;          delay -> 2,x
_stepper_delay::
	pshd
	pshx
	tfr s,x
	.dbline -1
	.dbline 87
; 
; /*
; 	Add delays for the stepper, based on given parameter
; */
; void stepper_delay(unsigned int delay)
; {
	.dbline 88
	bra L24
L21:
	.dbline 88
	.dbline 88
L22:
	.dbline 88
	ldd 2,x
	subd #1
	std 2,x
L24:
	.dbline 88
; 	for ( ; delay > 0 ; delay-- ) {}
	ldd 2,x
	bne L21
	.dbline -2
	.dbline 89
; }
L20:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l delay 2 i
	.dbend
