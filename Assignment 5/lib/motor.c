// By Korey Conway and Tanzeel Rana

void motor_init(void);
int  motor_get_speed(void);
void motor_set_speed(int speed);
void motor_update_speed(void);
static void motor_set_duty(int duty);
void motor_enable(void);
void motor_disable(void);
void motor_paca_isr(void);

#define	MOTOR_MIN_DUTY			115	// the motor often cuts out below this value
#define MOTOR_MAX_DUTY			200	// for saftety, setting a maximum duty
#define MOTOR_UPDATE_FREQUENCY	4	// this tells this driver how many times per second it is being updated
#define	MOTOR_DUTY_THRESHOLD	130 // start here if starting from 0
#define MOTOR_MAX_SPEED			30	// maximum speed set for safety (this is really too low but it is given in the lab)
#define MOTOR_MIN_SPEED			0	

#ifndef PACA
#define PACA	_LP(0x62)
#endif

static int current_speed = 0; // speed in rotations per second
static int desired_speed = 0;
static int motor_enabled = 0;
int motor_paca_count = 0;

void motor_init()
{
	motor_enabled = 1;
	
	// Motor is attached to PWM7
	PWMPOL |= 0X80; // Set polarity high
	PWMCAE &= ~0x80; // Set to left aligned
	PWMCTL &= ~0x80; // Make sure PWM7 is not concatenated with PWM6
	PWMSCLB = 0xFF; // Set the clock scale
	PWMPER7 = 0xFF; //99; // Set the period to 100 (99+1)
	PWMPRCLK &= ~0x70; // Set clock B
	DDRP |= 0x40; // Enable write on PP6 (to set direction of motor)
	PTP  |= 0x40; // Set to counter-clockwise
	PWMDTY7 = 0; // Set initial duty to 0
	PWME |= 0x80; // Enable PWM7
	PACA = 0;
	PAFLG |= 1;
	PACTL = 0x51; // Enable PACA and sets rising edge detect
}

/*
	Set the motor duty, making sure it stays in a safe range
*/
static void motor_set_duty(int duty)
{
	if ( !motor_enabled ) {
		return; // don't change the duty while the motor is disabled
	}
	
	if ( duty < MOTOR_MIN_DUTY && desired_speed > 0 ) {
		PWMDTY7 = MOTOR_MIN_DUTY;
	} else if ( duty > MOTOR_MAX_DUTY ) {
		PWMDTY7 = MOTOR_MAX_DUTY;
	} else {
		PWMDTY7 = duty;
	}
}

void motor_disable()
{
	PWME &= ~0x80;
	motor_enabled = 0;
}

void motor_enable()
{
	PWME |= 0x80;
	motor_enabled = 1;
}

void motor_update_speed()
{
	static int count = 0; // Setup count so it rolls over to 0 on first real sample
	int diff_speed = 0;
	
	// Estimate the current RPS (estimation improves throughout each second)
	current_speed = motor_paca_count * MOTOR_UPDATE_FREQUENCY / (count + 1);
	count = (count + 1) % MOTOR_UPDATE_FREQUENCY;

	// used for testing only: printf("Count: %d, PACA: %d, PACA Count: %d, Speed: %d, Duty: %d\n", count, PACA, motor_paca_count, current_speed, PWMDTY7);

	if ( count == 0 ) {
		//PACA = 0;
		motor_paca_count = 0; // this way seemed slightly more reliable than PACA, not sure why
	}

	// Update the duty cycle to get to desired speed
	// Note: this is not the best algorithm, but that isn't what this class is about so I expect it is acceptable
	diff_speed = desired_speed - current_speed;
	if ( diff_speed != 0 && current_speed == 0 && PWMDTY7 < MOTOR_DUTY_THRESHOLD ) {
		motor_set_duty(MOTOR_DUTY_THRESHOLD); // give a boost to start faster
	} else if ( diff_speed > 0 ) {
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
	}	
}

#pragma interrupt_handler motor_paca_isr
void motor_paca_isr()
{
	motor_paca_count++;
	PAFLG |= 1;
}

