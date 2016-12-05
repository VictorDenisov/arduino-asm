
firmware.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
   0:	0c 94 34 00 	jmp	0x68	; 0x68 <__ctors_end>
   4:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
   8:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
   c:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  10:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  14:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  18:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  1c:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  20:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  24:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  28:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  2c:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  30:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  34:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  38:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  3c:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  40:	0c 94 5a 00 	jmp	0xb4	; 0xb4 <__vector_16>
  44:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  48:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  4c:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  50:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  54:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  58:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  5c:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  60:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  64:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>

00000068 <__ctors_end>:
  68:	11 24       	eor	r1, r1
  6a:	1f be       	out	0x3f, r1	; 63
  6c:	cf ef       	ldi	r28, 0xFF	; 255
  6e:	d8 e0       	ldi	r29, 0x08	; 8
  70:	de bf       	out	0x3e, r29	; 62
  72:	cd bf       	out	0x3d, r28	; 61

00000074 <__do_clear_bss>:
  74:	21 e0       	ldi	r18, 0x01	; 1
  76:	a0 e0       	ldi	r26, 0x00	; 0
  78:	b1 e0       	ldi	r27, 0x01	; 1
  7a:	01 c0       	rjmp	.+2      	; 0x7e <.do_clear_bss_start>

0000007c <.do_clear_bss_loop>:
  7c:	1d 92       	st	X+, r1

0000007e <.do_clear_bss_start>:
  7e:	a9 30       	cpi	r26, 0x09	; 9
  80:	b2 07       	cpc	r27, r18
  82:	e1 f7       	brne	.-8      	; 0x7c <.do_clear_bss_loop>
  84:	0e 94 4d 00 	call	0x9a	; 0x9a <main>
  88:	0c 94 df 00 	jmp	0x1be	; 0x1be <_exit>

0000008c <__bad_interrupt>:
  8c:	0c 94 00 00 	jmp	0	; 0x0 <__vectors>

00000090 <setup>:
  90:	8f e3       	ldi	r24, 0x3F	; 63
  92:	84 b9       	out	0x04, r24	; 4
  94:	85 b9       	out	0x05, r24	; 5
  96:	08 95       	ret

00000098 <loop>:
  98:	08 95       	ret

0000009a <main>:
  9a:	0e 94 a4 00 	call	0x148	; 0x148 <init>
  9e:	0e 94 48 00 	call	0x90	; 0x90 <setup>
  a2:	c0 e0       	ldi	r28, 0x00	; 0
  a4:	d0 e0       	ldi	r29, 0x00	; 0
  a6:	0e 94 4c 00 	call	0x98	; 0x98 <loop>
  aa:	20 97       	sbiw	r28, 0x00	; 0
  ac:	e1 f3       	breq	.-8      	; 0xa6 <main+0xc>
  ae:	0e 94 00 00 	call	0	; 0x0 <__vectors>
  b2:	f9 cf       	rjmp	.-14     	; 0xa6 <main+0xc>

000000b4 <__vector_16>:
  b4:	1f 92       	push	r1
  b6:	0f 92       	push	r0
  b8:	0f b6       	in	r0, 0x3f	; 63
  ba:	0f 92       	push	r0
  bc:	11 24       	eor	r1, r1
  be:	2f 93       	push	r18
  c0:	3f 93       	push	r19
  c2:	8f 93       	push	r24
  c4:	9f 93       	push	r25
  c6:	af 93       	push	r26
  c8:	bf 93       	push	r27
  ca:	80 91 01 01 	lds	r24, 0x0101
  ce:	90 91 02 01 	lds	r25, 0x0102
  d2:	a0 91 03 01 	lds	r26, 0x0103
  d6:	b0 91 04 01 	lds	r27, 0x0104
  da:	30 91 00 01 	lds	r19, 0x0100
  de:	23 e0       	ldi	r18, 0x03	; 3
  e0:	23 0f       	add	r18, r19
  e2:	2d 37       	cpi	r18, 0x7D	; 125
  e4:	20 f4       	brcc	.+8      	; 0xee <__vector_16+0x3a>
  e6:	01 96       	adiw	r24, 0x01	; 1
  e8:	a1 1d       	adc	r26, r1
  ea:	b1 1d       	adc	r27, r1
  ec:	05 c0       	rjmp	.+10     	; 0xf8 <__vector_16+0x44>
  ee:	26 e8       	ldi	r18, 0x86	; 134
  f0:	23 0f       	add	r18, r19
  f2:	02 96       	adiw	r24, 0x02	; 2
  f4:	a1 1d       	adc	r26, r1
  f6:	b1 1d       	adc	r27, r1
  f8:	20 93 00 01 	sts	0x0100, r18
  fc:	80 93 01 01 	sts	0x0101, r24
 100:	90 93 02 01 	sts	0x0102, r25
 104:	a0 93 03 01 	sts	0x0103, r26
 108:	b0 93 04 01 	sts	0x0104, r27
 10c:	80 91 05 01 	lds	r24, 0x0105
 110:	90 91 06 01 	lds	r25, 0x0106
 114:	a0 91 07 01 	lds	r26, 0x0107
 118:	b0 91 08 01 	lds	r27, 0x0108
 11c:	01 96       	adiw	r24, 0x01	; 1
 11e:	a1 1d       	adc	r26, r1
 120:	b1 1d       	adc	r27, r1
 122:	80 93 05 01 	sts	0x0105, r24
 126:	90 93 06 01 	sts	0x0106, r25
 12a:	a0 93 07 01 	sts	0x0107, r26
 12e:	b0 93 08 01 	sts	0x0108, r27
 132:	bf 91       	pop	r27
 134:	af 91       	pop	r26
 136:	9f 91       	pop	r25
 138:	8f 91       	pop	r24
 13a:	3f 91       	pop	r19
 13c:	2f 91       	pop	r18
 13e:	0f 90       	pop	r0
 140:	0f be       	out	0x3f, r0	; 63
 142:	0f 90       	pop	r0
 144:	1f 90       	pop	r1
 146:	18 95       	reti

