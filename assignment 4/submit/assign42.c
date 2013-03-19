// By Korey Conway and Tanzeel Rana

#include <hcs12dp256.h>
#include <stdio.h>
#include "keyboard.c"
#include "lcd.c"

void lcd_display_speed(int speed);
void lcd_display_temperature(int temp);

int speed = 45;
int temp  = 31;

int main()
{
	char key;
	
	// Setup keyboard, terminal, and lcd
	lcd_init();
	
	// Initial lcd display
	lcd_display_speed(speed);
	lcd_display_temperature(temp);
	
	while ( 1 ) {
		key = keyboard_getchar();
		putchar(key);
		
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
		}
	}
	
	return 0;
}

void lcd_display_speed(int speed)
{
	char *string;
	sprintf(string, "Speed: %d", speed);
	lcd_print_top(string);
}

void lcd_display_temperature(int temp)
{
	char *string;
	sprintf(string, "Temperature: %dC", temp);
	lcd_print_bottom(string);
}
