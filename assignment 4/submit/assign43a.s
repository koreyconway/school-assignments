	.module assign43a.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART3A~1/../lib/stepper.c
	.dbfunc e stepper_turn_cw _stepper_turn_cw fV
;          steps -> 2,x
_stepper_turn_cw::
	pshd
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 17
; #include <hcs12dp256.h>
; #include <stdio.h>
; #include "../lib/stepper.c"
; 
; int main()
; {
; 	int instruction = 0;
; 	int shifted_instruction = 0;
; 	
; 	stepper_init();
; 	stepper_turn_cw(STEPPER_STEPS_PER_TURN * 2);
; 	stepper_turn_ccw(STEPPER_STEPS_PER_TURN * 2);
; 	return 1;
; }
; }
; }
; }
	.dbline 18
	bra L7
L4:
	.dbline 18
	.dbline 19
	ldd 2,x
	ldy #4
	exg x,y
	idivs
	exg x,y
	std -2,x
	ldd #3
	subd -2,x
	jsr _stepper_set_step
	.dbline 20
L5:
	.dbline 18
	ldd 2,x
	subd #1
	std 2,x
L7:
	.dbline 18
; }
	ldd 2,x
	bgt L4
	.dbline -2
	.dbline 21
; }
; }
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
	.dbline 27
; ä
; ä
; ä
; ä
; ä
; ä
	.dbline 28
	bra L12
L9:
	.dbline 28
	.dbline 29
	ldd 2,x
	ldy #4
	exg x,y
	idivs
	exg x,y
	jsr _stepper_set_step
	.dbline 30
L10:
	.dbline 28
	ldd 2,x
	subd #1
	std 2,x
L12:
	.dbline 28
; ä
	ldd 2,x
	bgt L9
	.dbline -2
	.dbline 31
; ä
; ä
; ä
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
	.dbline 37
; ä
; ä
; ä
; ä
; ä
; ä
	.dbline 38
; ä
	ldd #0
	std -2,x
	.dbline 41
; ä
; ä
; ä
	ldd 2,x
	cpd #2
	bne L14
	.dbline 41
	.dbline 42
; ä
	ldd #3
	std -2,x
	.dbline 43
	bra L15
L14:
	.dbline 43
; ä
	ldd 2,x
	cpd #3
	bne L16
	.dbline 43
	.dbline 44
; ä
	ldd #2
	std -2,x
	.dbline 45
	bra L17
L16:
	.dbline 45
; ä
	.dbline 46
; ä
	movw 2,x,-2,x
	.dbline 47
; ä
L17:
L15:
	.dbline 50
; ä
; ä
; ä
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
	.dbline 55
; ä
; ä
; ä
; ä
; ä
	ldd #0xf000
	jsr _stepper_delay
	.dbline -2
	.dbline 56
; ä
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
	.dbline 62
; ä
; ä
; ä
; ä
; ä
; ä
	.dbline 63
; ä
	bset 0x25a,#32
	.dbline 64
; ä
	bset 0x242,#96
	.dbline 65
; ä
	bset 0x258,#32
	.dbline -2
	.dbline 66
; ä
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
	.dbline 72
; ä
; ä
; ä
; ä
; ä
; ä
	.dbline 73
	bra L23
L20:
	.dbline 73
	.dbline 73
L21:
	.dbline 73
	ldd 2,x
	subd #1
	std 2,x
L23:
	.dbline 73
; ä
	ldd 2,x
	bne L20
	.dbline -2
	.dbline 74
; ä
L19:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l delay 2 i
	.dbend
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~3\PART3A~1\assign43a.c
	.dbfunc e main _main fI
; shifted_instruction -> -4,x
;    instruction -> -2,x
_main::
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 6
	.dbline 7
	ldd #0
	std -2,x
	.dbline 8
	ldd #0
	std -4,x
	.dbline 10
	jsr _stepper_init
	.dbline 11
	ldd #40
	jsr _stepper_turn_cw
	.dbline 12
	ldd #40
	jsr _stepper_turn_ccw
	.dbline 13
	ldd #1
	.dbline -2
L24:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l shifted_instruction -4 I
	.dbsym l instruction -2 I
	.dbend
