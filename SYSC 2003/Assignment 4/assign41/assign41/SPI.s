// ===========================================================================
//
//   SPI_Cml.asm     Axiom SPI Driver 
//                                 
//   Version:        1.0   Released 8/27/2002
//   Author:         Gary Karnes , Axiom Mfg.
//   Compiler:       As12
//       
//   Platform:       Axiom CML12S
//   Purpose:        SPI Serial Control
// 
// Modified for ICC12 by Lloyd Atkinson, Oct. 16, 2003
// ============================================================================

.include "dp256reg.s"

// SPI channel 0
// Simple Serial Driver (SPI), source code...
// Acc A is send serially, msb first
// return received in Acc A
SS_IO:
//      jsr  DelayX4
		LDAB	SPI0SR	     // CLEAR STATUS OF SPI
        STAA	SP0DR	     // SEND / RECEIVE BYTE
SS_IO_LP:
       brclr SPI0SR,#$80,SS_IO_LP	// WAIT IF NO FLAG
       ldaa    SP0DR            	// read receive value
       rts
//
//
// Simple Serial Driver initialization...
_Init_Spi0::
Init_Spi0:
	
//Turn on Spi
       movb  #$52,SPI0CR1		// Setup SPI 
       movb  #$10,SPI0CR2       // enable /SS
       movb  #$00,SPI0BR        // set up Spi baud clock rate
//     ldaa  SPI0SR             // read status
//     movb  #$50,SPI0CR1 	    // turn on SPI
       rts
//============================================================

//============================================================
// SPI channel 1
// Simple Serial Driver (SPI), source code...
// Acc A is send serially, msb first
// return received in Acc A
SS_IO1:
//   jsr  DelayX4
	 LDAB	SPI1SR		// CLEAR STATUS OF SPI
     STAA	SP1DR		// SEND / RECEIVE BYTE
SS_IOLP1:		
     brclr  SPI1SR,#$80,SS_IOLP1	// WAIT IF NO FLAG
     ldaa   SP1DR       			// read receive value
 	 rts

//============================================================
	 
// Send 16 bit data on SPI 
// Disable auto SS*
_SS_1_16::
SS_1_16:
           bclr  SPI1CR1,#$02    // disable auto SS
           bclr  SPI1CR2,#$10    // disable auto SS
           pshb                  // save b
//         bset  SPI1CR1,#$04    // CHANGE CLOCK PHASE
           bclr  PTP,#$08        // send SS low

           

           jsr   SS_IO1          // send 8 bits          
           pula                  // get low byte
           jsr   SS_IO1          // send 8 bits

//         BCLR  SPI1CR1,#$04    // RESET PHASE

           bset PTP,#$08         // set SS high
           bset  SPI1CR1,#$02    // enable auto SS 
           bset  SPI1CR2,#$10    // enable auto SS 

           rts

//============================================================

// Simple Serial Driver initialization...
_Init_Spi1::
Init_Spi1:

//      Turn on Spi
       bset  PTP,#$04        // setup up port P if SS is diabled
       bset  DDRP,#$04       //set to output

       movb  #$52,SPI1CR1	 // Setup SPI 
       movb  #$10,SPI1CR2    // enable /SS
       movb  #$00,SPI1BR     // set up Spi baud clock rate
	   rts
	   
//============================================================

// Disable SPI 1
_SPI_DIS::
SPI_DIS:
// setup SPI1 as four output bits
              bset  DDRP,#$0F     // set P0-3 as outputs
			  // disable SPI
              bclr  SPI1CR1,#$40  // turn SPI1 off
              rts
//============================================================

//Enable SPI 1
_SPI_EN::
SPI_EN:
              bset  SPI1CR1,#$40  // turn SPI1 On
              rts
 
//============================================================
// The following routines select the SS0*,SS1*,SS2*
// Select U1
_SPI_U1::
SPI_U1:
              bclr  PTM,#$70    // select U1 device
              rts
//============================================================
// Select U2
_SPI_U2::
SPI_U2:
              bclr  PTM,#$70
              bset  PTM,#$10    // select U2 device
              rts
