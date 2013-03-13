#ifndef __HCS12DP256_H
#define __HCS12DP256_H

/* macros, generic #define etc.
 */
#include <hc12def.h>

/* base address of register block, change this if you relocate the register
 * block. This is for S12DP256 !
 */

#define _IO_BASE        0
#define _ADDR(off)      (unsigned char volatile *)(_IO_BASE + off)
#define _P(off)         *(unsigned char volatile *)(_IO_BASE + off)
#define _LP(off)        *(unsigned short volatile *)(_IO_BASE + off)

#define PORTA   _P(0x00)
#define PORTB   _P(0x01)
#define DDRA    _P(0x02)
#define DDRB    _P(0x03)

//#define Reserved      _P(0x04)
//#define Reserved      _P(0x05)
//#define Reserved      _P(0x06)
//#define Reserved      _P(0x07)

#define PORTE   _P(0x08)
#define DDRE    _P(0x09)
#define PEAR    _P(0x0A)
#define MODE    _P(0x0B)
#define PUCR    _P(0x0C)
#define RDRIV   _P(0x0D)
#define EBICTL  _P(0x0E)

//#define reserved      _P(0x0F)

#define INITRM  _P(0x10)
#define INITRG  _P(0x11)
#define INITEE  _P(0x12)
#define MISC    _P(0x13)
#define MTST0   _P(0x14)
#define ITCR    _P(0x15)
#define ITEST   _P(0x16)
#define MIST1   _P(0x17)

//#define Reserved      _P(0x18)
//#define Reserved      _P(0x19)

#define PARTIDH  _P(0x1A)
#define PARTIDL  _P(0x1B)
#define PARTID   _LP(0x1A)

#define MEMSIZ0  _P(0x1C)
#define MEMSIZ1  _P(0x1D)
#define INTCR    _P(0x1E)
#define HPRIO    _P(0x1F)

//#define Reserved      _P(0x20)
//#define Reserved      _P(0x21)
//#define Reserved      _P(0x22)
//#define Reserved      _P(0x23)
//#define Reserved      _P(0x24)
//#define Reserved      _P(0x25)
//#define Reserved      _P(0x26)
//#define Reserved      _P(0x27)

#define BKPCT0   _P(0x28)
#define BKPCT1   _P(0x29)
#define BKP0X    _P(0x2A)
#define BKP0H    _P(0x2B)
#define BKP0L    _P(0x2C)
#define BKP0     _LP(0x2B)

#define BKP1X    _P(0x2D)
#define BKP1H    _P(0x2E)
#define BKP1L    _P(0x2F)
#define BKP1     _LP(0x2E)

#define PPAGE     _P(0x30)

//#define Reserved      _P(0x31)

#define PORTK    _P(0x32)
#define DDRK     _P(0x33)
#define SYNR     _P(0x34)
#define REFDV    _P(0x35)
#define CTFLG    _P(0x36)
#define CRGFLG   _P(0x37)
#define CRGINT   _P(0x38)
#define CLKSEL   _P(0x39)
#define PLLCTL   _P(0x3A)
#define RTICTL   _P(0x3B)
#define COPCTL   _P(0x3C)
#define FORBYP   _P(0x3D)
#define CTCTL    _P(0x3E)
#define ARMCOP   _P(0x3F)

#define TIOS     _P(0x40)
#define TCFORC   _P(0x41)
#define TOC7M    _P(0x42)
#define TOC7D    _P(0x43)

#define TCNT     _LP(0x44)

#define TSCR1    _P(0x46)
#define TTOV     _P(0x47)
#define TCTL1    _P(0x48)
#define TCTL2    _P(0x49)
#define TCTL3    _P(0x4A)
#define TCTL4    _P(0x4B)
#define TIE      _P(0x4C)
#define TSCR2    _P(0x4D)
#define TFLG1    _P(0x4E)
#define TFLG2    _P(0x4F)

#define TC0      _LP(0x50)
#define TC1      _LP(0x52)
#define TC2      _LP(0x54)
#define TC3      _LP(0x56)
#define TC4      _LP(0x58)
#define TC5      _LP(0x5A)
#define TC6      _LP(0x5C)
#define TC7      _LP(0x5E)

#define PACTL     _P(0x60)
#define PAFLG     _P(0x61)
#define PACN3     _P(0x62)
#define PACN2     _P(0x63)
#define PACN1     _P(0x64)
#define PACN0     _P(0x65)
#define MCCTL     _P(0x66)
#define MCFLG     _P(0x67)
#define ICPAR     _P(0x68)
#define DLYCT     _P(0x69)
#define ICOVW     _P(0x6A)
#define ICSYS     _P(0x6B)

