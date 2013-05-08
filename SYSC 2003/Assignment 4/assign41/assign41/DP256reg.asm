*
*
*  Define HC12 I/O register locations (9S12DP256)
*
REGBS           EQU $0000    ; DP256 register bank base address

PORTA:          EQU REGBS+0   ;port A = Address lines A8 - A15
PORTB:          EQU REGBS+1   ;port B = Address lines A0 - A7
DDRA:           EQU REGBS+2   ;port A direction register
DDRB:           EQU REGBS+3   ;port A direction register

PORTE:          EQU REGBS+8   ;port E = mode,IRQandcontrolsignals
DDRE:           EQU REGBS+9   ;port E direction register
PEAR:           EQU REGBS+$A  ;port E assignments
MODE:           EQU REGBS+$B  ;Mode register
PUCR:           EQU REGBS+$C  ;port pull-up control register
RDRIV:          EQU REGBS+$D  ;port reduced drive control register
EBICTL:		EQU REGBS+$E  ;E stretch control

INITRM:         EQU REGBS+$10 ;Ram location register
INITRG:         EQU REGBS+$11 ;Register location register
INITEE:         EQU REGBS+$12 ;EEprom location register
MISC:           EQU REGBS+$13 ;Miscellaneous Mapping control
MTST0:          EQU REGBS+$14 ; RESERVED
ITCR:           EQU REGBS+$15 ;Interrupt test control register
ITEST:          EQU REGBS+$16 ;Interrupt test register
MTST1:          EQU REGBS+$17 ; Reserved

PARTIDH:	EQU REGBS+$1A ;Part ID high
PARTIDL:	EQU REGBS+$1B ;Part ID low
MEMSIZ0:	EQU REGBS+$1C ;memory size
MEMSIZ1:	EQU REGBS+$1D ;memory size
INTCR:          EQU REGBS+$1E ;interrupt control register
HPRIO:          EQU REGBS+$1F ;high priority reg

BKPCT0:         EQU REGBS+$28 ;Break control register
BKPCT1:         EQU REGBS+$29 ;Break control register
BKP0X:          EQU REGBS+$2A ; Break 0 index register
BKP0H:          EQU REGBS+$2B ; Break 0 pointer high
BRP0L:          EQU REGBS+$2C ; Break 0 pointer low
BKP1X:          EQU REGBS+$2D ; Break 1 index register
BKP1H:          EQU REGBS+$2E ; Break 1 pointer high
BRP1L:          EQU REGBS+$2F ; Break 1 pointer low
PPAGE:		EQU REGBS+$30 ;Program Page register

PORTK:		EQU REGBS+$32 ;Port K data
DDRK:		EQU REGBS+$33 ;Port K direction
SYNR:           EQU REGBS+$34 ; Synthesizer / multiplier register
REFDV:          EQU REGBS+$35 ; Reference divider register
CTFLG:          EQU REGBS+$36 ; RESERVED
CRGFLG:         EQU REGBS+$37 ; PLL flags register
CRGINT:         EQU REGBS+$38 ; PLL interrupt register
CLKSEL:         EQU REGBS+$39 ; Clock select register
PLLCTL:         EQU REGBS+$3A ; PLL control register
RTICTL:         EQU REGBS+$3B ;Real time interrupt control
COPCTL:         EQU REGBS+$3C ;Watchdog control
FORBYP:         EQU REGBS+$3D ;
CTCTL:          EQU REGBS+$3E ;
ARMCOP:         EQU REGBS+$3F ;COP reset register

