// By Korey Conway and Tanzeel Rana

#include <hcs12dp256.h>
#include <stdio.h>
#include "../lib/motor.c"
#include "../lib/rti.c"
#include "../lib/keyboard.c"
#include "../lib/lcd.c"

void rti_each_second(void);
void rti_each_half(void);
void rti_each_quarter(void);

int speed = 25;
int temperature = 30;

int main()
{
	int pspeed = 0;
	char key;
	
	// Setup terminal
	setbaud(BAUD19K);
	
	keyboard_init();
	lcd_init();
	motor_init();
	rti_init();
	motor_set_speed(speed);
	INTR_ON();
		
	lcd_display_speed(speed);
	lcd_display_temperature(temperature); // Need to redisplay bottom line for some reason

	// Note: the assigment says to have nothing in the main after initilization, but this doesn't make sense.
	//	It is not proper to have terminal (eg. printf) and lcd outputs inside of the ISRs since those need to run quickly to avoid problems
	while ( 1 ) { 
		if ( key = keyboard_getchar() ) {
			if ( key == '0' ) {
				break;
			} else if ( key == 'E' ) {
				if ( speed < MOTOR_MAX_SPEED ) {
					++speed;
					motor_set_speed(speed);
					printf("Increasing speed to %d\n", speed);
				} else {
					printf("Speed is maxed at %d, cannot increase.\n", speed);
				}
				lcd_display_speed(speed);
				lcd_display_temperature(temperature); // Need to redisplay bottom line for some reason
			} else if ( key == 'D' ) {
				if ( speed > MOTOR_MIN_SPEED ) {
					--speed;
					motor_set_speed(speed);
					printf("Decreasing speed to %d\n", speed);
				} else {
					printf("Speed is at minimum, at %d, cannot decrease.\n", speed);
				}
				lcd_display_speed(speed);
				lcd_display_temperature(temperature); // Need to redisplay bottom line for some reason
			} else {
				printf("Pushed: %c\n", key);
			}
		}
	}
	
	return 0;
}

void rti_each()
{}

void rti_each_quarter()
{
	motor_update_speed();
}

void rti_each_half()
{}

void rti_each_second()
{}
