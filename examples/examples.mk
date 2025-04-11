BLINKY_DIR = $(EXAMPLES_DIR)/blinky
include $(BLINKY_DIR)/blinky.mk

HELLO_WORLD_DIR = $(EXAMPLES_DIR)/hello_world
include $(HELLO_WORLD_DIR)/hello_world.mk

examples-build: blinky-build hello_world-build

examples-clean: blinky-clean hello_world-clean

.PHONY: examples-build examples-clean