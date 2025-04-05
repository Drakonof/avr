#include <avr/io.h>
#include <util/delay.h>

int main() {
        DDRB |= (1 << PB0);  // PB0 как выход
        while (1) {
                PORTB ^= (1 << PB0);  // Инвертируем PB0
                _delay_ms(1000);
        }

        return 0;
}