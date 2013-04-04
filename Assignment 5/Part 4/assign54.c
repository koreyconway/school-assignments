// By Korey Conway and Tanzeel Rana

#include <hcs12dp256.h>
#include <stdio.h>
#include "../lib/motor.c"
#include "../lib/rti.c"
#include "../lib/keyboard.c"
#include "../lib/lcd.c"
#include "../lib/temperature.c"
#include "../lib/stepper.c"
#include "../lib/buzzer.c"
#include "../lib/led.c"

#define DESIRED_TEMPERATURE	100
#define DIRECTION_NORTH	0
#define DIRECTION_EAST	1
#define DIRECTION_SOUTH	2
#define DIRECTION_WEST	3

void rti_each_second(void);
void rti_each_half(void);
void rti_each_quarter(void);

void trigger_collision(void);
void collision_avoidance(void);

// Global variables
int collision_detected = 0;
int speed = 30;
int temperature = 0;
int direction = DIRECTION_NORTH;

int main()
{
	int previous_temperature = 0;
	char key;
	
	// Setup terminal
	setbaud(BAUD19K);
	
	keyboard_init();
	lcd_init();
	motor_init();
	rti_init();
	motor_set_speed(speed);
	temperature_init();
	stepper_init();
	buzzer_init();
	led_init();
	INTR_ON();
	
	temperature_start_sample();
		
	lcd_display_speed(speed);
	lcd_display_temperature(temperature);

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
				lcd_display_temperature(temperature);
			} else if ( key == 'D' ) {
				if ( speed > MOTOR_MIN_SPEED ) {
					--speed;
					motor_set_speed(speed);
					printf("Decreasing speed to %d\n", speed);
				} else {
					printf("Speed is at minimum, at %d, cannot decrease.\n", speed);
				}
				lcd_display_speed(speed);
				lcd_display_temperature(temperature);
			} else if ( key == '5' ) {
				trigger_collision();
			} else {
				printf("Pushed: %c\n", key);
			}
		}
		
		if ( temperature_is_ready() ) {
			temperature = temperature_get();
			
			// Turn the heater on/off to get the desired temperature
			if ( temperature < DESIRED_TEMPERATURE ) {
				temperature_heater_on();
			} else {
				temperature_heater_off();
			}
			
			// Update LCD if the temperature has changed
			if ( temperature != previous_temperature ) {
				previous_temperature = temperature;
				printf("Temperature is %d F\n", temperature);
				lcd_display_speed(speed);
				lcd_display_temperature(temperature);
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
{
	static int count = 0;
	count = (count + 1) % 8;
	
	collision_avoidance();
	
	if ( count == 0 ) {
		temperature_start_sample(); // Start a new sample
	}
	
	led_all_off();
	switch (direction) {
		case DIRECTION_NORTH:
			led_red_on();
			break;
		case DIRECTION_EAST:
			led_yellow_on();
			break;
		case DIRECTION_SOUTH:
			led_green_on();
			break;
		case DIRECTION_WEST:
			led_orange_on();
			break;
	}
	
}

/*
	Simulate a collision warning
*/
void trigger_collision()
{
	collision_detected = 1;
}


/*
	This is executes the algorithm provided in the labs to avoid a collision
*/
void collision_avoidance()
{
	#define COLLISION_AVOID_STATE_INITIAL	0
	#define COLLISION_AVOID_STATE_WAIT		1
	#define COLLISION_AVOID_STATE_ROTATE90	2
	#define COLLISION_AVOID_STATE_CONTINUE	3

	static int seconds = 0;
	static int state = 0;
	
	if ( collision_detected ) {
		switch ( state ) {
			case COLLISION_AVOID_STATE_INITIAL:
				buzzer_on();
				motor_disable(); // we would stop the forward motors here
				printf("\n\nCollision warning!!\nStopping motors.\n");
				seconds = 0;
				state = COLLISION_AVOID_STATE_WAIT;
				break;
			case COLLISION_AVOID_STATE_WAIT:
				// wait 2 seconds before changing to next state (total time will be 3 second wait)
				buzzer_off();
				printf("Waiting for motors to be stopped\n");
				if ( ++seconds >= 2 ) {
					seconds = 0;
					state = COLLISION_AVOID_STATE_ROTATE90;
				}
				break;
			case COLLISION_AVOID_STATE_ROTATE90:
				if ( seconds == 0 ) {
					printf("Rotating 90 degrees to the right.\n");
					stepper_turn_cw(STEPPER_STEPS_PER_QUARTER);
				} else {
					printf("Waiting another second.\n");
				}
				
				if ( ++seconds >= 2 ) {
					// Go back into initial state and reset collision detection
					seconds = 0;
					state = COLLISION_AVOID_STATE_INITIAL;
					collision_detected = 0;
					direction = (direction + 1) % 4; // update the direction
					motor_enable(); // We would start the forward motors here
				}
				break;
			default:
				printf("Unknown collision state, return to initial.\n");
				seconds = 0;
				state = COLLISION_AVOID_STATE_INITIAL;
				collision_detected = 0;
		}
	} else {
		//printf("No collisions detected\n");
	}
}

