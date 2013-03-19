// By Korey Conway and Tanzeel Rana

#include <hcs12dp256.h>
#include <stdio.h>
#include "../lib/stepper.c"

int main()
{
	stepper_init();
	stepper_turn_cw(STEPPER_STEPS_PER_TURN * 2);
	stepper_turn_ccw(STEPPER_STEPS_PER_TURN * 2);
	return 0;
}
