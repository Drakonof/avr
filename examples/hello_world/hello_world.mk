HELLO_WORLD = hello_world

HELLO_WORLD_SRCS += $(HELLO_WORLD_DIR)/$(wildcard *.c)
HELLO_WORLD_OBJS = $(HELLO_WORLD_SRCS:.c=.o)
HELLO_WORLD_TARGET = $(HELLO_WORLD_DIRY)/$(HELLO_WORLD).hex
HELLO_WORLD_ELF = $(HELLO_WORLD_DIR)/$(HELLO_WORLD).elf

hello_world-build: $(HELLO_WORLD_ELF)
	avr-objcopy -O ihex $(HELLO_WORLD_ELF) $(HELLO_WORLD_TARGET)

$(HELLO_WORLD_ELF): $(HELLO_WORLD_OBJS)*.o
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

hello_world-flash: $(HELLO_WORLD_TARGET)
	avrdude -c usbasp -p $(MCU) -U flash:w:$<

hello_world-clean:
	rm -f $(HELLO_WORLD_DIR)/*.o $(HELLO_WORLD_DIR)/*.elf $(HELLO_WORLD_DIR)/*.hex

.PHONY: hello_world-build hello_world-clean hello_world-flash