// By Korey Conway and Tanzeel Rana

void motor_init(void);
void motor_set_speed(int speed);
void optical_init(void);
void optical_isr(void);

#define MAX_DUTY	50;
#define	MIN_DUTY	0;

void motor_init()
{
	// Motor is attached to PWM7
	PWMPOL |= 0X80; // Set polarity high
	PWMCAE &= ~0x80; // Set to left aligned
	PWMCTL &= ~0x80; // Make sure PWM7 is not concatenated with PWM6
	PWMSCLB = 0xFF; // Set the clock scale
	PWMPER7 = 100; // Set the period
	PWMPRCLK &= ~0x70; // Set clock B
	DDRP |= 0x40; // Enable write on PP6 (to set direction of motor)
	PTP  |= 0x40; // Set to counter-clockwise
	PWMDTY7 = 0; // Set initial duty to 0
	PWME |= 0x80; // Enable PWM7
}

/*
	Set the motor duty, making sure it stays in a safe range
*/
void motor_set_duty(int duty)
{
	if ( duty >= MIN_DUTY && duty <= MAX_DUTY ) {
		PWMDTY7 = duty;
	}
}

void optical_init()
{
	PAFLG |= 1; // Clear any previous interrupts
	PACTL = (PACTL & ~0x71) | (0x51 & 0x71); // Sets rising edge detect, and enable interrupt on PACA
	TCNT |= 0x80;
}

#pragma interrupt_handler optical_isr
void optical_isr()
{
	printf("23\n");
	PAFLG |= 1;
}