TIOS:           EQU REGBS+$40 ;timer input/output select
CFORC:          EQU REGBS+$41 ;timer compare force
OC7M:           EQU REGBS+$42 ;timer output compare 7 mask
OC7D:           EQU REGBS+$43 ;timer output compare 7 data
TCNT:           EQU REGBS+$44 ;timer counter register hi
*TCNT:          EQU REGBS+$45 ;timer counter register lo
TSCR:           EQU REGBS+$46 ;timer system control register
TTOV:           EQU REGBS+$47 ;reserved
TCTL1:          EQU REGBS+$48 ;timer control register 1
TCTL2:          EQU REGBS+$49 ;timer control register 2
TCTL3:          EQU REGBS+$4A ;timer control register 3
TCTL4:          EQU REGBS+$4B ;timer control register 4
TMSK1:          EQU REGBS+$4C ;timer interrupt mask 1
TMSK2:          EQU REGBS+$4D ;timer interrupt mask 2
TFLG1:          EQU REGBS+$4E ;timer flags 1
TFLG2:          EQU REGBS+$4F ;timer flags 2
TC0:            EQU REGBS+$50 ;timer capture/compare register 0
*TC0:           EQU REGBS+$51 ;
TC1:            EQU REGBS+$52 ;timer capture/compare register 1
*TC1:           EQU REGBS+$53 ;
TC2:            EQU REGBS+$54 ;timer capture/compare register 2
*TC2:           EQU REGBS+$55 ;
TC3:            EQU REGBS+$56 ;timer capture/compare register 3
*TC3:           EQU REGBS+$57 ;
TC4:            EQU REGBS+$58 ;timer capture/compare register 4
*TC4:           EQU REGBS+$59 ;
TC5:            EQU REGBS+$5A ;timer capture/compare register 5
*TC5:           EQU REGBS+$5B ;
TC6:            EQU REGBS+$5C ;timer capture/compare register 6
*TC6:           EQU REGBS+$5D ;
TC7:            EQU REGBS+$5E ;timer capture/compare register 7
*TC7:           EQU REGBS+$5F ;
PACTL:          EQU REGBS+$60 ;pulse accumulator controls
PAFLG:          EQU REGBS+$61 ;pulse accumulator flags
PACN3:          EQU REGBS+$62 ;pulse accumulator counter 3
PACN2:          EQU REGBS+$63 ;pulse accumulator counter 2
PACN1:          EQU REGBS+$64 ;pulse accumulator counter 1
PACN0:          EQU REGBS+$65 ;pulse accumulator counter 0
MCCTL:          EQU REGBS+$66 ;Modulus down conunter control
MCFLG:          EQU REGBS+$67 ;down counter flags
ICPAR:          EQU REGBS+$68 ;Input pulse accumulator control
DLYCT:          EQU REGBS+$69 ;Delay count to down counter
ICOVW:          EQU REGBS+$6A ;Input control overwrite register
ICSYS:          EQU REGBS+$6B ;Input control system control

TIMTST:         EQU REGBS+$6D ;timer test register

PBCTL:          EQU REGBS+$70 ; Pulse accumulator B control
PBFLG:          EQU REGBS+$71 ; Pulse accumulator B flags
PA3H:           EQU REGBS+$72 ; Pulse Accumulator holding register 3
PA2H:           EQU REGBS+$73 ; Pulse Accumulator holding register 2
PA1H:           EQU REGBS+$74 ; Pulse Accumulator holding register 1
PA0H:           EQU REGBS+$75 ; Pulse Accumulator holding register 0
MCCNT:          EQU REGBS+$76 ; Modulus down counter register
*MCCNTL:        EQU REGBS+$77 ; low byte
TCOH:           EQU REGBS+$78 ; Capture 0 holding register
TC1H:           EQU REGBS+$7A ; Capture 1 holding register
TC2H:           EQU REGBS+$7C ; Capture 2 holding register
TC3H:           EQU REGBS+$7E ; Capture 3 holding register

ATD0CTL0:       EQU REGBS+$80 ;ADC control 0 (reserved)
ATD0CTL1:       EQU REGBS+$81 ;ADC control 1 (reserved)
ATD0CTL2:       EQU REGBS+$82 ;ADC control 2
ATD0CTL3:       EQU REGBS+$83 ;ADC control 3
ATD0CTL4:       EQU REGBS+$84 ;ADC control 4
ATD0CTL5:       EQU REGBS+$85 ;ADC control 5
ATD0STAT:       EQU REGBS+$86 ;ADC status register hi
*ATD0STAT       EQU REGBS+$87 ;ADC status register lo
ATD0TEST:       EQU REGBS+$88 ;ADC test (reserved)
*ATD0TEST       EQU REGBS+$89 ;

ATD0DIEN:	EQU REGBS+$8D ;

PORTAD:         EQU REGBS+$8F ;port ADC = input only
ADR00H:         EQU REGBS+$90 ;ADC result 0 register
ADR01H:         EQU REGBS+$92 ;ADC result 1 register
ADR02H:         EQU REGBS+$94 ;ADC result 2 register
ADR03H:         EQU REGBS+$96 ;ADC result 3 register
ADR04H:         EQU REGBS+$98 ;ADC result 4 register
ADR05H:         EQU REGBS+$9A ;ADC result 5 register
ADR06H:         EQU REGBS+$9C ;ADC result 6 register
ADR07H:         EQU REGBS+$9E ;ADC result 7 register