//#define Reserved      _P(0x6C)

#define TIMTST     _P(0x6D)

//#define Reserved      _P(0x6E)
//#define Reserved      _P(0x6F)

#define PBCTL   _P(0x70)
#define PBFLG   _P(0x71)
#define PA3H    _P(0x72)
#define PA2H    _P(0x73)
#define PA1H    _P(0x74)
#define PA0H    _P(0x75)

#define MCCNT   _LP(0x76)
#define TC0H    _LP(0x78)
#define TC1H    _LP(0x7A)
#define TC2H    _LP(0x7C)
#define TC3H    _LP(0x7E)

#define ATD0CTL0  _P(0x80)
#define ATD0CTL1  _P(0x81)
#define ATD0CTL2  _P(0x82)
#define ATD0CTL3  _P(0x83)
#define ATD0CTL4  _P(0x84)
#define ATD0CTL5  _P(0x85)

#define ATD0STAT    _LP(0x86)
#define ATD0STAT0   _P(0x86)
#define ATD0STAT1   _P(0x8B)
#define AID0TEST0   _P(0x88)
#define AID0TEST1   _P(0x89)

//#define Reserved      _P(0x8A)
//#define Reserved      _P(0x8B)
//#define Reserved      _P(0x8C)

#define ATD0DIEN   _P(0x8D)

//#define Reserved      _P(0x8E)

#define PORTAD0   _P(0x8F)

#define ATD0DR0H  _P(0x90)
#define ATD0DR0L  _P(0x91)
#define ATD0DR0   _LP(0x90)

#define ATD0DR1H  _P(0x92)
#define ATD0DR1L  _P(0x93)
#define ATD0DR1   _LP(0x92)

#define ATD0DR2H _P(0x94)
#define ATD0DR2L _P(0x95)
#define ATD0DR2  _LP(0x94)

#define ATD0DR3H _P(0x96)
#define ATD0DR3L _P(0x97)
#define ATD0DR3  _LP(0x96)

#define ATD0DR4H _P(0x98)
#define ATD0DR4L _P(0x99)
#define ATD0DR4  _LP(0x98)

#define ATD0DR5H _P(0x9A)
#define ATD0DR5L _P(0x9B)
#define ATD0DR5  _LP(0x9A)

#define ATD0DR6H _P(0x9C)
#define ATD0DR6L _P(0x9D)
#define ATD0DR6  _LP(0x9C)

#define ATD0DR7H _P(0x9E)
#define ATD0DR7L _P(0x9F)
#define ATD0DR7  _LP(0x9E)

#define PWME     _P(0xA0)
#define PWMPOL   _P(0xA1)
#define PWMCLK   _P(0xA2)
#define PWMPRCLK _P(0xA3)
#define PWMCAE   _P(0xA4)
#define PWMCTL   _P(0xA5)
#define PWMTST   _P(0xA6)
#define PWMPRSC  _P(0xA7)
#define PWMSCLA  _P(0xA8)
#define PWMSCLB  _P(0xA9)
#define PWMSCNTA _P(0xAA)
#define PWMSCNTB _P(0xAB)

#define PWMCNT0  _P(0xAC)
#define PWMCNT1  _P(0xAD)
#define PWMCNT2  _P(0xAE)
#define PWMCNT3  _P(0xAF)
#define PWMCNT4  _P(0xB0)
#define PWMCNT5  _P(0xB1)
#define PWMCNT6  _P(0xB2)
#define PWMCNT7  _P(0xB3)

#define PWMPER0  _P(0xB4)
#define PWMPER1  _P(0xB5)
#define PWMPER2  _P(0xB6)
#define PWMPER3  _P(0xB7)
#define PWMPER4  _P(0xB8)
#define PWMPER5  _P(0xB9)
#define PWMPER6  _P(0xBA)
#define PWMPER7  _P(0xBB)

#define PWMDTY0  _P(0xBC)
#define PWMDTY1  _P(0xBD)
#define PWMDTY2  _P(0xBE)
#define PWMDTY3  _P(0xBF)
#define PWMDTY4  _P(0xC0)
#define PWMDTY5  _P(0xC1)
#define PWMDTY6  _P(0xC2)
#define PWMDTY7  _P(0xC3)

#define PWMSDN   _P(0xC4)

