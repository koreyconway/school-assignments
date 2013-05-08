	.module LCD_test.c
	.include 'BasicLCD.s'

	.area text
	.dbfile LCD_test.c
	.dbfunc e main _main fV
_main::
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e clearScreen _clearScreen fV
_clearScreen::
	.dbline 0 ; func end
	rts
	.dbend
	.dbfunc e DisplayLCD _DisplayLCD fV
;        string2 -> 8,x
;        string1 -> 6,x
;         string -> 2,x
_DisplayLCD::
	.dbline 0 ; func end
	rts
	.dbsym l string2 8 pc
	.dbsym l string1 6 pc
	.dbsym l string 2 pc
	.dbend
	.dbfunc e delay _delay fV
;             ms -> 2,x
_delay::
	.dbline 0 ; func end
	rts
	.dbsym l ms 2 I
	.dbend
L5:
	.byte 32,0