PWME:		EQU REGBS+$A0 ;PWM enable
PWMPOL:         EQU REGBS+$A1 ;PWM polarity
PWMCLK:         EQU REGBS+$A2 ;PWM clock select register
PWMPRCLK:       EQU REGBS+$A3 ;PWM Prescale clock select register
PWMCAE:         EQU REGBS+$A4 ;PWM center align select register
PWMCTL:         EQU REGBS+$A5 ;PWM control register
PWMTST:         EQU REGBS+$A6 ;reserved
PWMPRSC:        EQU REGBS+$A7 ;reserved
PWMSCLA:        EQU REGBS+$A8 ;PWM Scale A
PWMSCLB:        EQU REGBS+$A9 ;PWM scale B
PWMSCNTA:       EQU REGBS+$AA ;reserved
PWMSCNTB:       EQU REGBS+$AB ;reserved
PWMCNT0:        EQU REGBS+$AC ;PWM channel 0 counter
PWMCNT1:        EQU REGBS+$AD ;PWM channel 1 counter
PWMCNT2:        EQU REGBS+$AE ;PWM channel 2 counter
PWMCNT3:        EQU REGBS+$AF ;PWM channel 3 counter
PWMCNT4:        EQU REGBS+$B0 ;PWM channel 4 counter
PWMCNT5:        EQU REGBS+$B1 ;PWM channel 5 counter
PWMCNT6:        EQU REGBS+$B2 ;PWM channel 6 counter
PWMCNT7:        EQU REGBS+$B3 ;PWM channel 7 counter
PWMPER0:        EQU REGBS+$B4 ;PWM channel 0 period
PWMPER1:        EQU REGBS+$B5 ;PWM channel 1 period
PWMPER2:        EQU REGBS+$B6 ;PWM channel 2 period
PWMPER3:        EQU REGBS+$B7 ;PWM channel 3 period
PWMPER4:        EQU REGBS+$B8 ;PWM channel 4 period
PWMPER5:        EQU REGBS+$B9 ;PWM channel 5 period
PWMPER6:        EQU REGBS+$BA ;PWM channel 6 period
PWMPER7:        EQU REGBS+$BB ;PWM channel 7 period
PWMDTY0:        EQU REGBS+$BC ;PWM channel 0 duty cycle
PWMDTY1:        EQU REGBS+$BD ;PWM channel 1 duty cycle
PWMDTY2:        EQU REGBS+$BE ;PWM channel 2 duty cycle
PWMDTY3:        EQU REGBS+$BF ;PWM channel 3 duty cycle
PWMDTY4:        EQU REGBS+$C0 ;PWM channel 0 duty cycle
PWMDTY5:        EQU REGBS+$C1 ;PWM channel 1 duty cycle
PWMDTY6:        EQU REGBS+$C2 ;PWM channel 2 duty cycle
PWMDTY7:        EQU REGBS+$C3 ;PWM channel 3 duty cycle
PWMSDN:         EQU REGBS+$C4 ;PWM shutdown register

SC0BDH:         EQU REGBS+$C8 ;sci 0 baud reg hi byte
SC0BDL:         EQU REGBS+$C9 ;sci 0 baud reg lo byte
SC0CR1:         EQU REGBS+$CA ;sci 0 control1 reg
SC0CR2:         EQU REGBS+$CB ;sci 0 control2 reg
SC0SR1:         EQU REGBS+$CC ;sci 0 status reg 1
SC0SR2:         EQU REGBS+$CD ;sci 0 status reg 2
SC0DRH:         EQU REGBS+$CE ;sci 0 data reg hi
SC0DRL:         EQU REGBS+$CF ;sci 0 data reg lo
SC1BDH:         EQU REGBS+$D0 ;sci 1 baud reg hi byte
SC1BDL:         EQU REGBS+$D1 ;sci 1 baud reg lo byte
SC1CR1:         EQU REGBS+$D2 ;sci 1 control1 reg
SC1CR2:         EQU REGBS+$D3 ;sci 1 control2 reg
SC1SR1:         EQU REGBS+$D4 ;sci 1 status reg 1
SC1SR2:         EQU REGBS+$D5 ;sci 1 status reg 2
SC1DRH:         EQU REGBS+$D6 ;sci 1 data reg hi
SC1DRL:         EQU REGBS+$D7 ;sci 1 data reg lo
SPI0CR1:        EQU REGBS+$D8 ;spi 0 control1 reg
SPI0CR2:        EQU REGBS+$D9 ;spi 0 control2 reg
SPI0BR:         EQU REGBS+$DA ;spi 0 baud reg
SPI0SR:         EQU REGBS+$DB ;spi 0 status reg hi

