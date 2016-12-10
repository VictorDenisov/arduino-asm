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

int main() {
	DDRD = 255; // enable output on pins 0-7
	//PORTD = 128;
	DDRB &= (~1); // enable input on pin 8
	PCICR |= (1 << PCIE0);
	PCMSK0 |= (1 << PCINT0);
	sei();
	while(1) {
		_delay_ms(500);	// Wait 5 seconds
	}
}
