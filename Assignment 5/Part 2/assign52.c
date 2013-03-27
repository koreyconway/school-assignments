// By Korey Conway and Tanzeel Rana

#include <hcs12dp256.h>
#include <stdio.h>
#include "../lib/motor.c"

int main()
{
	char key;
	
	// Setup terminal
	setbaud(BAUD19K);
	
	motor_init();
	optical_init();
	
	INTR_ON();
	
	motor_set_duty(50);
	
	while ( 1 ) {}
	
	return 0;
}
