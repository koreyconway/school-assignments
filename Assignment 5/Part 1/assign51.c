// By Korey Conway and Tanzeel Rana

#include <hcs12dp256.h>
#include <stdio.h>
#include "../lib/keyboard.c"
#include "../lib/lcd.c"

int speed = 45;
int temp  = 31;

int main()
{
	char key;
	
	// Setup terminal
	setbaud(BAUD19K);
	
	keyboard_init();
	lcd_init();
	INTR_ON();
	
	lcd_display_speed(speed);
	lcd_display_temperature(temp); // Need to redisplay bottom line for some reason
	
	while ( 1 ) {
		if ( key = keyboard_getchar() ) {
			if ( key == '0' ) {
				break;
			} else if ( key == 'E' ) {
				++speed;
				printf("Increasing speed to %d\n", speed);
				lcd_display_speed(speed);
				lcd_display_temperature(temp); // Need to redisplay bottom line for some reason
			} else if ( key == 'D' ) {
				--speed;
				printf("Decreasing speed to %d\n", speed);
				lcd_display_speed(speed);
				lcd_display_temperature(temp); // Need to redisplay bottom line for some reason
			} else {
				printf("Pushed: %c\n", key);
			}
		}
	}
	
	return 0;
}
