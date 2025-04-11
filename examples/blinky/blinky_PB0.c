#include <avr/io.h>
#include <util/delay.h>
#include <stdbool.h>

#define DEFAULT_BLINKY_MS_DELAY 1000

int main() {
        DDRB |= (true << PB0);
        while (true) {
                PORTB ^= (true << PB0);
#if defined(USER_BLINKY_MS_DELAY) && USER_BLINKY_MS_DELAY > 0
                _delay_ms(USER_BLINKY_MS_DELAY);
#else
                _delay_ms(DEFAULT_BLINKY_MS_DELAY);
#endif
        }

        return 0;
}