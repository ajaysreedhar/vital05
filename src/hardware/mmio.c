#include <hardware/mmio.h>
#include <std/types.h>

void mmio_write(mmio_addr_t addr, unsigned int value) {
    // Write value to address.
    *((mmio_ptr_t)addr) = value;
}

unsigned int mmio_read(mmio_addr_t addr) {
    // Read value from address.
    return *(mmio_ptr_t)addr;
}
