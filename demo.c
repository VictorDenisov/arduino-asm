#define __AVR_ATmega328p__

#include <avr/io.h>
#include <avr/interrupt.h>

#define F_CPU 16000000000UL
#include <util/delay.h>

char counter = 0;

ISR(PCINT0_vect)
{
	if ((PINB & 1) == 1) {
		PORTD += 1;
	}
}

char period_counter = 0;

ISR(TIMER1_COMPA_vect)
{
	TCNT1 = 0;
	++period_counter;
	if (period_counter == 60) {
		++PORTD;
		period_counter = 0;
	}
}

ISR(TIMER1_OVF_vect)
{
	TCNT1 = 0;
	++PORTD;
	/*
	++period_counter;
	if (period_counter == 60) {
		++PORTD;
		period_counter = 0;
	}
	*/
}

int main() {
	DDRD = 255; // enable output on pins 0-7
	//PORTD = 128;
	DDRB &= (~1); // enable input on pin 8
	PCICR |= (1 << PCIE0);
	PCMSK0 |= (1 << PCINT0);
	TCCR1A = 0x00;
	TCCR1B = 0x05;
	TCCR1C = 0x00;
	TIMSK1 = 0x02;
	OCR1A = 15625;
	period_counter = 0;
	sei();
	while(1) {
		_delay_ms(5);	// Wait 5 seconds
		//PORTD += 1;
	}
}