SP0DR:          EQU REGBS+$DD ;spi 0 data reg

IBAD:		EQU REGBS+$E0 ;I2C Bus address register
IBFD:		EQU REGBS+$E1 ;I2C Bus frequency divider
IBCR:		EQU REGBS+$E2 ;I2C Bus control register
IBSR:		EQU REGBS+$E3 ;I2C Bus status register
IBDR:		EQU REGBS+$E4 ;I2C Bus message data register

DLCBCR1:	EQU REGBS+$E8 ;BDLC Control regsiter 1
DLCBSVR:	EQU REGBS+$E9 ;BDLC State vector register
DLCBCR2:	EQU REGBS+$EA ;BDLC Control register 2
DLCBDR:		EQU REGBS+$EB ;BDLC Data register
DLCBARD:	EQU REGBS+$EC ;BDLC Analog delay register
DLCBRSR:	EQU REGBS+$ED ;BDLC Rate select register
DLCSCR:		EQU REGBS+$EE ;BDLC Control register
DLCBSTAT:	EQU REGBS+$EF ;BDLC Status register
SPI1CR1:        EQU REGBS+$F0 ;spi 1 control1 reg
SPI1CR2:        EQU REGBS+$F1 ;spi 1 control2 reg
SPI1BR:         EQU REGBS+$F2 ;spi 1 baud reg
SPI1SR:         EQU REGBS+$F3 ;spi 1 status reg hi

SP1DR:          EQU REGBS+$F5 ;spi 1 data reg

SPI2CR1:        EQU REGBS+$F8 ;spi 2 control1 reg
SPI2CR2:        EQU REGBS+$F9 ;spi 2 control2 reg
SPI2BR:         EQU REGBS+$FA ;spi 2 baud reg
SPI2SR:         EQU REGBS+$FB ;spi 2 status reg hi

SP2DR:          EQU REGBS+$FD ;spi 2 data reg

FCLKDIV:	EQU REGBS+$100 ;FLASH clock divider
FSEC:		EQU REGBS+$101 ;FLASH security register

FCNFG:		EQU REGBS+$103 ;FLASH configuration register
FPROT:		EQU REGBS+$104 ;FLASH protection register
FSTAT:		EQU REGBS+$105 ;FLASH status register
FCMD:		EQU REGBS+$106 ;FLASH command register

ECLKDIV:	EQU REGBS+$110 ;EEPROM clock divider

ECNFG:		EQU REGBS+$113 ;EEPROM configuration register
EPROT:		EQU REGBS+$114 ;EEPROM protection register
ESTAT:		EQU REGBS+$115 ;EEPROM status register
ECMD:		EQU REGBS+$116 ;EEPROM command register

ATD1CTL0:       EQU REGBS+$120 ;ADC1 control 0 (reserved)
ATD1CTL1:       EQU REGBS+$121 ;ADC1 control 1 (reserved)
ATD1CTL2:       EQU REGBS+$122 ;ADC1 control 2
ATD1CTL3:       EQU REGBS+$123 ;ADC1 control 3
ATD1CTL4:       EQU REGBS+$124 ;ADC1 control 4
ATD1CTL5:       EQU REGBS+$125 ;ADC1 control 5
ATD1STAT:       EQU REGBS+$126 ;ADC1 status register hi
*ATD1STAT       EQU REGBS+$127 ;ADC1 status register lo
ATD1TEST:       EQU REGBS+$128 ;ADC1 test (reserved)
*ATD1TEST       EQU REGBS+$129 ;

ATDDIEN:	EQU REGBS+$12D ;ADC1 INPUT ENABLE REGISTER

PORTAD1:        EQU REGBS+$12F ;port ADC1 = input only
ADR10H:         EQU REGBS+$130 ;ADC1 result 0 register
ADR11H:         EQU REGBS+$132 ;ADC1 result 1 register
ADR12H:         EQU REGBS+$134 ;ADC1 result 2 register
ADR13H:         EQU REGBS+$136 ;ADC1 result 3 register
ADR14H:         EQU REGBS+$138 ;ADC1 result 4 register
ADR15H:         EQU REGBS+$13A ;ADC1 result 5 register
ADR16H:         EQU REGBS+$13C ;ADC1 result 6 register
ADR17H:         EQU REGBS+$13E ;ADC1 result 7 register
CAN0CTL0:	EQU REGBS+$140 ;CAN0 control register 0
CAN0CTL1:	EQU REGBS+$141 ;CAN0 control register 1
CAN0BTR0:	EQU REGBS+$142 ;CAN0 bus timing register 0
CAN0BTR1:	EQU REGBS+$143 ;CAN0 bus timing register 1
CAN0RFLG:	EQU REGBS+$144 ;CAN0 receiver flags
CAN0RIER:	EQU REGBS+$145 ;CAN0 receiver interrupt enables
CAN0TFLG:	EQU REGBS+$146 ;CAN0 transmit flags
CAN0TIER:	EQU REGBS+$147 ;CAN0 transmit interrupt enables
CAN0TARQ:	EQU REGBS+$148 ;CAN0 transmit message abort control
CAN0TAAK:	EQU REGBS+$149 ;CAN0 transmit message abort status
CAN0TBEL:	EQU REGBS+$14A ;CAN0 transmit buffer select
CAN0IDAC:	EQU REGBS+$14B ;CAN0 identfier acceptance control

