#ifndef HARDWARE_MAILBOX_H
#define HARDWARE_MAILBOX_H

#define MBOX_BUFFER_SIZE 36

enum { MBOX_REQUEST_CODE = 0x0 };

extern volatile unsigned int mailbox_buffer[MBOX_BUFFER_SIZE];

#endif // #ifndef HARDWARE_MAILBOX_H
