// By Korey Conway and Tanzeel Rana

#define RTI_FREQUENCY			8
#define RTI_HALF_FREQENCY		(RTI_FREQUENCY/2)
#define RTI_QUARTER_FREQENCY	(RTI_FREQUENCY/4)


extern void rti_each(void);
extern void rti_each_second(void);
extern void rti_each_half(void);
extern void rti_each_quarter(void);

void rti_init(void);
void rti_isr(void);

/*
	Initialize the real-time interrupt
*/
void rti_init()
{
	CRGINT |= 0x80;
	RTICTL = 0x77; // runs at 4Hz
}

/*
	The RTI handler. For now this simply calls rti_every_second() every second
*/
#pragma interrupt_handler rti_isr
void rti_isr()
{
	static int count = 0;
	count = (count+1) % RTI_FREQUENCY;
	
	rti_each();
	
	#if RTI_QUARTER_FREQENCY == 1 // this is here because the compiler doesn't like a modulus by 1 but we wanted code to be as portable as possible
	rti_each_quarter();
	#else
	if ( 0 == (count % RTI_QUARTER_FREQENCY) ) {
		rti_each_quarter();
	}	
	#endif

	if ( 0 == (count % RTI_HALF_FREQENCY) ) {
		rti_each_half();
	}
	
	if ( 0 == count ) {
		rti_each_second();
	}
	
	// Clear the interrupt
	CRGFLG |= 0x80;
}
