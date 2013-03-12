//#include <hc12.h>
#include <hcs12dp256.h>
#include <stdio.h>

//char collision_detection (int speed, unsigned int * proximity);
//void change_speed(int * speed, int value);

int main()
{
   int row_mask = 0x01;
   int row = 0;
   int col = 0;
   char char_arr[4][4] = {{'1', '2', '3', 'A'},
   					  {'4', '5', '6', 'B'},
					  {'7', '8', '9', 'C'},
					  {'E', '0', 'F', 'D'}};
   int loopi = 0;
					
   
   setbaud(BAUD19K);
   
   // Turn off SPI (not explained why yet)
   SPI1CR1 = 0x00;
   
   // Enable keyboard and disable motors on port P
   DDRP = 0x0F;
   
   // Enable reading from keyboard (High bits of DDRH)
   DDRH = DDRH & 0x0F;
   
   
   while ( 1 ) {
   		 PTP = row_mask;
		 
		 col = getKeyboardCol();
		 
		 // Only output if a button was pushed
		 if ( PTH & 0xF0 ) {
		    delay(20);
			
			if ( col == getKeyboardCol() ) { 
					 	putchar(char_arr[row][col]);
						//printf("Row %d, column %d\n", row_mask, col);
			}
			
			// Check if '0' was pressed, if so then terminate
			if ( col == 1 && row == 3 ) {
			   return 1;
			}
		 }

		 // Change rows each iteration		 
		 row++;
		 row_mask = 0x01 << row;

		 if ( row >= 4 ) {
		 	row_mask = 0x01;
			row = 0;
		 }
   }
 
   return 1;
}

int getKeyboardCol()
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