00000148 <init>:
 148:	78 94       	sei
 14a:	84 b5       	in	r24, 0x24	; 36
 14c:	82 60       	ori	r24, 0x02	; 2
 14e:	84 bd       	out	0x24, r24	; 36
 150:	84 b5       	in	r24, 0x24	; 36
 152:	81 60       	ori	r24, 0x01	; 1
 154:	84 bd       	out	0x24, r24	; 36
 156:	85 b5       	in	r24, 0x25	; 37
 158:	82 60       	ori	r24, 0x02	; 2
 15a:	85 bd       	out	0x25, r24	; 37
 15c:	85 b5       	in	r24, 0x25	; 37
 15e:	81 60       	ori	r24, 0x01	; 1
 160:	85 bd       	out	0x25, r24	; 37
 162:	ee e6       	ldi	r30, 0x6E	; 110
 164:	f0 e0       	ldi	r31, 0x00	; 0
 166:	80 81       	ld	r24, Z
 168:	81 60       	ori	r24, 0x01	; 1
 16a:	80 83       	st	Z, r24
 16c:	e1 e8       	ldi	r30, 0x81	; 129
 16e:	f0 e0       	ldi	r31, 0x00	; 0
 170:	10 82       	st	Z, r1
 172:	80 81       	ld	r24, Z
 174:	82 60       	ori	r24, 0x02	; 2
 176:	80 83       	st	Z, r24
 178:	80 81       	ld	r24, Z
 17a:	81 60       	ori	r24, 0x01	; 1
 17c:	80 83       	st	Z, r24
 17e:	e0 e8       	ldi	r30, 0x80	; 128
 180:	f0 e0       	ldi	r31, 0x00	; 0
 182:	80 81       	ld	r24, Z
 184:	81 60       	ori	r24, 0x01	; 1
 186:	80 83       	st	Z, r24
 188:	e1 eb       	ldi	r30, 0xB1	; 177
 18a:	f0 e0       	ldi	r31, 0x00	; 0
 18c:	80 81       	ld	r24, Z
 18e:	84 60       	ori	r24, 0x04	; 4
 190:	80 83       	st	Z, r24
 192:	e0 eb       	ldi	r30, 0xB0	; 176
 194:	f0 e0       	ldi	r31, 0x00	; 0
 196:	80 81       	ld	r24, Z
 198:	81 60       	ori	r24, 0x01	; 1
 19a:	80 83       	st	Z, r24
 19c:	ea e7       	ldi	r30, 0x7A	; 122
 19e:	f0 e0       	ldi	r31, 0x00	; 0
 1a0:	80 81       	ld	r24, Z
 1a2:	84 60       	ori	r24, 0x04	; 4
 1a4:	80 83       	st	Z, r24
 1a6:	80 81       	ld	r24, Z
 1a8:	82 60       	ori	r24, 0x02	; 2
 1aa:	80 83       	st	Z, r24
 1ac:	80 81       	ld	r24, Z
 1ae:	81 60       	ori	r24, 0x01	; 1
 1b0:	80 83       	st	Z, r24
 1b2:	80 81       	ld	r24, Z
 1b4:	80 68       	ori	r24, 0x80	; 128
 1b6:	80 83       	st	Z, r24
 1b8:	10 92 c1 00 	sts	0x00C1, r1
 1bc:	08 95       	ret

000001be <_exit>:
 1be:	f8 94       	cli

000001c0 <__stop_program>:
 1c0:	ff cf       	rjmp	.-2      	; 0x1c0 <__stop_program>