//#define Reserved      _P(0xC5)
//#define Reserved      _P(0xC6)
//#define Reserved      _P(0xC7)

#define SCI0BDH  _P(0xC8)
#define SCI0BDL  _P(0xC9)
#define SCI0BD   _LP(0xC8)

#define SC0CR1   _P(0xCA)
#define SCI0CR1  _P(0xCA)
#define SCI0CR2  _P(0xCB)

#define SCI0SR1  _P(0xCC)
#define SC0SR1	SCI0SR1		/* compatability */
#define SC0SR2   _P(0xCD)
#define SCI0SR2  _P(0xCD)

#define SCI0DRH  _P(0xCE)
#define SCI0DRL  _P(0xCF)
#define SC0DRL	SCI0DRL		/* compatability */
#define SCI0DR   _LP(0xCE)

#define SCI1BDH  _P(0xD0)
#define SCI1BDL  _P(0xD1)
#define SCI1BD   _LP(0xD0)

#define SCI1CR1   _P(0xD2)
#define SCI1CR2   _P(0xD3)
#define SCI1SR1   _P(0xD4)
#define SCI1SR2   _P(0xD5)

#define SCI1DRH   _P(0xD6)
#define SCI1DRL   _P(0xD7)
#define SCI1DR    _LP(0xD6)

#define SPI0CR1   _P(0xD8)
#define SPI0CR2   _P(0xD9)
#define SPI0BR    _P(0xDA)
#define SPI0SR    _P(0xDB)

//#define Reserved      _P(0xDC)

#define SPI0DR    _P(0xDD)

//#define Reserved      _P(0xDE)
//#define Reserved      _P(0xDF)

#define IBAD    _P(0xE0)
#define IBFD    _P(0xE1)
#define IBCR    _P(0xE2)
#define IBSR    _P(0xE3)
#define IICDR   _P(0xE4)

//#define Reserved      _P(0xE5)
//#define Reserved      _P(0xE6)
//#define Reserved      _P(0xE7)

#define DLCBCR1  _P(0xE8)
#define DLCBSVR  _P(0xE9)
#define DLCBCR2  _P(0xEA)
#define DLCBDR   _P(0xEB)
#define DLCBARD  _P(0xEC)
#define DLCBRSR  _P(0xED)
#define DLCSCR   _P(0xEE)
#define DLCBSCR  _P(0xEE)
#define DLCBSTAT _P(0xEF)

//alternate possible names for registers
#define BDLCCR1  _P(0xE8)
#define BDLCSVR  _P(0xE9)
#define BDLCCR2  _P(0xEA)
#define BDLCDR   _P(0xEB)
#define BDLCARD  _P(0xEC)
#define BDLCRSR  _P(0xED)
#define BDLCSCR  _P(0xEE)
#define BDLCSTAT _P(0xEF)

#define SPI1CR1  _P(0xF0)
#define SPI1CR2  _P(0xF1)
#define SPI1BR   _P(0xF2)
#define SPI1SR  _P(0xF3)

//#define Reserved      _P(0xF4)

#define SPI1DR  _P(0xF5)

//#define Reserved      _P(0xF6)
//#define Reserved      _P(0xF7)

#define SPI2CR1 _P(0xF8)
#define SPI2CR2 _P(0xF9)
#define SPI2BR  _P(0xFA)
#define SPI2SR  _P(0xFB)

//#define Reserved      _P(0xFC)

#define SPI2DR  _P(0xFD)

//#define Reserved _P(0xFE)
//#define Reserved _P(0xFF)


#define FCLKDIV _P(0x0100)
#define FSEC    _P(0x0101)
#define C0BTR0  _P(0x0102)

//#define Reserved for Factory Test _P(0x0102)

#define FCNFG  _P(0x0103)
#define FPROT  _P(0x0104)
#define FSTAT  _P(0x0105)
#define FCMD   _P(0x0106)

//#define Reserved for Factory Test _P(0x0107)
//#define Reserved for Factory Test _P(0x0108)
//#define Reserved for Factory Test _P(0x0109)
//#define Reserved for Factory Test _P(0x010A)
//#define Reserved for Factory Test _P(0x010B)

//#define Reserved _P(0x010C)
//#define Reserved _P(0x010D)
//#define Reserved _P(0x010E)
//#define Reserved _P(0x010F)

#define ECLKDIV  _P(0x0110)

//#define Reserved _P(0x0111)
//#define Reserved for Factory Test _P(0x0112)

