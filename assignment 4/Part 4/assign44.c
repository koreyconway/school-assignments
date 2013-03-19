// By Korey Conway and Tanzeel Rana

#include <hcs12dp256.h>
#include <stdio.h>
#include "../lib/keyboard.c"
#include "../lib/stepper.c"
#include "../lib/lcd.c"

#define RTI_CTL	0x7F // run real-time interrupt at 8Hz
#define RTI_FREQUENCY	8

void rti_init(void);
void rti_handler(void);
void rti_every_second(void);
void trigger_collision(void);
void collision_avoidance(void);

// Global variables
int collision_detected = 0;
int temperature = 0;

void lcd_display_speed(int speed);
void lcd_display_temperature(int temp);

int speed = 45;
int temp  = 31;

int main()
{
	char key;

	// Initialization
	setbaud(BAUD19K);
	lcd_init();
	rti_init();	
	
	// Initial lcd display
	lcd_display_speed(speed);
	lcd_display_temperature(temp);
	
	while ( 1 ) {
		key = keyboard_getchar();
		
		if ( key == '0' ) {
			printf("Finished running\n");
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
		} else if ( key == '5' ) {
			printf("Triggering collision\n");
			trigger_collision();
		} else {
			printf("Key pressed: %c\n", key);
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

/*
	Initialize the real-time interrupt
*/
void rti_init()
{
	CRGINT |= 0x80;
	RTICTL = 0x7F; // runs at 8Hz
	asm("cli");
}

/*
	The RTI handler. For now this simply calls rti_every_second() every second
*/
#pragma interrupt_handler rti_handler
void rti_handler()
{
	static int count = 0;
	
	if ( ++count == RTI_FREQUENCY ) {
		count = 0;
		rti_every_second();
	}
	
	// Clear the interrupt
	CRGFLG |= 0x80;
}

/*
	Simulate a collision warning
*/
void trigger_collision()
{
	collision_detected = 1;
}

/*
	This gets run every second
*/
void rti_every_second()
{
	static int seconds = 0;
	
	// Run the collision avoidance algorithm
	collision_avoidance();
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
				// we would stop the forward motors here
				printf("\n\nCollision warning!!\nStopping motors.\n");
				seconds = 0;
				state = COLLISION_AVOID_STATE_WAIT;
				break;
			case COLLISION_AVOID_STATE_WAIT:
				// wait 2 seconds before changing to next state (total time will be 3 second wait)
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
					
					// We would start the forward motors here
				}
				break;
			default:
				printf("Unknown collision state, return to initial.\n");
				seconds = 0;
				state = COLLISION_AVOID_STATE_INITIAL;
				collision_detected = 0;
		}
	} else {
		printf("No collisions detected\n");
	}
}