CAN0RERR:	EQU REGBS+$14E ;CAN0 Receive error counter
CAN0TERR:	EQU REGBS+$14F ;CAN0 Transmit error counter
CAN0IDA0:	EQU REGBS+$150 ;CAN0 Identifier acceptance register 0
CAN0IDA1:	EQU REGBS+$151 ;CAN0 Identifier acceptance register 1
CAN0IDA2:	EQU REGBS+$152 ;CAN0 Identifier acceptance register 2
CAN0IDA3:	EQU REGBS+$153 ;CAN0 Identifier acceptance register 3
CAN0IDM0:	EQU REGBS+$154 ;CAN0 Identifier mask register 0
CAN0IDM1:	EQU REGBS+$155 ;CAN0 Identifier mask register 1
CAN0IDM2:	EQU REGBS+$156 ;CAN0 Identifier mask register 2
CAN0IDM3:	EQU REGBS+$157 ;CAN0 Identifier mask register 3
CAN0IDA4:	EQU REGBS+$158 ;CAN0 Identifier acceptance register 4
CAN0IDA5:	EQU REGBS+$159 ;CAN0 Identifier acceptance register 5
CAN0IDA6:	EQU REGBS+$15A ;CAN0 Identifier acceptance register 6
CAN0IDA7:	EQU REGBS+$15B ;CAN0 Identifier acceptance register 7
CAN0IDM4:	EQU REGBS+$15C ;CAN0 Identifier mask register 4
CAN0IDM5:	EQU REGBS+$15D ;CAN0 Identifier mask register 5
CAN0IDM6:	EQU REGBS+$15E ;CAN0 Identifier mask register 6
CAN0IDM7:	EQU REGBS+$15F ;CAN0 Identifier mask register 7
CAN0RXFG:	EQU REGBS+$160 ;CAN0 RX foreground buffer thru +$16F
CAN0TXFG:	EQU REGBS+$170 ;CAN0 TX foreground buffer thru +$17F

CAN1CTL0:	EQU REGBS+$180 ;CAN1 control register 0
CAN1CTL1:	EQU REGBS+$181 ;CAN1 control register 1
CAN1BTR0:	EQU REGBS+$182 ;CAN1 bus timing register 0
CAN1BTR1:	EQU REGBS+$183 ;CAN1 bus timing register 1
CAN1RFLG:	EQU REGBS+$184 ;CAN1 receiver flags
CAN1RIER:	EQU REGBS+$185 ;CAN1 receiver interrupt enables
CAN1TFLG:	EQU REGBS+$186 ;CAN1 transmit flags
CAN1TIER:	EQU REGBS+$187 ;CAN1 transmit interrupt enables
CAN1TARQ:	EQU REGBS+$188 ;CAN1 transmit message abort control
CAN1TAAK:	EQU REGBS+$189 ;CAN1 transmit message abort status
CAN1TBEL:	EQU REGBS+$18A ;CAN1 transmit buffer select
CAN1IDAC:	EQU REGBS+$18B ;CAN1 identfier acceptance control

