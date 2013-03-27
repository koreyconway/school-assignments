/* To use, either add this file to the project file list (preferred), or 
 * #include it in a single source file if you are just using 
 * File->CompileToOutput (this works but using the Project feature is better
 */

/* Vector Table for Dx256 S12 CPU
 * As is, all interrupts except reset jumps to 0xffff, which is most
 * likely not going to useful. To replace an entry, declare your function,
 * and then change the corresponding entry in the table. For example,
 * if you have a SCI handler (which must be defined with 
 * #pragma interrupt_handler ...) then in this file:
 * add
 *	extern void SCIHandler();
 * before th table.
 * In the SCI entry, change:
 *	DUMMY_ENTRY,
 * to
 *  SCIHandler, 
 */
#pragma nonpaged_function _start
extern void _start(void);	/* entry point in crt??.s */
extern void optical_isr(void);

#define NOICE_DUMMY_ENTRY (void (*)(void))0xF8CF
#define NOICE_XIRQ	(void (*)(void))0xF8C7
#define NOICE_SWI	(void (*)(void))0xF8C3
#define NOICE_TRAP	(void (*)(void))0xF8CB
#define NOICE_COP	(void (*)(void))0xF805
#define NOICE_CLM	(void (*)(void))0xF809

//#pragma abs_address:0xFF80 		//Used for Standalone Apps.
#pragma abs_address:0x3F8C 		//Used with the monitor

/* change the above address if your vector starts elsewhere
 */
void (*interrupt_vectors[])(void) = 
	{
	/* to cast a constant, say 0xb600, use
	   (void (*)())0xb600
	 */
	//NOICE_DUMMY_ENTRY, /*Reserved $FF80*/  //Not used under Monitor
	//NOICE_DUMMY_ENTRY, /*Reserved $FF82*/  //Not used under Monitor
	//NOICE_DUMMY_ENTRY, /*Reserved $FF84*/  //Not used under Monitor
	//NOICE_DUMMY_ENTRY, /*Reserved $FF86*/  //Not used under Monitor
	//NOICE_DUMMY_ENTRY, /*Reserved $FF88*/  //Not used under Monitor
	//NOICE_DUMMY_ENTRY, /*Reserved $FF8A*/  //Not used under Monitor
	NOICE_DUMMY_ENTRY, /*PWM Emergency Shutdown*/
	NOICE_DUMMY_ENTRY, /*Port P Interrupt*/
	NOICE_DUMMY_ENTRY, /*MSCAN 4 Transmit*/
	NOICE_DUMMY_ENTRY, /*MSCAN 4 Receive*/
	NOICE_DUMMY_ENTRY, /*MSCAN 4 Error*/
	NOICE_DUMMY_ENTRY, /*MSCAN 4 Wake-up*/
	NOICE_DUMMY_ENTRY, /*MSCAN 3 Transmit*/
	NOICE_DUMMY_ENTRY, /*MSCAN 3 Receive*/
	NOICE_DUMMY_ENTRY, /*MSCAN 3 Error*/
	NOICE_DUMMY_ENTRY, /*MSCAN 3 Wake-up*/
	NOICE_DUMMY_ENTRY, /*MSCAN 2 Transmit*/
	NOICE_DUMMY_ENTRY, /*MSCAN 2 Receive*/
	NOICE_DUMMY_ENTRY, /*MSCAN 2 Error*/
	NOICE_DUMMY_ENTRY, /*MSCAN 2 Wake-up*/
	NOICE_DUMMY_ENTRY, /*MSCAN 1 Transmit*/
	NOICE_DUMMY_ENTRY, /*MSCAN 1 Receive*/
	NOICE_DUMMY_ENTRY, /*MSCAN 1 Error*/
	NOICE_DUMMY_ENTRY, /*MSCAN 1 Wake-up*/
	NOICE_DUMMY_ENTRY, /*MSCAN 0 Transmit*/
	NOICE_DUMMY_ENTRY, /*MSCAN 0 Receive*/
	NOICE_DUMMY_ENTRY, /*MSCAN 0 Error*/
	NOICE_DUMMY_ENTRY, /*MSCAN 0 Wake-up*/
	NOICE_DUMMY_ENTRY, /*Flash*/
	NOICE_DUMMY_ENTRY, /*EEPROM*/
	NOICE_DUMMY_ENTRY, /*SPI2*/
	NOICE_DUMMY_ENTRY, /*SPI1*/
	NOICE_DUMMY_ENTRY, /*IIC Bus*/
	NOICE_DUMMY_ENTRY, /*DLC*/
	NOICE_DUMMY_ENTRY, /*SCME*/
	NOICE_DUMMY_ENTRY, /*CRG Lock*/
	NOICE_DUMMY_ENTRY, /*Pulse Accumulator B Overflow*/
	NOICE_DUMMY_ENTRY, /*Modulus Down Counter Underflow*/
	NOICE_DUMMY_ENTRY, /*Port H Interrupt*/
	NOICE_DUMMY_ENTRY, /*Port J Interrupt*/
	NOICE_DUMMY_ENTRY, /*ATD1*/
	NOICE_DUMMY_ENTRY, /*ATD0*/
	NOICE_DUMMY_ENTRY, /*SCI1*/
	NOICE_DUMMY_ENTRY, /*SCI0*/
	NOICE_DUMMY_ENTRY, /*SPI0*/
	optical_isr, /*Pulse Accumulator A Input Edge*/
	NOICE_DUMMY_ENTRY, /*Pulse Accumulator A Overflow*/
	NOICE_DUMMY_ENTRY, /*Timer Overflow*/
	NOICE_DUMMY_ENTRY, /*Timer Channel 7*/
	NOICE_DUMMY_ENTRY, /*Timer Channel 6*/
	NOICE_DUMMY_ENTRY, /*Timer Channel 5*/
	NOICE_DUMMY_ENTRY, /*Timer Channel 4*/
	NOICE_DUMMY_ENTRY, /*Timer Channel 3*/
	NOICE_DUMMY_ENTRY, /*Timer Channel 2*/
	NOICE_DUMMY_ENTRY, /*Timer Channel 1*/
	NOICE_DUMMY_ENTRY, /*Timer Channel 0*/
	NOICE_DUMMY_ENTRY, /*Real Time Interrupt*/
	NOICE_DUMMY_ENTRY, /*IRQ*/
	NOICE_XIRQ, /*XIRQ*/
	NOICE_SWI, /*SWI*/
	NOICE_TRAP, /*Unimplement Intruction Trap*/
	NOICE_COP, /*COP failure reset*/
	NOICE_CLM, /*Clock monitor fail reset*/
	_start, /*Reset*/
	};
#pragma end_abs_address
