MCU = atmega8
F_CPU = 1000000

CC = avr-gcc
CFLAGS = -mmcu=$(MCU) -DF_CPU=$(F_CPU) -Os

# drv
DIR_DRV = drv
SRCS_DIR_DRV = $(DIR_DRV)/src
SRCS_DRV += $(wildcard $(SRCS_DIR_DRV)/*.c)

# tests
DIR_TESTS = tests

PB0_LED_BLINK = PB0_led_blink

SRCS_TEST += $(wildcard $(DIR_TESTS)/*.c)
OBJS_TESTS = $(SRCS_TEST:.c=.o)
TARGET_TESTS = $(PB0_LED_BLINK).hex

all: drv-build tests-build

# tests
tests: tests-build tests-flash

tests-build: $(PB0_LED_BLINK).elf
	avr-objcopy -O ihex $(PB0_LED_BLINK).elf $(TARGET_TESTS)

$(PB0_LED_BLINK).elf: $(OBJS_TESTS)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

tests-flash: $(TARGET_TESTS)
	avrdude -c usbasp -p $(MCU) -U flash:w:$<

clean:
	rm -f *.o *.elf *.hex $(DIR_TESTS)/*.o

.PHONY: all test-build test-flash clean