CAN1RERR:	EQU REGBS+$18E ;CAN1 Receive error counter
CAN1TERR:	EQU REGBS+$18F ;CAN1 Transmit error counter
CAN1IDA0:	EQU REGBS+$190 ;CAN1 Identifier acceptance register 0
CAN1IDA1:	EQU REGBS+$191 ;CAN1 Identifier acceptance register 1
CAN1IDA2:	EQU REGBS+$192 ;CAN1 Identifier acceptance register 2
CAN1IDA3:	EQU REGBS+$193 ;CAN1 Identifier acceptance register 3
CAN1IDM0:	EQU REGBS+$194 ;CAN1 Identifier mask register 0
CAN1IDM1:	EQU REGBS+$195 ;CAN1 Identifier mask register 1
CAN1IDM2:	EQU REGBS+$196 ;CAN1 Identifier mask register 2
CAN1IDM3:	EQU REGBS+$197 ;CAN1 Identifier mask register 3
CAN1IDA4:	EQU REGBS+$198 ;CAN1 Identifier acceptance register 4
CAN1IDA5:	EQU REGBS+$199 ;CAN1 Identifier acceptance register 5
CAN1IDA6:	EQU REGBS+$19A ;CAN1 Identifier acceptance register 6
CAN1IDA7:	EQU REGBS+$19B ;CAN1 Identifier acceptance register 7
CAN1IDM4:	EQU REGBS+$19C ;CAN1 Identifier mask register 4
CAN1IDM5:	EQU REGBS+$19D ;CAN1 Identifier mask register 5
CAN1IDM6:	EQU REGBS+$19E ;CAN1 Identifier mask register 6
CAN1IDM7:	EQU REGBS+$19F ;CAN1 Identifier mask register 7
CAN1RXFG:	EQU REGBS+$1A0 ;CAN1 RX foreground buffer thru +$1AF
CAN1TXFG:	EQU REGBS+$1B0 ;CAN1 TX foreground buffer thru +$1BF

CAN2CTL0:	EQU REGBS+$1C0 ;CAN2 control register 0
CAN2CTL1:	EQU REGBS+$1C1 ;CAN2 control register 1
CAN2BTR0:	EQU REGBS+$1C2 ;CAN2 bus timing register 0
CAN2BTR1:	EQU REGBS+$1C3 ;CAN2 bus timing register 1
CAN2RFLG:	EQU REGBS+$1C4 ;CAN2 receiver flags
CAN2RIER:	EQU REGBS+$1C5 ;CAN2 receiver interrupt enables
CAN2TFLG:	EQU REGBS+$1C6 ;CAN2 transmit flags
CAN2TIER:	EQU REGBS+$1C7 ;CAN2 transmit interrupt enables
CAN2TARQ:	EQU REGBS+$1C8 ;CAN2 transmit message abort control
CAN2TAAK:	EQU REGBS+$1C9 ;CAN2 transmit message abort status
CAN2TBEL:	EQU REGBS+$1CA ;CAN2 transmit buffer select
CAN2IDAC:	EQU REGBS+$1CB ;CAN2 identfier acceptance control

CAN2RERR:	EQU REGBS+$1CE ;CAN2 Receive error counter
CAN2TERR:	EQU REGBS+$1CF ;CAN2 Transmit error counter
CAN2IDA0:	EQU REGBS+$1D0 ;CAN2 Identifier acceptance register 0
CAN2IDA1:	EQU REGBS+$1D1 ;CAN2 Identifier acceptance register 1
CAN2IDA2:	EQU REGBS+$1D2 ;CAN2 Identifier acceptance register 2
CAN2IDA3:	EQU REGBS+$1D3 ;CAN2 Identifier acceptance register 3
CAN2IDM0:	EQU REGBS+$1D4 ;CAN2 Identifier mask register 0
CAN2IDM1:	EQU REGBS+$1D5 ;CAN2 Identifier mask register 1
CAN2IDM2:	EQU REGBS+$1D6 ;CAN2 Identifier mask register 2
CAN2IDM3:	EQU REGBS+$1D7 ;CAN2 Identifier mask register 3
CAN2IDA4:	EQU REGBS+$1D8 ;CAN2 Identifier acceptance register 4
CAN2IDA5:	EQU REGBS+$1D9 ;CAN2 Identifier acceptance register 5
CAN2IDA6:	EQU REGBS+$1DA ;CAN2 Identifier acceptance register 6
CAN2IDA7:	EQU REGBS+$1DB ;CAN2 Identifier acceptance register 7
CAN2IDM4:	EQU REGBS+$1DC ;CAN2 Identifier mask register 4
CAN2IDM5:	EQU REGBS+$1DD ;CAN2 Identifier mask register 5
CAN2IDM6:	EQU REGBS+$1DE ;CAN2 Identifier mask register 6
CAN2IDM7:	EQU REGBS+$1DF ;CAN2 Identifier mask register 7
CAN2RXFG:	EQU REGBS+$1E0 ;CAN2 RX foreground buffer thru +$1EF
CAN2TXFG:	EQU REGBS+$1F0 ;CAN2 TX foreground buffer thru +$1FF

