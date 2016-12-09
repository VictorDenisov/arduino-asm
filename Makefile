build:
	avr-as -mmcu=atmega328p -o demo.o demo.s
	avr-ld -o demo.elf demo.o
	avr-objcopy --output-target=ihex demo.elf demo.ihex

program:
	sudo avrdude -c arduino -p m328p -P /dev/ttyACM0 -Uflash:w:"demo.ihex":i

flash.o:	demo.s
		avr-gcc \
			-Xlinker -Tdata -Xlinker 0x800100 \
			-Xlinker -M \
			-nostdlib \
			-O2 -Wall -mmcu=avr4 -D__AVR_ATmega328__ \
			-o $@ demo.s >mapfile

flash.hex:	flash.o
		avr-ld --oformat ihex -o $@ flash.o
