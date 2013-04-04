	.module assign53.c
	.area data
_temperature_value:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART3~1/../lib/temperature.c
	.dbsym s temperature_value _temperature_value I
_temperature_ready:
	.blkb 2
	.area idata
	.word 0
	.area data
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART3~1/../lib/temperature.c
	.dbsym s temperature_ready _temperature_ready I
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART3~1/../lib/temperature.c
	.dbfunc e temperature_init _temperature_init fV
_temperature_init::
	.dbline -1
	.dbline 20
; // By Korey Conway and Tanzeel Rana
; 
; #include <hcs12dp256.h>
; #include <stdio.h>
; #include "../lib/temperature.c"
; 
; #define DESIRED_TEMPERATURE	100
; 
; int main()
; {
; 	int temperature = 0;
; 	int prevtemp = 0;
; 	
; 	// Setup terminal
; 	setbaud(BAUD19K);
; 	
; 	INTR_ON();
; 	temperature_init();
; 	temperature_start_sample();
; 	
	.dbline 21
; 	while ( 1 ) {
	ldd #0
	std _temperature_ready
	.dbline 26
; 		if ( temperature_is_ready() ) {
; 			temperature = temperature_get();
; 			
; 			// Turn the heater on/off to get the desired temperature
; 			if ( temperature < DESIRED_TEMPERATURE ) {
	ldab #250
	stab 0x82
	.dbline 29
; 				temperature_heater_on();
; 			} else {
; 				temperature_heater_off();
	clr 0x83
	.dbline 33
; 			}
; 			
; 			// Print on the terminal if the temperature changed
; 			if ( temperature != prevtemp ) {
	ldab #96
	stab 0x84
	.dbline 36
; 				prevtemp = temperature;
; 				printf("Temperature is %d F\n", temperature);
; 			}
	bset 0x252,#128
	.dbline -2
	.dbline 37
; 			
L3:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e temperature_start_sample _temperature_start_sample fV
_temperature_start_sample::
	.dbline -1
	.dbline 43
; 			// Start a new sample
; 			temperature_start_sample();
; 		}
; 	}
; 		
; 	return 0;
	.dbline 46
; }
; }
; }
	ldd #0
	std _temperature_ready
	.dbline 47
; }
	ldab #134
	stab 0x85
	.dbline -2
	.dbline 48
; }
L4:
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
; ä
; ä
; ä
; ä
; ä
; ä
	.dbline 55
; ä
	ldd _temperature_ready
	beq L7
	ldd #1
	std -2,x
	bra L8
L7:
	ldd #0
	std -2,x
L8:
	ldd -2,x
	.dbline -2
L5:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e temperature_get _temperature_get fI
_temperature_get::
	.dbline -1
	.dbline 62
; ä
; ä
; ä
; ä
; ä
; ä
; ä
	.dbline 63
; ä
	ldd #0
	std _temperature_ready
	.dbline 64
; ä
	ldd _temperature_value
	.dbline -2
L9:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e temperature_heater_on _temperature_heater_on fV
_temperature_heater_on::
	.dbline -1
	.dbline 71
; ä
; ä
; ä
; ä
; ä
; ä
; ä
	.dbline 72
; ä
	bset 0x250,#128
	.dbline -2
	.dbline 73
; ä
L10:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e temperature_heater_off _temperature_heater_off fV
_temperature_heater_off::
	.dbline -1
	.dbline 79
; ä
; ä
; ä
; ä
; ä
; ä
	.dbline 80
; ä
	bclr 0x250,#0x80
	.dbline -2
	.dbline 81
; ä
L11:
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e temperature_isr _temperature_isr fV
_temperature_isr::
	.dbline -1
	.dbline 88
; ä
; ä
; ä
; ä
; ä
; ä
; ä
	.dbline 89
; ä
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
; ä
	ldd #1
	std _temperature_ready
	.dbline -2
	.dbline 91
; ä
L12:
	.dbline 0 ; func end
	rti
	.dbend
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART3~1\assign53.c
	.dbfunc e main _main fI
;       prevtemp -> -4,x
;    temperature -> -2,x
_main::
	pshx
	tfr s,x
	leas -6,sp
	.dbline -1
	.dbline 10
	.dbline 11
	ldd #0
	std -2,x
	.dbline 12
	ldd #0
	std -4,x
	.dbline 15
	ldd #26
	jsr _setbaud
	.dbline 17
		cli

	.dbline 18
	jsr _temperature_init
	.dbline 19
	jsr _temperature_start_sample
	bra L15
L14:
	.dbline 21
	.dbline 22
	jsr _temperature_is_ready
	cpd #0
	beq L17
	.dbline 22
	.dbline 23
	jsr _temperature_get
	std -2,x
	.dbline 26
	ldd -2,x
	cpd #100
	bge L19
	.dbline 26
	.dbline 27
	jsr _temperature_heater_on
	.dbline 28
	bra L20
L19:
	.dbline 28
	.dbline 29
	jsr _temperature_heater_off
	.dbline 30
L20:
	.dbline 33
	ldd -2,x
	cpd -4,x
	beq L21
	.dbline 33
	.dbline 34
	movw -2,x,-4,x
	.dbline 35
	movw -2,x,0,sp
	ldd #L23
	jsr _printf
	.dbline 36
L21:
	.dbline 39
	jsr _temperature_start_sample
	.dbline 40
L17:
	.dbline 41
L15:
	.dbline 21
	bra L14
X0:
	.dbline 43
	ldd #0
	.dbline -2
L13:
	tfr x,s
	pulx
	.dbline 0 ; func end
	rts
	.dbsym l prevtemp -4 I
	.dbsym l temperature -2 I
	.dbend
L23:
	.byte 'T,'e,'m,'p,'e,'r,'a,'t,'u,'r,'e,32,'i,'s,32,37
	.byte 'd,32,'F,10,0
