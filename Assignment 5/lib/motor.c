// By Korey Conway and Tanzeel Rana

void motor_init(void);
int motor_get_speed(void);
void motor_set_duty(int duty);
int motor_get_duty(void);
void motor_update_speed(int quarter);
int motor_get_desired_speed(void);
void motor_set_desired_speed(int speed);

#define	MOTOR_MIN_DUTY	0
#define MOTOR_MAX_DUTY	50

#ifndef PACA
#define PACA		_LP(0x62)
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
}

/*
	Set the motor duty, making sure it stays in a safe range
*/
void motor_set_duty(int duty)
{
	if ( duty < MOTOR_MIN_DUTY ) {
		PWMDTY7 = MOTOR_MIN_DUTY;
	} else if ( duty > MOTOR_MAX_DUTY ) {
		PWMDTY7 = MOTOR_MAX_DUTY;
	} else {
		PWMDTY7 = duty;
	}
}

int motor_get_duty()
{
	return PWMDTY7;
}

// void optical_init()
// {
	// //PAFLG |= 1; // Clear any previous interrupts
	// PACTL = (PACTL & ~0xFF) | (0x50 & 0xFF); // Enable PACA and sets rising edge detect
	
	// // TCTL3 |= 0x40; // capture rising edge
	// // TIE |= 0x80; // enable interrupt on pin 7
	// // TIOS  &= ~0x80; // input capture on pin 7 of port T
	// // TSCR2 |= 0x07; // prescale to 128
	// // TSCR1 |= 0x90; // set TEN and TFFCA
// }

void motor_update_speed(int quarter)
{
	switch ( quarter ) {
		case 1:
			current_speed = PACA * 4;
			break;
		case 2:
			current_speed = PACA * 2;
			break;
		case 3:
			current_speed = PACA * 4 / 3;
			break;
		case 4:
			current_speed = PACA;
			PACA = 0;
		default:
			break;
	}
}

int motor_get_speed()
{
	return current_speed;
}

void motor_set_desired_speed(int speed)
{
	desired_speed = speed;
}

int motor_get_desired_speed()
{
	return desired_speed;
}