#define ECNFG      _P(0x0113)
#define EPROT      _P(0x0114)
#define ESTAT      _P(0x0115)
#define ECMD       _P(0x0116)

//#define Reserved for Factory Test _P(0x0117)
//#define Reserved for Factory Test _P(0x0118)
//#define Reserved for Factory Test _P(0x0119)
//#define Reserved for Factory Test _P(0x011A)
//#define Reserved for Factory Test _P(0x011B)

//#define Reserved _P(0x011C)
//#define Reserved _P(0x011D)
//#define Reserved _P(0x011E)
//#define Reserved _P(0x011F)

#define ATD1CTL0  _P(0x0120)
#define ATD1CTL1  _P(0x0121)
#define ATD1CTL2  _P(0x0122)
#define ATD1CTL3  _P(0x0123)
#define ATD1CTL4  _P(0x0124)
#define ATD1CTL5  _P(0x0125)

#define ATD1STAT0 _P(0x0126)
#define ATD1STAT1 _P(0x012B)

#define ATD1TEST0 _P(0x0128)
#define ATD1TEST1 _P(0x0129)

//#define Reserved _P(0x012A)
//#define Reserved _P(0x012B)
//#define Reserved _P(0x012C)

#define ATDDIEN   _P(0x012D)
#define ATD1DIEN  _P(0x012D)

//#define Reserved _P(0x012E)

#define PORTAD1   _P(0x012F)

#define ATD1DR0H  _P(0x0130)
#define ATD1DR0L  _P(0x0131)
#define ATD1DR0   _LP(0x0130)

#define ATD1DR1H  _P(0x0132)
#define ATD1DR1L  _P(0x0133)
#define ATD1DR1   _LP(0x0132)

#define ATD1DR2H  _P(0x0134)
#define ATD1DR2L  _P(0x0135)
#define ATD1DR2   _LP(0x0134)

#define ATD1DR3H  _P(0x0136)
#define ATD1DR3L  _P(0x0137)
#define ATD1DR3   _LP(0x0136)

#define ATD1DR4H  _P(0x0138)
#define ATD1DR4L  _P(0x0139)
#define ATD1DR4   _LP(0x0138)

#define ATD1DR5H  _P(0x013A)
#define ATD1DR5L  _P(0x013B)
#define ATD1DR5   _LP(0x013A)

#define ATD1DR6H  _P(0x013C)
#define ATD1DR6L  _P(0x013D)
#define ATD1DR6   _LP(0x013C)

#define ATD1DR7H  _P(0x013E)
#define ATD1DR7L  _P(0x013F)
#define ATD1DR7   _LP(0x013E)

#define CAN0CTL0  _P(0x0140)
#define CAN0CTL1  _P(0x0141)
#define CAN0BTR0  _P(0x0142)
#define CAN0BTR1  _P(0x0143)
#define CAN0RFLG  _P(0x0144)
#define CAN0RIER  _P(0x0145)
#define CAN0TFLG  _P(0x0146)
#define CAN0TIER  _P(0x0147)
#define CAN0TARQ  _P(0x0148)
#define CAN0TAAK  _P(0x0149)


#define CAN0TBSEL _P(0x014A)
#define CAN0IDAC  _P(0x014B)

//#define Reserved _P(0x014C)
//#define Reserved _P(0x014D)

#define CAN0RXERR _P(0x014E)
#define CAN0TXERR _P(0x014F)

#define CAN0IDAR0 _P(0x0150)
#define CAN0IDAR1 _P(0x0151)
#define CAN0IDAR2 _P(0x0152)
#define CAN0IDAR3 _P(0x0153)

#define CAN0IDMR0 _P(0x0154)
#define CAN0IDMR1 _P(0x0155)
#define CAN0IDMR2 _P(0x0156)
#define CAN0IDMR3 _P(0x0157)

#define CAN0IDAR4 _P(0x0158)
#define CAN0IDAR5 _P(0x0159)
#define CAN0IDAR6 _P(0x015A)
#define CAN0IDAR7 _P(0x015B)

#define CAN0IDMR4 _P(0x015C)
#define CAN0IDMR5 _P(0x015D)
#define CAN0IDMR6 _P(0x015E)
#define CAN0IDMR7 _P(0x015F)

#define CAN0RXFG    _ADDR(0x0160)
#define CAN0TXFG    _ADDR(0x0170)

