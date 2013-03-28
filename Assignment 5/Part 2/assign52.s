	.module assign52.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGM~1\PART2~1/../lib/motor.c
	.dbfunc e motor_init _motor_init fV
_motor_init::
	.dbline -1
	.dbline 12
; // By Korey Conway and Tanzeel Rana
; 
; #include <hcs12dp256.h>
; #include <stdio.h>
; #include "../lib/motor.c"
; 
; int main()
; {
; 	char key;
; 	int duty;
; 	unsigned int i;
; 	
	.dbline 14
; 	// Setup terminal
; 	setbaud(BAUD19K);
	bset 0xa1,#128
	.dbline 15
; 	
	bclr 0xa4,#0x80
	.dbline 16
; 	motor_init();
	bclr 0xa5,#0x80
	.dbline 17
; 	optical_init();
	ldab #255
	stab 0xa9
	.dbline 18
; 	
	ldab #99
	stab 0xbb
	.dbline 19
; 	INTR_ON();
	bclr 0xa3,#0x70
	.dbline 20
; 	
	bset 0x25a,#64
	.dbline 21
; 	motor_set_duty(50);
	bset 0x258,#64
	.dbline 22
; 	
	clr 0xc3
	.dbline 23
; 	while ( 1 ) {
	bset 0xa0,#128
	.dbline -2
	.dbline 24
; 		// for ( duty = 25; duty <= 50; duty++ ) {
L3:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e motor_set_duty _motor_set_duty fV
;           duty -> 2,x
_motor_set_duty::
	pshd
	pshx
	tfr s,x
	.dbline -1
	.dbline 30
	.dbline 31
	ldd 2,x
	blt L5
	ldd 2,x
	cpd #50
	bgt L5
	.dbline 31
	.dbline 32
	ldd 2,x
	stab 0xc3
	.dbline 33
L5:
	.dbline -2
	.dbline 34
; 			// motor_set_duty(duty);
; 			// for ( i = 0; i < -1; i++ ) {}
; 		// }
; 	
; 		// for ( duty = 50; duty >= 25; duty-- ) {
; 			// motor_set_duty(duty);		
; 			// for ( i = 0; i < -1; i++ ) {}
; 		// }
; 	}
; 	
L4:
	tfr x,s
	pulx
	leas 2,sp
	.dbline 0 ; func end
	rts
	.dbsym l duty 2 I
	.dbend
	.dbfunc e optical_init _optical_init fV
_optical_init::
	.dbline -1
	.dbline 37
; 	return 0;
; }
; }
	.dbline 40
; }
; }
; }
	bset 0x4a,#64
	.dbline 41
; }
	bset 0x4c,#128
	.dbline 42
; }
	bclr 0x40,#0x80
	.dbline 43
; }
	bset 0x4d,#7
	.dbline 44
; }
	bset 0x46,#144
	.dbline -2
	.dbline 45
; }
L7:
	.dbline 0 ; func end
	rts
	.dbend
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGM~1\PART2~1/../lib/motor.c
L9:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGM~1\PART2~1/../lib/motor.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGM~1\PART2~1/../lib/motor.c
	.dbfunc e optical_isr _optical_isr fV
	.dbsym s start L9 I
;           time -> -2,x
_optical_isr::
	pshx
	tfr s,x
	leas -4,sp
	.dbline -1
	.dbline 49
; ä
; ä
; ä
; ä
	.dbline 51
; ä
; ä
	ldd #0
	std -2,x
	.dbline 53
; ä
; ä
	ldd L9
	beq L10
	.dbline 53
	.dbline 54
; ä
	; vol
	ldd 0x44
	subd L9
	std -2,x
	.dbline 55
; ä
	ldd #0
	std L9
	.dbline 56
; ä
	movw -2,x,0,sp
	ldd #L12
	jsr _printf
	.dbline 57
	bra L11
L10:
	.dbline 57
; ä
	.dbline 58
; ä
	; vol
	ldd 0x44
	std L9
	.dbline 59
; ä
L11:
	.dbline 61
; ä
; ä
	; vol
	ldab 0x4e
	stab 0x4e
	.dbline -2
	.dbline 64
; ä
; ä
; ä
L8:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rti
	.dbsym l time -2 I
	.dbend
	.dbfile M:\SYSC20~2\Assignments\ASSIGM~1\PART2~1\assign52.c
	.dbfunc e main _main fI
;              i -> -5,x
;           duty -> -3,x
;            key -> -1,x
_main::
	pshx
	tfr s,x
	leas -6,sp
	.dbline -1
	.dbline 8
	.dbline 14
	ldd #26
	jsr _setbaud
	.dbline 16
	jsr _motor_init
	.dbline 17
	jsr _optical_init
	.dbline 19
		cli

	.dbline 21
	ldd #50
	jsr _motor_set_duty
L14:
	.dbline 23
	.dbline 33
L15:
	.dbline 23
	bra L14
X0:
	.dbline 35
	ldd #0
	.dbline -2
L13:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l i -5 i
	.dbsym l duty -3 I
	.dbsym l key -1 c
	.dbend
L12:
	.byte 37,'u,10,0
