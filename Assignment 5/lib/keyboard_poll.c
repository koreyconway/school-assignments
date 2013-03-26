// By Korey Conway and Tanzeel Rana

#include <hcs12dp256.h>

#define	KEYBOARD_ROWS		4
#define	KEYBOARD_COLUMNS	4
#define KEYBOARD_DEBOUNCE_DELAY	0x5000
#define KEYBOARD_REPEAT_DELAY	0xF000

char keyboard_getchar(void);
static void keyboard_init(void);
static void keyboard_delay(unsigned int delay);
static int  keyboard_get_column(void);

/*
	Initialize ports for keyboard
*/
static void keyboard_init()
{
	SPI1CR1 = 0x00; // Turn off SPI (not explained why yet)
	DDRP    = 0x0F; // Enable keyboard and disable motors on port P
	DDRH   &= 0x0F; // Enable reading from keyboard (High bits of DDRH)
	DDRM   |= 0x08; // Enable writing to U7_EN
}

/*
	Get a character from the keyboard
*/
char keyboard_getchar()
{
	static int last_row = -1;
	static int last_col = -1;
	int row = 0;
	int col = 0;
	char char_map[KEYBOARD_ROWS][KEYBOARD_COLUMNS] =
		{{'1', '2', '3', 'A'},
		{'4', '5', '6', 'B'},
		{'7', '8', '9', 'C'},
		{'E', '0', 'F', 'D'}};
	
	keyboard_init();

	while ( 1 ) {
		PTM |= 0x08;		// Set U7_EN high (PM3)
		PTP  = 0x01 << row;	// Enable the correct row
		PTM &= ~0x08;		// Set U7_EN low (PM3)
		
		col = keyboard_get_column(); // Get the button that is pushed in that row (if any)

		// Only react if a button was pushed
		if ( col != -1 ) {
			if ( last_row == row && last_col == col ) {
				keyboard_delay(KEYBOARD_REPEAT_DELAY); // add delay for debounce
			} else {
				keyboard_delay(KEYBOARD_DEBOUNCE_DELAY); // add simple delay for repeat
			}

			// Check if the same button is still being pushed
			if ( col == keyboard_get_column() ) {
				// save the row/col of the character for repeat delays then return the char
				last_row = row;
				last_col = col;
				return char_map[row][col];
			}
		} else if ( row == last_row )  {
			// clear the memory of the last column because the button was released so we don't want a repeat delay anymore
			last_col = -1; 
		}

		// change rows each iteration		 
		row = (row+1) % KEYBOARD_ROWS;
	}
	
	return 0;
}

/*
	Returns the column number of the button currently being pushed.
	If no button is pushed then it returns -1
*/
static int keyboard_get_column()
{
	int col = 0;
	int input = PTH >> 4;

	// Check for no input first since this is the most common result
	if ( !input ) return -1;
	
	// Check each bit, if one is set return the associated column
		// Note: this gives priority to lower bits if 2 buttons are pushed at the same time
	for (col = 0; col < KEYBOARD_COLUMNS; col++ )  {
		if ( (input >> col) & 0x01 ) {
			return col;
		}
	}
	
	return -1;
}

/*
	Delay for a time
*/
static void keyboard_delay(unsigned int delay)
{
	for ( ; delay > 0 ; delay-- ) {}
}
