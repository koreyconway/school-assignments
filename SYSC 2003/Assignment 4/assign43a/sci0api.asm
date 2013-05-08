;******************************************************************************************************
;SCI0 Routines - Lloyd Atkinson, Nov 2003
;******************************************************************************************************

;Note: Simulator automatically matches to any baud rate
BAUD9600	EQU	0052	;9600 Divider  (8MHz ECLK) Used for Mon12
BAUD19K		EQU	0026	;19200 Divider (8MHz ECLK) Used for NoICE

;***********************************************************************
;void setbaud(int baudRate)
;
;Sets up SCI0 with baud rate specified in D
;Sets up SC0CR1 with Wakeup By Address Mark and Long Idle Time enabled
;Enables Receiver & Transmitter
;***********************************************************************

setbaud:
	;Setup SCI for receive
		;Set Baud Rate
		staa SC0BDH
		stab SC0BDL
		;Setup SC0CR1 with Wakeup By Address Mark and Long Idle Time enabled
		movb #$0C, SC0CR1
		;Enable Receiver&Transmitter
		bset SC0CR2, #$0C
	rts

;*********************************************************************************
putStr_sc0: 
;Accepts: Start address of output string in Y
;Returns: Nothing
;Destroys: Nothing
;Given a start address in Y, outputs string until 
;it finds null, it does not ouput the null
;*********************************************************************************
	pshd

	;Init Counter
	ldaa #0
PutStr:	
	;Get character
	ldab A, Y
	;Put Character
	jsr putChar_sc0
	;Test for Done
	cmpb #0
	beq DonePutStr
		;Not done yet
		inca
		bra PutStr

DonePutStr:
	puld
	rts
	
;*********************************************************************************
putChar_sc0: 
;Accepts: Character for output in B
;Returns: Nothing
;Destroys: Nothing
;Given a character in B, polls 'Transmit Data Register Empty Flag'(TDRE) of SC0SR1
;until it goes high.  Then places new character in SC0DRL data register for output
;*********************************************************************************	
	;If SC0SR1 Bit 7 is high then we may write another byte for output
	brclr SC0SR1, #$80, putChar_sc0
	;Write next character to the Data Register
	stab SC0DRL
	rts


;*********************************************************************************
getChar_sc0: 
;Accepts: Nothing
;Returns: Input character from SCI0
;Destroys: B
;Polls 'Receive Data Register Flag' (RDRF) of SC0SR1 until it goes high.
;Then places new character from SC0DRL in B
;*********************************************************************************	
	;If SC0SR1 Bit 5 is high, there is a new character in SC0DRL
	brclr SC0SR1, #$20, getChar_sc0
	;Read in new character from the Data Register
	ldab SC0DRL
	rts