CAN3CTL0:	EQU REGBS+$200 ;CAN3 control register 0
CAN3CTL1:	EQU REGBS+$201 ;CAN3 control register 1
CAN3BTR0:	EQU REGBS+$202 ;CAN3 bus timing register 0
CAN3BTR1:	EQU REGBS+$203 ;CAN3 bus timing register 1
CAN3RFLG:	EQU REGBS+$204 ;CAN3 receiver flags
CAN3RIER:	EQU REGBS+$205 ;CAN3 receiver interrupt enables
CAN3TFLG:	EQU REGBS+$206 ;CAN3 transmit flags
CAN3TIER:	EQU REGBS+$207 ;CAN3 transmit interrupt enables
CAN3TARQ:	EQU REGBS+$208 ;CAN3 transmit message abort control
CAN3TAAK:	EQU REGBS+$209 ;CAN3 transmit message abort status
CAN3TBEL:	EQU REGBS+$20A ;CAN3 transmit buffer select
CAN3IDAC:	EQU REGBS+$20B ;CAN3 identfier acceptance control

CAN3RERR:	EQU REGBS+$20E ;CAN3 Receive error counter
CAN3TERR:	EQU REGBS+$20F ;CAN3 Transmit error counter
CAN3IDA0:	EQU REGBS+$210 ;CAN3 Identifier acceptance register 0
CAN3IDA1:	EQU REGBS+$211 ;CAN3 Identifier acceptance register 1
CAN3IDA2:	EQU REGBS+$212 ;CAN3 Identifier acceptance register 2
CAN3IDA3:	EQU REGBS+$213 ;CAN3 Identifier acceptance register 3
CAN3IDM0:	EQU REGBS+$214 ;CAN3 Identifier mask register 0
CAN3IDM1:	EQU REGBS+$215 ;CAN3 Identifier mask register 1
CAN3IDM2:	EQU REGBS+$216 ;CAN3 Identifier mask register 2
CAN3IDM3:	EQU REGBS+$217 ;CAN3 Identifier mask register 3
CAN3IDA4:	EQU REGBS+$218 ;CAN3 Identifier acceptance register 4
CAN3IDA5:	EQU REGBS+$219 ;CAN3 Identifier acceptance register 5
CAN3IDA6:	EQU REGBS+$21A ;CAN3 Identifier acceptance register 6
CAN3IDA7:	EQU REGBS+$21B ;CAN3 Identifier acceptance register 7
CAN3IDM4:	EQU REGBS+$21C ;CAN3 Identifier mask register 4
CAN3IDM5:	EQU REGBS+$21D ;CAN3 Identifier mask register 5
CAN3IDM6:	EQU REGBS+$21E ;CAN3 Identifier mask register 6
CAN3IDM7:	EQU REGBS+$21F ;CAN3 Identifier mask register 7
CAN3RXFG:	EQU REGBS+$220 ;CAN3 RX foreground buffer thru +$22F
CAN3TXFG:	EQU REGBS+$230 ;CAN3 TX foreground buffer thru +$23F

PTT:		EQU REGBS+$240 ;portT data register
PTIT:		EQU REGBS+$241 ;portT input register
DDRT:		EQU REGBS+$242 ;portT direction register
RDRT:		EQU REGBS+$243 ;portT reduced drive register
PERT:		EQU REGBS+$244 ;portT pull device enable
PPST:		EQU REGBS+$245 ;portT pull polarity select

PTS:		EQU REGBS+$248 ;portS data register
PTIS:		EQU REGBS+$249 ;portS input register
DDRS:		EQU REGBS+$24A ;portS direction register
RDRS:		EQU REGBS+$24B ;portS reduced drive register
PERS:		EQU REGBS+$24C ;portS pull device enable
PPSS:		EQU REGBS+$24D ;portS pull polarity select
WOMS:		EQU REGBS+$24E ;portS Wired Or mode register

