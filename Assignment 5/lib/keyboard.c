// By Korey Conway and Tanzeel Rana

#include <hcs12dp256.h>

#define	KEYBOARD_ROWS		4
#define	KEYBOARD_COLUMNS	4
#define KEYBOARD_DEBOUNCE_DELAY	0x5000
#define KEYBOARD_REPEAT_DELAY	0xF000

char keyboard_getchar(void);
void keyboard_init(void);
void keyboard_isr(void);

static char key = 0x00;

/*
	Initialize ports for keyboard
*/
void keyboard_init()
{
	SPI1CR1 = 0x00; // Turn off SPI (not explained why yet)

	DDRM |= 0x08; // Enable writing to U7_EN

	DDRP |= 0x0F;  // Enable writing to keyboard rows
	PTM  |= 0x08;  // Set U7_EN high (PM3)
	PTP  |= 0x0F;  // Turn all rows on
	PTM  &= ~0x08; // Set U7_EN low (PM3)

	DDRH &= 0x0F; // Enable reading from keyboard columns
	PPSH |= 0xF0; // Rising edge interupt on port H
	PIFH  = 0xFF; // Acknowledge previous interrupts
	PERH  = 0x00; // Disasble pull-up/down devices
	PIEH  = 0xF0; // Enable Port H interrupts (only the 4 high bits)
}

/*
	This is the ISR for port H for the keyboard column
*/
#pragma interrupt_handler keyboard_isr
void keyboard_isr()
{
	int row = 0;
	int col = 0;
	int col_mask;
	static char char_map[KEYBOARD_ROWS][KEYBOARD_COLUMNS] =
		{{'1', '2', '3', 'A'},
		{'4', '5', '6', 'B'},
		{'7', '8', '9', 'C'},
		{'E', '0', 'F', 'D'}};
	
	PIEH  = 0x00; // Turn off Port H interrupts
	
	col_mask = PIFH >> 4;
	
	// Find the row
	for ( row = 0; row < KEYBOARD_ROWS; row++ ) {
		PTM |= 0x08;		// Set U7_EN high (PM3)
		PTP = (PTP & ~0x0F) | ((0x01 << row) & 0x0F);	// Enable the correct row (without affecting high bits)
		PTM &= ~0x08;		// Set U7_EN low (PM3)
		
		if ( PTH & 0xF0 ) {
			// We found the row, now find the column
			for ( col = 0; col < KEYBOARD_COLUMNS; col++ ) {
				if ( (col_mask >> col) & 0x01 ) {
					break;
				}
			}
			break;
		}
	}
	
	if ( col < KEYBOARD_COLUMNS && row < KEYBOARD_ROWS ) {
		key = char_map[row][col];
	} else {
		key = 0x00; // Something strange happened if we get here
	}
	
	PTM |= 0x08;  // Set U7_EN high (PM3)
	PTP |= 0x0F;  // Turn all rows on again
	PTM &= ~0x08; // Set U7_EN low (PM3)
	PIFH = 0xFF;  // Acknowlege the interrupt
	PIEH  = 0xF0;
}

/*
	Get the last character pushed
*/
char keyboard_getchar()
{
	char temp = key;
	key = 0x00;
	return temp;
}


