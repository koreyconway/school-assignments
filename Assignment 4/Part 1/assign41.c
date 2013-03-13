//#include <hc12.h>
#include <hcs12dp256.h>
#include <stdio.h>

void delay(int ms);
void keyboard_init(void);
int  keyboard_get_column(void);
void keyboard_scan(void);
void keyboard_pushed(int row, int col);

int main()
{
	setbaud(BAUD19K);
	keyboard_init();
	keyboard_scan();
	return 1;
}

void keyboard_scan()
{
	int row = 0;
	int col = 0;

	while ( 1 ) {
		PTP = 0x01 << row;

		col = keyboard_get_column();

		// Only react if a button was pushed
		if ( PTH & 0xF0 ) {
			delay(20); // delay for debounce

			if ( col == keyboard_get_column() ) { 
				keyboard_pushed(row, col);
				//printf("Row %d, column %d\n", row_mask, col);
			}
		}

		// Change rows each iteration		 
		row = (row+1) % 4;
	}
}

void keyboard_pushed(int row, int col)
{
	char char_arr[4][4] =
		{{'1', '2', '3', 'A'},
		{'4', '5', '6', 'B'},
		{'7', '8', '9', 'C'},
		{'E', '0', 'F', 'D'}};

	putchar(char_arr[row][col]);
	if ( col == 1 && row == 3 ) {
		asm("SWI");
	}
}

void keyboard_init()
{
	SPI1CR1 = 0x00; // Turn off SPI (not explained why yet)
	DDRP = 0x0F; // Enable keyboard and disable motors on port P
	DDRH = DDRH & 0x0F; // Enable reading from keyboard (High bits of DDRH)
}

int keyboard_get_column()
{
	int col;
	if ( PTH & 0x10 ) {
		col = 0;
	} else if ( PTH & 0x20 ) {
		col = 1;
	} else if ( PTH & 0x40 ) {
		col = 2;
	} else if ( PTH & 0x80 ) {
		col = 3;
	}
	return col;
}

void delay(int ms)
{
	const int delayConstant = 1234;
	int i, j;
	for ( i=0; i<ms; i++ ) {
		for ( j=0; j < delayConstant; j++ ) {}
	}
}