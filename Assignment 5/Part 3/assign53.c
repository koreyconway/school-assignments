// By Korey Conway and Tanzeel Rana

#include <hcs12dp256.h>
#include <stdio.h>
#include "../lib/temperature.c"

#define DESIRED_TEMPERATURE	100

int main()
{
	int temperature = 0;
	int prevtemp = 0;
	
	// Setup terminal
	setbaud(BAUD19K);
	
	INTR_ON();
	temperature_init();
	temperature_start_sample();
	
	while ( 1 ) {
		if ( temperature_is_ready() ) {
			temperature = temperature_get();
			
			// Turn the heater on/off to get the desired temperature
			if ( temperature < DESIRED_TEMPERATURE ) {
				temperature_heater_on();
			} else {
				temperature_heater_off();
			}
			
			// Print on the terminal if the temperature changed
			if ( temperature != prevtemp ) {
				prevtemp = temperature;
				printf("Temperature is %d F\n", temperature);
			}
			
			// Start a new sample
			temperature_start_sample();
		}
	}
		
	return 0;
}
