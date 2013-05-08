.include "DP256reg.s"

; ========================================================
;	basicLCD	Include file with minimal support 
;			for LCD
;	Requires : dp256reg.asm
;
;	Hacked from Lcd_2PP.asm:     L  Parallel Lcd Driver 
;         Version:       1.0   Released 11/01/2002
;          Author:       Gary Karnes , Axiom Manufacturing
;        Compiler:       Asm12
;        Platform:       CML12S & PROJECT BOARD 
;
; ========================================================
;
; Equates
U21_N = $01           ; LCD unused pin
LCD_RW = $02          ; LCD RW select (PT1)
LCD_RS = $04          ; LCD RS select	(PT2)
LCD_EN = $08          ; LCD EN select	(PT3)
U21_EN = $80

_LCD_instruction::
	 pshd
	 pshx
	 pshy
	 tba
	 jsr LD2PP_Instruction
	 puly
	 pulx
	 puld
	 rts
_LCD_display::
 	 pshd
	 pshx
	 pshy
	 tba
	 jsr LCD2PP_Data
	 puly
	 pulx
	 puld
	 rts
	 
;-----------
_Lcd2PP_Init::
	 pshd
	 pshx
	 pshy
	 jsr Lcd2PP_Init
	 puly
	 pulx
	 puld
	 rts	
	  
Lcd2PP_Init:	; Note : Use 4-bit init sequence (not 8-bit)  Page 3 LCD_spec.pdf
		; Bottom table contains sequence of instructions
		; Each row in the table represents one WRITE to the LCD instruction register (via Port P)
		;	First instruction involves only a 4-bit instruction (one WRITE)
		;	Following instructions involve 8 bit instruction, therefore
		;		2 * 4-bit writes

	; "System init"
	; Setup Port T for output
          movb #$0F,DDRT        ; setup port T
          movb #$00,PTT         ; all low
	; Disable SPI AND setup SPI1 as four output bits
	      bset  DDRP,#$0F   	; set P0-3 as outputs
          bclr  SPI1CR1,#$40  	; Disable SP by turning SPI1 off

          movb #$FE,DDRM        ; set PM1-7 as outputs
          movb #$00,PTM         ; D.P.(PM2) = Off, U7_EN(PM3)= low,
                                ; SS0*(PM4), SS1*(PM5), SS2*(PM6) = Low
                                ; Heat(PM7) = Off

          bclr    PTT,LCD_RW+LCD_RS+LCD_EN  ; select lcd commands Cs=0 En=0

          jsr      DELAY50M
          ldaa     #$02		; Set to 4-bit operation (0010)
          jsr      LCD2PP_4     ; This first instruction is only 4 bits long!!!  Rest are 8 bits.  
          jsr      DELAY50M

        ;  ldaa     #$2c		; Function Set = 001(D/L)NF** where D/L = 0(4-bit) N=1(2-lines) F=0(font=5x7 dots)
          ldaa     #$28		; Function Set = 001(D/L)NF** where D/L = 0(4-bit) N=1(2-lines) F=0(font=5x7 dots)
          jsr      LD2PP_Instruction         
          jsr      DELAY10M         

          ldaa      #$0e	; Display On/off Control = 00001DCB where D=1(display on) C=1(cursor on) B=0 (blink off)
          jsr      LD2PP_Instruction          
          jsr      DELAY10M          
                
          ldaa     #$01		; Clear display = 00000001
          jsr      LD2PP_Instruction           
          jsr      DELAY20M          
          ldaa     #$80		; DDRAM Address Set = 01xxxxxx where xxxxxx = address
          jsr      LD2PP_Instruction
          jsr      DELAY10M        

; Reset Lcd states to rest
         bclr    PTT,LCD_RS+LCD_RW+LCD_EN ; turn all signals off on lcd
          rts
;
;-----------------------------------------------
; Lcd Routines
;
; Write a byte to the LCD Data Register
LCD2PP_Data:
      bset  PTT,LCD_RS     ; select lcd data buffer RS=1
      jsr   LCD_W_8        ; write byte
      rts

; Write a byte to the LCD Instruction Register (leaves LCD in Data mode)
LD2PP_Instruction:
        bclr   PTT,LCD_RS        ; select lcd command buffer
        jsr    LCD_W_8           ; wait
        bset   PTT,LCD_RS        ; select data buffer
        rts

LCD2PP_4:			; Destroys a and b
	 bset  	PTS,#U21_EN	; set U21_EN high so that latch becomes transparent
         jsr      DELAY1MS      ; delay     
         ldab     PTP              ; Port P
         andb     #$f0             ; get only bits 4 - 7
         anda     #$0f             ; get data
         aba
         staa     PTP              ; save data 
	; For LCD's write cycle, Enable must pulse high and then low (for specified time)
         bclr     PTT,LCD_EN       ; enable low
         jsr      DELAY1MS         ; delay for LCD
         bset     PTT,LCD_EN       ; latch data
         jsr      DELAY1MS         ; delay for LCD 
         bclr     PTT,LCD_EN           ; enable low
         jsr      DELAY1MS
	 bclr  PTS,#U21_EN    ; set U21_EN low to isolate LCD from parallel control (outputs are latched)
         rts
;
;
; Lcd Write 8 bit Data , lower 4 bits first in acc A   (Destroys A)
LCD_W_8:					
         psha                     ; save a 
         lsra                     ; shift upper 4 bits to lower
         lsra
         lsra
         lsra
         jsr      LCD2PP_4        ; write upper 4 bits to lcd
         pula
         jsr      LCD2PP_4         ; write lower 4 bits to lcd
         rts
					

;
; Delay routines
;
;
; Generate a 50 ms delay
DELAY50M:
          pshx
          ldx  #49998      ; delay 50,000 usecs,
          jsr  DELML01     ; call usec delay
          pulx
          rts
;
;
; Generate a 20 ms delay
DELAY20M:
          bsr  DELAY10M
          bsr  DELAY10M 
          rts
;
; Generate a 10 ms delay
DELAY10M:                            ; jsr=4cyles
          pshx             ; 2 cycles ,save x
          ldx  #9998       ; 2 cycles,delay 9998 usec + 2 for this routine
          jsr  DELML01     ; call usec delay, this delay offset in sub
          pulx             ; 3 cycles restore x
          rts              ; 5 cycles
;
;
; Generate a 1 ms delay
DELAY1MS:
                           ; jsr=4cyles
          pshx             ; 2 cycles ,save x
          ldx  #998       ; 2 cycles,delay 9998 usec + 2 for this routine
          jsr  DELML01     ; call usec delay, this delay offset in sub
          pulx             ; 3 cycles restore x
          rts              ; 5 cycles


;
; 8 cycles = 1 usec e = 8mhz
DELML01:
          nop              ; 1 cycle
          nop              ; 1 cycle
          nop              ; 1 cycle
          nop              ; 1 cycle
          dex              ; 1 cycle 
          bne   DELML01    ; 3 cycles
          rts              ; 5 cycles
