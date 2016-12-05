		.global	main
		.global	__vectors

__vectors:
		jmp	main

		; exactly 10 words

main:
		ldi	r30, 48
		sts	0x24, r30

		ldi	r30, 16
		sts	0x25, r30

		ldi	r30, 32
		sts	0x25, r30

		ldi	r30, 48
		sts	0x25, r30