//============================================================
// Select U3
_SPI_U3::
SPI_U3:
              bclr  PTM,#$70
              bset  PTM,#$20    // select U3 device
              rts
//============================================================
// Select U4
_SPI_U4::
SPI_U4:
              bclr  PTM,#$70
              bset  PTM,#$30    // select U4 device
              rts
//============================================================
// Select U7
_SPI_U7S::
SPI_U7S:
// first set SS0*, SS1*, SS2* at U7 location
// this prevents serial devices from using the hc138
              bclr  PTM,#$70    // start with all low
              bset  PTM,#$20    // select U7
              rts
//============================================================
// De - Select U7
// Select U10
_SPI_U10::
SPI_U10:
              bclr  PTM,#$70
              bset  PTM,#$60    // select U10 device
              rts
//============================================================
// Select U11
_SPI_U11::
SPI_U11:
              bclr  PTM,#$70
              bset  PTM,#$70    // select U11 device
              rts
//============================================================
// Select U13
_SPI_U13::
SPI_U13:
              bclr  PTM,#$70
              bset  PTM,#$50    // select U13 device
              rts
//============================================================
// Select U21
_SPI_U21::
SPI_U21:
              bclr  PTM,#$70    // start with all low
              bset  PTM,#$30    // Select U21
              rts
//============================================================

//============================================================
// The following subroutines control reading U10 & U11
//   SPI_SS2 = load data into U10 & U11 on rising edge
//   SPI_R10 = read data from U10, acc B = data
//   SPI_R11 = read data from U11, acc B = data
//
// Toggle SS2*, load data into U10 & and U11
// data is loaded on rising edge
_SPI_SS2::
SPI_SS2:
              bclr  PTM,#$40     // set SS2* low
              bset  PTM,#$40     // load data
              rts
//============================================================
// Read Data from U10
_SPI_R10::
SPI_R10:
             jsr   SPI_SS2         // load data into U10 & U11
             jsr   SPI_U10         // select U10
             jsr   SS_IO1          // read U10
			 tab
		  	 clra
             rts
//============================================================
// Read Data from U11
_SPI_R11::
SPI_R11:
             jsr   SPI_SS2         // load data into U10 & U11
             jsr   SPI_U11         // select U10
             jsr   SS_IO1          // read U10
			 tab
		  	 clra
             rts
//============================================================
// Get only Key Pad data
_SPI_Key::
SPI_Key:
             bsr   SPI_SS2         // latch data into U10
             bsr   SPI_R10         // read U10 keypad data
             andb  #$0F            // mask keypad data
             rts
//============================================================
// Get Dip switch data
_SPI_Dip::
SPI_Dip:
             bsr   SPI_SS2         // latch data into U10
             bsr   SPI_R10         // read U10 Dip switch data
             andb  #$F0            // mask Dip switch data
             rts
//============================================================
// Get CP data
_SPI_CP::   
SPI_CP: 
             bsr   SPI_SS2         // latch data into U11
             bsr   SPI_R11         // read U11 CP data
             andb  #$01            // mask CP data
             rts
//============================================================
// Get PB1 data
_SPI_PB1::
SPI_PB1:
             bsr   SPI_SS2         // latch data into U11
             bsr   SPI_R11         // read U11 PB1 data
             andb  #$02            // mask PB1 data
             rts
//============================================================
// Get OPTO data
_SPI_Opto::
SPI_Opto:
             bsr   SPI_SS2         // latch data into U11
             bsr   SPI_R11         // read U11 OPTO data
             andb  #$04            // mask OPTO data
             rts
//============================================================
// Get SD data
_SPI_SD::
SPI_SD:
             bsr   SPI_SS2         // latch data into U11         
             bsr   SPI_R11         // read U11 SD data
             andb  #$F8            // mask SF data
             rts
//
//=======================================================
// Opto Driver Disable
_SPI_Op_D::
SPI_Op_D:
             jsr    SPI_U2          // select U2
             clra
             jsr    SS_IO1          // turn opto Off
             rts
//============================================================
// Opto Driver Enable
_SPI_Op_E::
SPI_Op_E:
             jsr    SPI_U2          // select U2
             ldaa   #$08
             jsr    SS_IO1          // enable opto
             rts
//=======================================================
