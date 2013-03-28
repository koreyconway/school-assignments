// By Korey Conway and Tanzeel Rana

void motor_init(void);
void motor_set_speed(int speed);
void optical_init(void);
void optical_isr(void);

#define	MIN_DUTY	0
#define MAX_DUTY	50

void motor_init()
{
	// Motor is attached to PWM7
	PWMPOL |= 0X80; // Set polarity high
	PWMCAE &= ~0x80; // Set to left aligned
	PWMCTL &= ~0x80; // Make sure PWM7 is not concatenated with PWM6
	PWMSCLB = 0xFF; // Set the clock scale
	PWMPER7 = 99; // Set the period to 100 (99+1)
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
	if ( (duty >= MIN_DUTY) && (duty <= MAX_DUTY) ) {
		PWMDTY7 = duty;
	}
}

void optical_init()
{
	//PAFLG |= 1; // Clear any previous interrupts
	//PACTL = (PACTL & ~0x61) | (0x51 & 0x61); // Sets rising edge detect, and enable interrupt on PACA
	TCTL3 |= 0x40; // capture rising edge
	TIE |= 0x80; // enable interrupt on pin 7
	TIOS  &= ~0x80; // input capture on pin 7 of port T
	TSCR2 |= 0x07; // prescale to 128
	TSCR1 |= 0x90; // set TEN and TFFCA
}

#pragma interrupt_handler optical_isr
void optical_isr()
{
	static int start = 0;
	int time = 0;

	if ( start ) {
		time = TCNT - start;
		start = 0;
		printf("%u\n", time);
	} else {
		start = TCNT;
	}
	
	TFLG1 = TFLG1;
	
	//PAFLG |= 1;
}