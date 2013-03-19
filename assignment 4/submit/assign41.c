// By Korey Conway and Tanzeel Rana

#include <hcs12dp256.h>
#include <stdio.h>
#include "../lib/keyboard.c"

int main()
{
	char key;
	
	// Setup terminal
	setbaud(BAUD19K);
	
	while ( 1 ) {
		key = keyboard_getchar();
		putchar(key);
		
		if ( key == '0' ) {
			break;
		}
	}
	
	return 0;
}

/*
*
* The submit program won't let us sumbit the extra files, so here they are... commented out.
*
*/


// /* keyboard.c */
// // By Korey Conway and Tanzeel Rana

// #include <hcs12dp256.h>

// #define	KEYBOARD_ROWS		4
// #define	KEYBOARD_COLUMNS	4
// #define KEYBOARD_DEBOUNCE_DELAY	0x5000
// #define KEYBOARD_REPEAT_DELAY	0xF000

// char keyboard_getchar(void);
// static void keyboard_init(void);
// static void keyboard_delay(unsigned int delay);
// static int  keyboard_get_column(void);

// /*
	// Initialize ports for keyboard
// */
// static void keyboard_init()
// {
	// SPI1CR1 = 0x00; // Turn off SPI (not explained why yet)
	// DDRP    = 0x0F; // Enable keyboard and disable motors on port P
	// DDRH   &= 0x0F; // Enable reading from keyboard (High bits of DDRH)
	// DDRH   |= 0x08; // Enable writing to U7_EN
// }

// /*
	// Get a character from the keyboard
// */
// char keyboard_getchar()
// {
	// static int last_row = -1;
	// static int last_col = -1;
	// int row = 0;
	// int col = 0;
	// char char_map[KEYBOARD_ROWS][KEYBOARD_COLUMNS] =
		// {{'1', '2', '3', 'A'},
		// {'4', '5', '6', 'B'},
		// {'7', '8', '9', 'C'},
		// {'E', '0', 'F', 'D'}};
	
	// keyboard_init();

	// while ( 1 ) {
		// PTM |= 0x08;		// Set U7_EN high (PM3)
		// PTP  = 0x01 << row;	// Enable the correct row
		// PTM &= ~0x08;		// Set U7_EN low (PM3)
		
		// col = keyboard_get_column(); // Get the button that is pushed in that row (if any)

		// // Only react if a button was pushed
		// if ( col != -1 ) {
			// if ( last_row == row && last_col == col ) {
				// keyboard_delay(KEYBOARD_REPEAT_DELAY); // add delay for debounce
			// } else {
				// keyboard_delay(KEYBOARD_DEBOUNCE_DELAY); // add simple delay for repeat
			// }

			// // Check if the same button is still being pushed
			// if ( col == keyboard_get_column() ) {
				// // save the row/col of the character for repeat delays then return the char
				// last_row = row;
				// last_col = col;
				// return char_map[row][col];
			// }
		// } else if ( row == last_row )  {
			// // clear the memory of the last column because the button was released so we don't want a repeat delay anymore
			// last_col = -1; 
		// }

		// // change rows each iteration		 
		// row = (row+1) % KEYBOARD_ROWS;
	// }
	
	// return 0;
// }

// /*
	// Returns the column number of the button currently being pushed.
	// If no button is pushed then it returns -1
// */
// static int keyboard_get_column()
// {
	// int col = 0;
	// int input = PTH >> 4;

	// // Check for no input first since this is the most common result
	// if ( !input ) return -1;
	
	// // Check each bit, if one is set return the associated column
		// // Note: this gives priority to lower bits if 2 buttons are pushed at the same time
	// for (col = 0; col < KEYBOARD_COLUMNS; col++ )  {
		// if ( (input >> col) & 0x01 ) {
			// return col;
		// }
	// }
	
	// return -1;
// }

// /*
	// Delay for a time
// */
// static void keyboard_delay(unsigned int delay)
// {
	// for ( ; delay > 0 ; delay-- ) {}
// }




// /* lcd.c */
// // By Korey Conway and Tanzeel Rana

// asm (".include 'basicLCD.s'");

// extern void LCD_display(char ascii_char);
// extern void Lcd2PP_Init(void);
// extern void LCD_instruction(char instruction);

// void lcd_init(void);
// void lcd_print(char *string, int address);
// void lcd_print_top(char *string);
// void lcd_print_bottom(char *string);

// #define	LCD_ROW_TOP		0x00
// #define	LCD_ROW_BOTTOM	0xC0

// /*
	// Initialize the lcd
// */
// void lcd_init()
// {
	// Lcd2PP_Init();
// }

// /*
	// Print a string at the given location
// */
// void lcd_print(char *string, int address)
// {
	// DDRT = 0x0F; // Setup port T
	// PTT = 0x00;
	// DDRM = 0xFE; // Setup port M
	// PTM = 0x00;
	// DDRP |= 0x0F; // Set P0-3 as outputs
	// SPI1CR1 &= ~0x40; // Disable SP by turning SPI1 off
	
	// LCD_instruction(address);
	// while (0 != *string) {
		// LCD_display(*string++);
	// }
// }

// /*
	// Print a string on the top line
// */
// void lcd_print_top(char *string)
// {
	// lcd_print(string, LCD_ROW_TOP);
// }

// /*
	// Print a string on the bottom line
// */
// void lcd_print_bottom(char *string)
// {
	// lcd_print(string, LCD_ROW_BOTTOM);
// }





// /* stepper.c */
// // By Korey Conway and Tanzeel Rana

// #include <hcs12dp256.h>

// #define	STEPPER_DELAY				0XF000
// #define STEPPER_STEPS_PER_QUARTER	5
// #define STEPPER_STEPS_PER_TURN		STEPPER_STEPS_PER_QUARTER*4

// void stepper_init(void);
// void stepper_turn_cw(int steps);
// void stepper_turn_ccw(int steps);
// void stepper_set_step(int step);
// static void stepper_delay(unsigned int delay);

// /*
	// Turn clock-wise a given number of steps
// */
// void stepper_turn_cw(int steps)
// {
	// for ( ; steps > 0; steps-- ) {
		// stepper_set_step(3 - (steps % 4));
	// }
// }

// /*
	// Turn clock-wise a given number of steps
// */
// void stepper_turn_ccw(int steps)
// {
	// for ( ; steps > 0; steps-- ) {
		// stepper_set_step(steps % 4);
	// }
// }

// /*

// */
// void stepper_set_step(int step)
// {
	// int coded_step = 0;
	
	// // Get the coded step value for this step
	// if ( step == 2 ) {
		// coded_step = 3;
	// } else if ( step == 3 ) {
		// coded_step = 2;
	// } else {
		// coded_step = step;
	// }

	// // Set the bits in port T
	// PTT = (PTT & ~0x60) | (coded_step << 5);
	
	// //printf("Instruction: %X\nShifted Instruction: %X\nPTT: %X\n\n", instruction, shifted_instruction, PTT);
	
	// // Delay to allow enough time for the step to take place
	// stepper_delay(STEPPER_DELAY);
// } 

// /*
	// Initialize ports for the stepper motor
// */
// void stepper_init()
// {
	// DDRP = DDRP | 0x20; // Enable output for the enable bit
	// DDRT = DDRT | 0x60; // Enable output to the stepper motor
	// PTP  = PTP  | 0x20; // Enable the stepper motor
// }

// /*
	// Add delays for the stepper, based on given parameter
// */
// static void stepper_delay(unsigned int delay)
// {
	// for ( ; delay > 0 ; delay-- ) {}
// }

