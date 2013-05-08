	.module stepper.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART3B~1\stepper.c
	.dbfunc e stepper_turn_cw _stepper_turn_cw fV
;          steps -> 2,x
_stepper_turn_cw::
	pshd
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 18
; #include <hcs12dp256.h>
; #include <stdio.h>
; 
; #define	STEPPER_DELAY				0XF000
; #define STEPPER_STEPS_PER_QUARTER	5
; #define STEPPER_STEPS_PER_TURN		STEPPER_STEPS_PER_QUARTER*4
; 
; void stepper_init(void);
; void stepper_turn_cw(int steps);
; void stepper_turn_ccw(int steps);
; void stepper_set_step(int step);
; void stepper_delay(unsigned int delay);
; 
; /*
; 	Turn clock-wise a given number of steps
; */
; void stepper_turn_cw(int steps)
; {
	.dbline 19
	bra L7
L4:
	.dbline 19
	.dbline 20
	ldd 2,x
	ldy #4
	exg x,y
	idivs
	exg x,y
	std -2,x
	ldd #3
	subd -2,x
	jsr _stepper_set_step
	.dbline 21
L5:
	.dbline 19
	ldd 2,x
	subd #1
	std 2,x
L7:
	.dbline 19
; 	for ( ; steps > 0; steps-- ) {
	ldd 2,x
	bgt L4
	.dbline -2
	.dbline 22
; 		stepper_set_step(3 - (steps % 4));
; 	}
; }
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
	.dbline 28
; 
; /*
; 	Turn clock-wise a given number of steps
; */
; void stepper_turn_ccw(int steps)
; {
	.dbline 29
	bra L12
L9:
	.dbline 29
	.dbline 30
	ldd 2,x
	ldy #4
	exg x,y
	idivs
	exg x,y
	jsr _stepper_set_step
	.dbline 31
L10:
	.dbline 29
	ldd 2,x
	subd #1
	std 2,x
L12:
	.dbline 29
; 	for ( ; steps > 0; steps-- ) {
	ldd 2,x
	bgt L9
	.dbline -2
	.dbline 32
; 		stepper_set_step(steps % 4);
; 	}
; }
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
	.dbline 38
; 
; /*
; 
; */
; void stepper_set_step(int step)
; {
	.dbline 39
; 	int coded_step = 0;
	ldd #0
	std -2,x
	.dbline 42
; 	
; 	// Get the coded step value for this step
; 	if ( step == 2 ) {
	ldd 2,x
	cpd #2
	bne L14
	.dbline 42
	.dbline 43
; 		coded_step = 3;
	ldd #3
	std -2,x
	.dbline 44
	bra L15
L14:
	.dbline 44
; 	} else if ( step == 3 ) {
	ldd 2,x
	cpd #3
	bne L16
	.dbline 44
	.dbline 45
; 		coded_step = 2;
	ldd #2
	std -2,x
	.dbline 46
	bra L17
L16:
	.dbline 46
; 	} else {
	.dbline 47
; 		coded_step = step;
	movw 2,x,-2,x
	.dbline 48
; 	}
L17:
L15:
	.dbline 51
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
	.dbline 56
; 	
; 	//printf("Instruction: %X\nShifted Instruction: %X\nPTT: %X\n\n", instruction, shifted_instruction, PTT);
; 	
; 	// Delay to allow enough time for the step to take place
; 	stepper_delay(STEPPER_DELAY);
	ldd #0xf000
	jsr _stepper_delay
	.dbline -2
	.dbline 57
; } 
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
	.dbline 63
; 
; /*
; 	Initialize ports for the stepper motor
; */
; void stepper_init()
; {
	.dbline 64
; 	DDRP = DDRP | 0x20; // Enable output for the enable bit
	bset 0x25a,#32
	.dbline 65
; 	DDRT = DDRT | 0x60; // Enable output to the stepper motor
	bset 0x242,#96
	.dbline 66
; 	PTP  = PTP  | 0x20; // Enable the stepper motor
	bset 0x258,#32
	.dbline -2
	.dbline 67
; }
L18:
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
	.dbline 73
; 
; /*
; 	Add delays for the stepper, based on given parameter
; */
; void stepper_delay(unsigned int delay)
; {
	.dbline 74
	bra L23
L20:
	.dbline 74
	.dbline 74
L21:
	.dbline 74
	ldd 2,x
	subd #1
	std 2,x
L23:
	.dbline 74
; 	for ( ; delay > 0 ; delay-- ) {}
	ldd 2,x
	bne L20
	.dbline -2
	.dbline 75
; }
L19:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l delay 2 i
	.dbend
