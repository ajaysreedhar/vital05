#ifndef HARDWARE_MMIO_H
#define HARDWARE_MMIO_H

#include <std/types.h>

void mmio_write(mmio_addr_t addr, unsigned int value);
unsigned int mmio_read(mmio_addr_t addr);

#endif // #ifndef HARDWARE_MMIO_H
