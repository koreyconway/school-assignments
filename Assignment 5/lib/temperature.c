// By Korey Conway and Tanzeel Rana

#include <hcs12dp256.h>

void temperature_init(void);
int temperature_gettemp(void);
void temperature_isr(void);

static int temperature;

/*
	Initialize ports for temperature monitoring
*/
void temperature_init()
{
	ATD0CTL2 = 0xFA;
	ATD0CTL3 = 0x00;
	ATD0CTL4 = 0x60;
	ATD0CTL5 = 0x86;
	
}

int temperature_gettemp()
{
	return temperature;
}

void temperature_isr()
{
	
}