	.module assign52.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGM~1\PART2~1/../lib/motor.c
	.dbfunc e motor_init _motor_init fV
_motor_init::
	.dbline -1
	.dbline 9
; // By Korey Conway and Tanzeel Rana
; 
; #include <hcs12dp256.h>
; #include <stdio.h>
; #include "../lib/motor.c"
; 
; int main()
; {
; 	char key;
	.dbline 11
; 	
; 	// Setup terminal
	bset 0xa1,#128
	.dbline 12
; 	setbaud(BAUD19K);
	bclr 0xa4,#0x80
	.dbline 13
; 	
	bclr 0xa5,#0x80
	.dbline 14
; 	motor_init();
	ldab #255
	stab 0xa9
	.dbline 15
; 	optical_init();
	ldab #100
	stab 0xbb
	.dbline 16
; 	
	bclr 0xa3,#0x70
	.dbline 17
; 	INTR_ON();
	bset 0x25a,#64
	.dbline 18
; 	
	bset 0x258,#64
	.dbline 19
; 	motor_set_duty(50);
	clr 0xc3
	.dbline 20
; 	
	bset 0xa0,#128
	.dbline -2
	.dbline 21
; 	while ( 1 ) {}
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
	.dbline 24
; 	
; 	return 0;
; }
	.dbline 25
; }
	ldd 2,x
	stab 0xc3
	.dbline -2
	.dbline 26
; }
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
	.dbline 29
; }
; }
; }
	.dbline 30
; }
	bset 0x61,#1
	.dbline 31
; }
	; vol
	ldab 0x60
	clra
	anda #255
	andb #142
	ora #0
	orb #81
	stab 0x60
	.dbline -2
	.dbline 32
; }
L5:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e optical_isr _optical_isr fV
_optical_isr::
	.dbline -1
	.dbline 36
; }
; }
; }
; }
	.dbline 37
; }
	ldd #L7
	jsr _printf
	.dbline 38
; }
	bset 0x61,#1
	.dbline -2
	.dbline 39
; }
L6:
	.dbline 0 ; func end
	rti
	.dbend
	.dbfile M:\SYSC20~2\Assignments\ASSIGM~1\PART2~1\assign52.c
	.dbfunc e main _main fI
;            key -> -1,x
_main::
	pshx
	tfr s,x
	leas -2,sp
	.dbline -1
	.dbline 8
	.dbline 12
	ldd #26
	jsr _setbaud
	.dbline 14
	jsr _motor_init
	.dbline 15
	jsr _optical_init
	.dbline 17
		cli

	.dbline 19
	ldd #50
	jsr _motor_set_duty
L9:
	.dbline 21
	.dbline 21
L10:
	.dbline 21
	bra L9
X0:
	.dbline 23
	ldd #0
	.dbline -2
L8:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l key -1 c
	.dbend
L7:
	.byte 50,51,10,0
