// By Korey Conway and Tanzeel Rana

#include <hcs12dp256.h>

void buzzer_init(void);
void buzzer_on(void);
void buzzer_off(void);

void buzzer_init()
{
	DDRK |= 0x20; // PK5 is buzzer, set to output
}

void buzzer_on()
{
	PORTK |= 0x20;
}

void buzzer_off()
{
	PORTK &= ~0x20;
}