#define CAN1CTL0   _P(0x0180)
#define CAN1CTL1   _P(0x0181)
#define CAN1BTR0   _P(0x0182)
#define CAN1BTR1   _P(0x0183)
#define CAN1RFLG   _P(0x0184)
#define CAN1RIER   _P(0x0185)
#define CAN1TFLG   _P(0x0186)
#define CAN1TIER   _P(0x0187)
#define CAN1TARQ   _P(0x0188)
#define CAN1TAAK   _P(0x0189)
#define CAN1TBSEL  _P(0x018A)
#define CAN1IDAC   _P(0x018B)

//#define Reserved _P(0x018C)
//#define Reserved _P(0x018D)

#define CAN1RXERR  _P(0x018E)
#define CAN1TXERR  _P(0x018F)

#define CAN1IDAR0  _P(0x0190)
#define CAN1IDAR1  _P(0x0191)
#define CAN1IDAR2  _P(0x0192)
#define CAN1IDAR3  _P(0x0193)
#define CAN1IDMR0  _P(0x0194)
#define CAN1IDMR1  _P(0x0195)
#define CAN1IDMR2  _P(0x0196)
#define CAN1IDMR3  _P(0x0197)
#define CAN1IDAR4  _P(0x0198)
#define CAN1IDAR5  _P(0x0199)
#define CAN1IDAR6  _P(0x019A)
#define CAN1IDAR7  _P(0x019B)
#define CAN1IDMR4  _P(0x019C)
#define CAN1IDMR5  _P(0x019D)
#define CAN1IDMR6  _P(0x019E)
#define CAN1IDMR7  _P(0x019F)

#define CAN1RXFG    _ADDR(0x01A0)
#define CAN1TXFG    _ADDR(0x01B0)

#define CAN2CTL0   _P(0x01C0)
#define CAN2CTL1   _P(0x01C1)
#define CAN2BTR0   _P(0x01C2)
#define CAN2BTR1   _P(0x01C3)
#define CAN2RFLG   _P(0x01C4)
#define CAN2RIER   _P(0x01C5)
#define CAN2TFLG   _P(0x01C6)
#define CAN2TIER   _P(0x01C7)
#define CAN2TARQ   _P(0x01C8)
#define CAN2TAAK   _P(0x01C9)
#define CAN2TBSEL  _P(0x01CA)
#define CAN2IDAC   _P(0x01CB)

//#define Reserved _P(0x01CC)
//#define Reserved _P(0x01CD)

#define CAN2RXERR  _P(0x01CE)
#define CAN2TXERR  _P(0x01CF)

#define CAN2IDARO   _P(0x01D0)
#define CAN2IDAR1   _P(0x01D1)
#define CAN2IDAR2   _P(0x01D2)
#define CAN2IDAR3   _P(0x01D3)

#define CAN2IDMR0   _P(0x01D4)
#define CAN2IDMR1   _P(0x01D5)
#define CAN2IDMR2   _P(0x01D6)
#define CAN2IDMR3   _P(0x01D7)

#define CAN2IDAR4   _P(0x01D8)
#define CAN2IDAR5   _P(0x01D9)
#define CAN2IDAR6   _P(0x01DA)
#define CAN2IDAR7   _P(0x01DB)

#define CAN2IDMR4   _P(0x01DC)
#define CAN2IDMR5   _P(0x01DD)
#define CAN2IDMR6   _P(0x01DE)
#define CAN2IDMR7   _P(0x01DF)

#define CAN2RXFG    _ADDR(0x01E0)
#define CAN2TXFG    _ADDR(0x01F0)

#define CAN3CTL0        _P(0x0200)
#define CAN3CTL1        _P(0x0201)
#define CAN3BTR0        _P(0x0202)
#define CAN3BTR1        _P(0x0203)

#define CAN3RFLG        _P(0x0204)
#define CAN3RIER        _P(0x0205)
#define CAN3TFLG        _P(0x0206)
#define CAN3TIER        _P(0x0207)
#define CAN3TARQ        _P(0x0208)
#define CAN3TAAK        _P(0x0209)
#define CAN3TBSEL       _P(0x020A)
#define CAN3IDC         _P(0x020B)

//#define Reserved _P(0x020C)
//#define Reserved _P(0x020D)

#define CAN3RXERR  _P(0x020E)
#define CAN3TXERR  _P(0x020F)

#define CAN3IDAR0       _P(0x0210)
#define CAN3IDAR1       _P(0x0211)
#define CAN3IDAR2       _P(0x0212)
#define CAN3IDAR3       _P(0x0213)

#define CAN3IDMR0       _P(0x0214)
#define CAN3IDMR1       _P(0x0215)
#define CAN3IDMR2       _P(0x0216)
#define CAN3IDMR3       _P(0x0217)

