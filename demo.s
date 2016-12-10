		.global	main
		.global	pcint0
		.global	__vectors
		.equ PORTD, 0x2b
		.equ DDRD, 0x2a
		.equ PORTB, 0x25
		.equ DDRB, 0x24
		.equ PINB, 0x23

		.equ SPH, 0x5e
		.equ SPL, 0x5d
		.equ MCUCR, 0x55

		.equ PCICR, 0x68
		.equ PCMSK0, 0x6b

__vectors:
		jmp	main
		jmp	empty ; int0
		jmp	empty ; int1
		jmp	pcint0
		jmp	empty ; pcint1
		jmp	empty ; pcint2
		jmp	empty ; wdt
		jmp	empty ; timer2_compa
		jmp	empty ; timer2_compb
		jmp	empty ; timer2_ovf
		jmp	empty ; timer1_capt
		jmp	empty ; timer1_compa
		jmp	empty ; timer1_compb
		jmp	empty ; timer1_ovf
		jmp	empty ; timer0_compa
		jmp	empty ; timer0_compb
		jmp	empty ; timer0_ovf
		jmp	empty ; int1
		jmp	empty ; int1
		jmp	empty ; int1
		jmp	empty ; int1
		jmp	empty ; int1
		jmp	empty ; int1
		jmp	empty ; int1
		jmp	empty ; int1
		jmp	empty ; int1
		jmp	empty ; int1
		jmp	empty ; int1
		jmp	empty ; int1
		jmp	empty ; int1
		jmp	empty ; int1
		jmp	empty ; int1
		jmp	empty ; int1
		jmp	empty ; int1
		jmp	empty ; int1
		jmp	empty ; int1
		jmp	empty ; int1

		; exactly 10 words

pcint0:
		lds	r16, PINB
		andi	r16, 1
		cpi	r16, 1
		brne	skip
		lds	r20, PORTD
		inc	r20
		sts	PORTD, r20
skip:
		reti
empty:
		reti
main:
		ldi	r30, 255 ; output pins 0-7
		sts	DDRD, r30

		lds	r30, DDRB
		ldi	r29, 1 ; input enable pin 8
		com	r29
		and	r30, r29
		sts	DDRB, r30

/*
		lds	r30, PORTB
		ldi	r29, 1 ; write 0 to pin 8
		com	r29
		and	r30, r29
		sts	PORTB, r30
		*/

		;ldi	r30, 1 ; enable pull up resistor
		;sts	PORTB, r30

		lds	r30, PCICR
		sts	PORTD, r30

		lds	r30, PCICR ; enable PCINT0 interrupt
		ori	r30, 1
		sts	PCICR, r30

		lds	r30, PCMSK0 ; enable PCINT0 interrupt
		ori	r30, 1
		sts	PCMSK0, r30

		ldi	r20, 0

		sei

; vim: ai
