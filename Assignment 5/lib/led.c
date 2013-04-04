// By Korey Conway and Tanzeel Rana

#include <hcs12dp256.h>

void led_init(void);
void led_red_on(void);
void led_orange_on(void);
void led_yellow_on(void);
void led_green_on(void);
void led_all_off(void);

void led_init()
{
	DDRK |= 0x0F; // PK5 is buzzer, set to output
}

void led_all_off()
{
	PORTK &= ~0x0F;
}

void led_red_on()
{
	PORTK |= 0x01;
}

void led_yellow_on()
{
	PORTK |= 0x02;
}

void led_orange_on()
{
	PORTK |= 0x04;
}

void led_green_on()
{
	PORTK |= 0x08;
}
