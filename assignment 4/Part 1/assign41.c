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
