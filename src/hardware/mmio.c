#include <hardware/mmio.h>

void mmio_write(long addr, unsigned int value) {
    *(volatile unsigned int*)addr = value;
}

unsigned int mmio_read(long addr) { return *(volatile unsigned int*)addr; }
