#include "hardware/uart.h"

void kmain() {
    uart0_init();
    uart0_write("Hello from Raspberry Pi 4!\n");
    uart0_write(
        "If you are reading this message, UART0 is initialized properly!\n");
    uart0_write("This time, the communication is over PL011 UART interface.\n");

    while (1) {
        asm volatile("wfe");
    }
}
