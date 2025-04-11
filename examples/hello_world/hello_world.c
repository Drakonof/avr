#include <avr/io.h>
#include <util/delay.h>

// Настройка UART для 1 МГц
void uart_init() {
    // Для 2400 бод при 1 МГц:
    // UBRR = (1000000/(16*2400))-1 = 25.042 → 25 (0.16% ошибка)
    UBRRH = 0;
    UBRRL = 25;
    
    // Включаем передатчик и приемник
    UCSRB = (1 << TXEN) | (1 << RXEN);
    
    // Формат кадра: 8 бит данных, 1 стоп-бит
    UCSRC = (1 << URSEL) | (1 << UCSZ1) | (1 << UCSZ0);
}

// Отправка одного байта
void uart_send(uint8_t data) {
    while (!(UCSRA & (1 << UDRE))); // Ждем готовности передатчика
    UDR = data;
}

// Отправка строки
void uart_print(const char *str) {
    while (*str) {
        uart_send(*str++);
    }
}

// Прием байта (блокирующий)
uint8_t uart_receive() {
    while (!(UCSRA & (1 << RXC))); // Ждем данные
    return UDR;
}

int main() {
    uart_init();
    
    uart_print("ATmega8 UART @ 1MHz\r\n");
    uart_print("Speed: 2400 baud\r\n");
    
    while (1) {
        // Эхо-тест
        uint8_t byte = uart_receive();
        uart_send(byte);
        
        _delay_ms(10);
    }
}