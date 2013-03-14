#include <hcs12dp256.h>
#include <stdio.h>

#define	KEYBOARD_ROWS		4
#define	KEYBOARD_COLUMNS	4
#define KEYBOARD_DEBOUNCE_DELAY	0x5000
#define KEYBOARD_REPEAT_DELAY	0xF000

void keyboard_init(void);
char keyboard_getchar(void);
void keyboard_delay(unsigned int delay);
int  keyboard_get_column(void);

int main()
{
	char key;
	
	// Setup keyboard and terminal
	setbaud(BAUD19K);
	keyboard_init();
	
	while ( 1 ) {
		key = keyboard_getchar();
		putchar(key);
		
		if ( key == '0' ) {
			break;
		}
	}
	
	return 1;
}

/*
	Initialize ports for keyboard
*/
void keyboard_init()
{
	SPI1CR1 = 0x00; // Turn off SPI (not explained why yet)
	DDRP = 0x0F; // Enable keyboard and disable motors on port P
	DDRH = DDRH & 0x0F; // Enable reading from keyboard (High bits of DDRH)
}

/*
	Get a character from the keyboard
*/
char keyboard_getchar()
{
	static int last_row = -1, last_col = -1;
	static char char_map[KEYBOARD_ROWS][KEYBOARD_COLUMNS] =
		{{'1', '2', '3', 'A'},
		{'4', '5', '6', 'B'},
		{'7', '8', '9', 'C'},
		{'E', '0', 'F', 'D'}};
	int row = 0;
	int col = 0;

	while ( 1 ) {
		PTP = 0x01 << row; // Enable the correct row
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
}

/*
	Returns the column number of the button currently being pushed.
	If no button is pushed then it returns -1
*/
int keyboard_get_column()
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
void keyboard_delay(unsigned int delay)
{
	for ( ; delay > 0 ; delay-- ) {}
}
