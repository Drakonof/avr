BLINKY = blinky_PB0

USER_BLINKY_MS_DELAY = 0

BLINKY_SRCS += $(BLINKY_DIR)/$(wildcard *.c)
BLINKY_OBJS = $(BLINKY_SRCS:.c=.o)
BLINKY_TARGET = $(BLINKY_DIRY)/$(BLINKY).hex
BLINKY_ELF = $(BLINKY_DIR)/$(BLINKY).elf

CFLAGS += -DUSER_BLINKY_MS_DELAY=$(USER_BLINKY_MS_DELAY)

blinky-build: $(BLINKY_ELF)
	avr-objcopy -O ihex $(BLINKY_ELF) $(BLINKY_TARGET)

$(BLINKY_ELF): $(BLINKY_OBJS)*.o
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

blinky-flash: $(BLINKY_TARGET)
	avrdude -c usbasp -p $(MCU) -U flash:w:$<

blinky-clean:
	rm -f $(BLINKY_DIR)/*.o $(BLINKY_DIR)/*.elf $(BLINKY_DIR)/*.hex

.PHONY: blinky-build blinky-clean blinky-flash