// By Korey Conway and Tanzeel Rana

void motor_init(void);
int  motor_get_speed(void);
void motor_set_speed(int speed);
void motor_update_speed(void);
static void motor_set_duty(int duty);

#define	MOTOR_MIN_DUTY			0
#define MOTOR_MAX_DUTY			55
#define MOTOR_UPDATE_FREQUENCY	4
#define	MOTOR_DUTY_THRESHOLD	25
#define MOTOR_MAX_SPEED			30
#define MOTOR_MIN_SPEED			0 // NOTE: these motors can't seem to go that slow, so the lab document should be fixed... or perhaps if there is a way it should be taught in class

#ifndef PACA
#define PACA	_LP(0x62)
#endif

static int current_speed = 0; // speed in rotations per second
static int desired_speed = 0;

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
	PACTL = (PACTL & ~0xFF) | (0x50 & 0xFF); // Enable PACA and sets rising edge detect
	PACA = 0;
}

/*
	Set the motor duty, making sure it stays in a safe range
*/
static void motor_set_duty(int duty)
{
	if ( duty < MOTOR_MIN_DUTY ) {
		PWMDTY7 = MOTOR_MIN_DUTY;
	} else if ( duty > MOTOR_MAX_DUTY ) {
		PWMDTY7 = MOTOR_MAX_DUTY;
	} else {
		PWMDTY7 = duty;
	}
}

void motor_update_speed()
{
	static int count = 0; // Setup count so it rolls over to 0 on first real sample
	int diff_speed = 0;
	
	// Estimate the current RPS (estimation improves throughout each second)
	current_speed = PACA * MOTOR_UPDATE_FREQUENCY / (count + 1);
	count = (count + 1) % MOTOR_UPDATE_FREQUENCY;
	if ( count == 0 ) {
		PACA = 0;
	}
	
	// Update the duty cycle to get to desired speed
	// Note: this is not the best algorithm, but that isn't what this class is about so I expect it is acceptable
	diff_speed = desired_speed - current_speed;
	if ( diff_speed > 0 ) {
		motor_set_duty(PWMDTY7 + 1); // PWMDTY7 is duty
	} else if ( diff_speed < 0 ) {
		motor_set_duty(PWMDTY7 - 1); // PWMDTY7 is duty
	}
	
}

int motor_get_speed()
{
	return current_speed;
}

void motor_set_speed(int speed)
{
	if ( speed >= MOTOR_MIN_SPEED || speed <= MOTOR_MAX_SPEED ) {
		desired_speed = speed;
		
		if ( current_speed == 0 ) {
			PWMDTY7 = MOTOR_DUTY_THRESHOLD; // give a boost to start faster
		}
	}
	
}