PTM:		EQU REGBS+$250 ;portM data register
PTIM:		EQU REGBS+$251 ;portM input register
DDRM:		EQU REGBS+$252 ;portM direction register
RDRM:		EQU REGBS+$253 ;portM reduced drive register
PERM:		EQU REGBS+$254 ;portM pull device enable
PPSM:		EQU REGBS+$255 ;portM pull polarity select
WOMM:		EQU REGBS+$256 ;portM Wired Or mode register
MODRR:		EQU REGBS+$257 ;portM Module routing register
PTP:		EQU REGBS+$258 ;portP data register
PTIP:		EQU REGBS+$259 ;portP input register
DDRP:		EQU REGBS+$25A ;portP direction register
RDRP:		EQU REGBS+$25B ;portP reduced drive register
PERP:		EQU REGBS+$25C ;portP pull device enable
PPSP:		EQU REGBS+$25D ;portP pull polarity select
PIEP:		EQU REGBS+$25E ;portP interrupt enable register
PIFP:		EQU REGBS+$25F ;portP interrupt flag register
PTH:		EQU REGBS+$260 ;portH data register
PTIH:		EQU REGBS+$261 ;portH input register
DDRH:		EQU REGBS+$262 ;portH direction register
RDRH:		EQU REGBS+$263 ;portH reduced drive register
PERH:		EQU REGBS+$264 ;portH pull device enable
PPSH:		EQU REGBS+$265 ;portH pull polarity select
PIEH:		EQU REGBS+$266 ;portH interrupt enable register
PIFH:		EQU REGBS+$267 ;portH interrupt flag register
PTJ:		EQU REGBS+$268 ;portP data register
PTIJ:		EQU REGBS+$269 ;portP input register
DDRJ:		EQU REGBS+$26A ;portP direction register
RDRJ:		EQU REGBS+$26B ;portP reduced drive register
PERJ:		EQU REGBS+$26C ;portP pull device enable
PPSJ:		EQU REGBS+$26D ;portP pull polarity select
PIEJ:		EQU REGBS+$26E ;portP interrupt enable register
PIFJ:		EQU REGBS+$26F ;portP interrupt flag register

CAN4CTL0:	EQU REGBS+$280 ;CAN4 control register 0
CAN4CTL1:	EQU REGBS+$281 ;CAN4 control register 1
CAN4BTR0:	EQU REGBS+$282 ;CAN4 bus timing register 0
CAN4BTR1:	EQU REGBS+$283 ;CAN4 bus timing register 1
CAN4RFLG:	EQU REGBS+$284 ;CAN4 receiver flags
CAN4RIER:	EQU REGBS+$285 ;CAN4 receiver interrupt enables
CAN4TFLG:	EQU REGBS+$286 ;CAN4 transmit flags
CAN4TIER:	EQU REGBS+$287 ;CAN4 transmit interrupt enables
CAN4TARQ:	EQU REGBS+$288 ;CAN4 transmit message abort control
CAN4TAAK:	EQU REGBS+$289 ;CAN4 transmit message abort status
CAN4TBEL:	EQU REGBS+$28A ;CAN4 transmit buffer select
CAN4IDAC:	EQU REGBS+$28B ;CAN4 identfier acceptance control

CAN4RERR:	EQU REGBS+$28E ;CAN4 Receive error counter
CAN4TERR:	EQU REGBS+$28F ;CAN4 Transmit error counter
CAN4IDA0:	EQU REGBS+$290 ;CAN4 Identifier acceptance register 0
CAN4IDA1:	EQU REGBS+$291 ;CAN4 Identifier acceptance register 1
CAN4IDA2:	EQU REGBS+$292 ;CAN4 Identifier acceptance register 2
CAN4IDA3:	EQU REGBS+$293 ;CAN4 Identifier acceptance register 3
CAN4IDM0:	EQU REGBS+$294 ;CAN4 Identifier mask register 0
CAN4IDM1:	EQU REGBS+$295 ;CAN4 Identifier mask register 1
CAN4IDM2:	EQU REGBS+$296 ;CAN4 Identifier mask register 2
CAN4IDM3:	EQU REGBS+$297 ;CAN4 Identifier mask register 3
CAN4IDA4:	EQU REGBS+$298 ;CAN4 Identifier acceptance register 4
CAN4IDA5:	EQU REGBS+$299 ;CAN4 Identifier acceptance register 5
CAN4IDA6:	EQU REGBS+$29A ;CAN4 Identifier acceptance register 6
CAN4IDA7:	EQU REGBS+$29B ;CAN4 Identifier acceptance register 7
CAN4IDM4:	EQU REGBS+$29C ;CAN4 Identifier mask register 4
CAN4IDM5:	EQU REGBS+$29D ;CAN4 Identifier mask register 5
CAN4IDM6:	EQU REGBS+$29E ;CAN4 Identifier mask register 6
CAN4IDM7:	EQU REGBS+$29F ;CAN4 Identifier mask register 7
CAN4RXFG:	EQU REGBS+$2A0 ;CAN4 RX foreground buffer thru +$2AF
CAN4TXFG:	EQU REGBS+$2B0 ;CAN4 TX foreground buffer thru +$2BF

* End registers
