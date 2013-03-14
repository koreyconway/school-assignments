	.module assign43a.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART3A~1\assign43a.c
	.dbfunc e main _main fI
; shifted_instruction -> -4,x
;    instruction -> -2,x
_main::
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 14
; #include <hcs12dp256.h>
; #include <stdio.h>
; 
; #define	STEPPER_DELAY	0XF000
; #define STEPPER_STEPS_PER_TURN	5*4
; 
; void stepper_init(void);
; void stepper_turn_cw(int steps);
; void stepper_turn_ccw(int steps);
; void stepper_set_step(int step);
; void stepper_delay(unsigned int delay);
; 
; int main()
; {
	.dbline 15
; 	int instruction = 0;
	ldd #0
	std -2,x
	.dbline 16
; 	int shifted_instruction = 0;
	ldd #0
	std -4,x
	.dbline 19
; 	
; 	///(BAUD19K);	
; 	stepper_init();
	jsr _stepper_init
	.dbline 20
; 	stepper_turn_cw(STEPPER_STEPS_PER_TURN * 2);
	ldd #40
	jsr _stepper_turn_cw
	.dbline 21
; 	stepper_turn_ccw(STEPPER_STEPS_PER_TURN * 2);
	ldd #40
	jsr _stepper_turn_ccw
	.dbline 22
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
	.dbline 29
; }
; 
; /*
; 	Turn clock-wise a given number of steps
; */
; void stepper_turn_cw(int steps)
; {
	.dbline 30
	bra L8
L5:
	.dbline 30
	.dbline 31
	ldd 2,x
	ldy #4
	exg x,y
	idivs
	exg x,y
	std -2,x
	ldd #3
	subd -2,x
	jsr _stepper_set_step
	.dbline 32
L6:
	.dbline 30
	ldd 2,x
	subd #1
	std 2,x
L8:
	.dbline 30
; 	for ( ; steps > 0; steps-- ) {
	ldd 2,x
	bgt L5
	.dbline -2
	.dbline 33
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
	.dbline 39
; 
; /*
; 	Turn clock-wise a given number of steps
; */
; void stepper_turn_ccw(int steps)
; {
	.dbline 40
	bra L13
L10:
	.dbline 40
	.dbline 41
	ldd 2,x
	ldy #4
	exg x,y
	idivs
	exg x,y
	jsr _stepper_set_step
	.dbline 42
L11:
	.dbline 40
	ldd 2,x
	subd #1
	std 2,x
L13:
	.dbline 40
; 	for ( ; steps > 0; steps-- ) {
	ldd 2,x
	bgt L10
	.dbline -2
	.dbline 43
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
	.dbline 49
; 
; /*
; 
; */
; void stepper_set_step(int step)
; {
	.dbline 50
; 	int coded_step = 0;
	ldd #0
	std -2,x
	.dbline 53
; 	
; 	// Get the coded step value for this step
; 	if ( step == 2 ) {
	ldd 2,x
	cpd #2
	bne L15
	.dbline 53
	.dbline 54
; 		coded_step = 3;
	ldd #3
	std -2,x
	.dbline 55
	bra L16
L15:
	.dbline 55
; 	} else if ( step == 3 ) {
	ldd 2,x
	cpd #3
	bne L17
	.dbline 55
	.dbline 56
; 		coded_step = 2;
	ldd #2
	std -2,x
	.dbline 57
	bra L18
L17:
	.dbline 57
; 	} else {
	.dbline 58
; 		coded_step = step;
	movw 2,x,-2,x
	.dbline 59
; 	}
L18:
L16:
	.dbline 62
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
	.dbline 67
; 	
; 	//printf("Instruction: %X\nShifted Instruction: %X\nPTT: %X\n\n", instruction, shifted_instruction, PTT);
; 	
; 	// Delay to allow enough time for the step to take place
; 	stepper_delay(STEPPER_DELAY);
	ldd #0xf000
	jsr _stepper_delay
	.dbline -2
	.dbline 68
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
	.dbline 74
; 
; /*
; 	Initialize ports for the stepper motor
; */
; void stepper_init()
; {
	.dbline 75
; 	DDRP = DDRP | 0x20; // Enable output for the enable bit
	bset 0x25a,#32
	.dbline 76
; 	DDRT = DDRT | 0x60; // Enable output to the stepper motor
	bset 0x242,#96
	.dbline 77
; 	PTP  = PTP  | 0x20; // Enable the stepper motor
	bset 0x258,#32
	.dbline -2
	.dbline 78
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
	.dbline 84
; 
; /*
; 	Add delays for the stepper, based on given parameter
; */
; void stepper_delay(unsigned int delay)
; {
	.dbline 85
	bra L24
L21:
	.dbline 85
	.dbline 85
L22:
	.dbline 85
	ldd 2,x
	subd #1
	std 2,x
L24:
	.dbline 85
; 	for ( ; delay > 0 ; delay-- ) {}
	ldd 2,x
	bne L21
	.dbline -2
	.dbline 86
; }
L20:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l delay 2 i
	.dbend
