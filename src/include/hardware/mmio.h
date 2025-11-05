#ifndef HARDWARE_MMIO_H
#define HARDWARE_MMIO_H

void mmio_write(long addr, unsigned int value);
unsigned int mmio_read(long addr);

#endif // #ifndef HARDWARE_MMIO_H