#define CAN3IDAR4       _P(0x0218)
#define CAN3IDAR5       _P(0x0219)
#define CAN3IDAR6       _P(0x021A)
#define CAN3IDAR7       _P(0x021B)

#define CAN3IDMR4       _P(0x021C)
#define CAN3IDMR5       _P(0x021D)
#define CAN3IDMR6       _P(0x021E)
#define CAN3IDMR7       _P(0x021F)

#define CAN3RXFG    _ADDR(0x0220)
#define CAN3TXFG    _ADDR(0x0230)

#define PTT     _P(0x0240)
#define PTIT    _P(0x0241)
#define DDRT    _P(0x0242)
#define RDRT    _P(0x0243)
#define PERT    _P(0x0244)
#define PPST    _P(0x0245)

//#define Reserved _P(0x0246)
//#define Reserved _P(0x0247)

#define PTS     _P(0x0248)
#define PTIS    _P(0x0249)
#define DDRS    _P(0x024A)
#define RDRS    _P(0x024B)
#define PERS    _P(0x024C)
#define PPSS    _P(0x024D)
#define WOMS    _P(0x024E)

//#define Reserved _P(0x024F)

#define PTM     _P(0x0250)
#define PTIM    _P(0x0251)
#define DDRM    _P(0x0252)
#define RDRM    _P(0x0253)
#define PERM    _P(0x0254)
#define PPSM    _P(0x0255)
#define WOMM    _P(0x0256)

//#define Reserved _P(0x0257)

#define PTP     _P(0x0258)
#define PTIP    _P(0x0259)
#define DDRP    _P(0x025A)
#define RDRP    _P(0x025B)
#define PERP    _P(0x025C)
#define PPSP    _P(0x025D)
#define PIEP    _P(0x025E)
#define PIFP    _P(0x025F)

#define PTH     _P(0x0260)
#define PTIH    _P(0x0261)
#define DDRH    _P(0x0262)
#define RDRH    _P(0x0263)
#define PERH    _P(0x0264)
#define PPSH    _P(0x0265)
#define PIEH    _P(0x0266)
#define PIFH    _P(0x0267)

#define PTJ     _P(0x0268)
#define PTIJ    _P(0x0269)
#define DDRJ    _P(0x026A)
#define RDRJ    _P(0x026B)
#define PERJ    _P(0x026C)
#define PPSJ    _P(0x026D)
#define PIEJ    _P(0x026E)
#define PIFJ    _P(0x026F)

//#define Reserved _P(0x0270 - 0x027F)

#define CAN4CTL0        _P(0x0280)
#define CAN4CTL1        _P(0x0281)
#define CAN4BTR0        _P(0x0282)
#define CAN4BTR1        _P(0x0283)
#define CAN4RFLG        _P(0x0284)
#define CAN4RIER        _P(0x0285)
#define CAN4TFLG        _P(0x0286)
#define CAN4TIER        _P(0x0287)
#define CAN4TARQ        _P(0x0288)
#define CAN4TAAK        _P(0x0289)
#define CAN4TBSEL       _P(0x028A)
#define CAN4IDAC        _P(0x028B)

//#define Reserved _P(0x028C)
//#define Reserved _P(0x028D)

#define CAN4RXERR       _P(0x028E)
#define CAN4TXERR       _P(0x028F)

#define CAN4IDAR0       _P(0x0290)
#define CAN4IDAR1       _P(0x0291)
#define CAN4IDAR2       _P(0x0292)
#define CAN4IDAR3       _P(0x0293)

#define CAN4IDMR0       _P(0x0294)
#define CAN4IDMR1       _P(0x0295)
#define CAN4IDMR2       _P(0x0296)
#define CAN4IDMR3       _P(0x0297)

#define CAN4IDAR4       _P(0x0298)
#define CAN4IDAR5       _P(0x0299)
#define CAN4IDAR6       _P(0x029A)
#define CAN4IDAR7       _P(0x029B)

#define CAN4IDMR4       _P(0x029C)
#define CAN4IDMR5       _P(0x029D)
#define CAN4IDMR6       _P(0x029E)
#define CAN4IDMR7       _P(0x029F)

#define CAN4RXFG    _ADDR(0x02A0)
#define CAN4RTFG    _ADDR(0x02B0)

//#define Reserved _P(0x02C0 - 0x02CF)

//#define Unimplemented _P(0x0300 - 0x03FF)
#endif
