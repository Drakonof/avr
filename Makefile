_all: all

MCU = atmega8
F_CPU ?= 1000000

CC = avr-gcc
CFLAGS = -mmcu=$(MCU) -DF_CPU=$(F_CPU) -Os

EXAMPLES_DIR = $(PWD)/examples
include $(EXAMPLES_DIR)/examples.mk

all: examples-build

clean: examples-clean

.PHONY: all clean