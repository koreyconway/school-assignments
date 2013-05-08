// By Korey Conway and Tanzeel Rana

#include <hcs12dp256.h>

void temperature_init(void);
void temperature_isr(void);
int  temperature_get(void);
void temperature_start_sample(void);
int  temperature_is_ready(void);
void temperature_heater_on(void);
void temperature_heater_off(void);

static int temperature_value = 0;
static int temperature_ready = 0;

/*
	Initialize ports for temperature monitoring
*/
void temperature_init()
{
	temperature_ready = 0;
	
	// Turn on ATD0, fast flag on, off in wait mode (optional)
	// external trigger off, sequence complete interrupt enabled
	// 1100 0010
	ATD0CTL2 = 0xFA; // e2 was fa // 11xx x010
	
	// 8 conversions, FIFO off, freeze off
	ATD0CTL3 = 0x00; // 0000 0000
	
	// Set to 10-bit resolution, 16 conversion clock periods,
	// and scale the clock down a bit // example was: 0b 0110 0000
	ATD0CTL4 = 0x60; // 0110 0010
	
	// Initialize the heater portion (output on PM7)
	DDRM |= 0x80;
}

/*
	Start a new sampling
*/
void temperature_start_sample()
{
	// Right justified, unsigned, single conversion, one channel,
	// select channel 6
	temperature_ready = 0;
	ATD0CTL5 = 0x86; // 1000 0110
}

/*
	Function used to check if the new temperature is ready to be read
*/
int temperature_is_ready()
{
	return (temperature_ready != 0);
}

/*
	Get the temperature of the last reading (also resets the ready flag)
*/
int temperature_get()
{
	temperature_ready = 0;
	return temperature_value;
}

/*
	Turn the heater on
*/
void temperature_heater_on()
{
	PTM |= 0x80;
}

/*
	Turn the heater off
*/
void temperature_heater_off()
{
	PTM &= ~0x80;
}

/*
	Temperature ISR is run when ATD0 completes a sampling
*/
#pragma interrupt_handler temperature_isr
void temperature_isr()
{
	temperature_value = ((0x03FF & ATD0DR6) / 8) - 5; // limit to 10 bits, then convert to farenheit (slides say divide by 6 but this give a value that would never have the heater turn on)
	temperature_ready = 1;
}

