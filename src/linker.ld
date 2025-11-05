ENTRY (_start)

SECTIONS
{
    . = 0x80000;

    .text : {
        KEEP(*(.text.boot))
        *(.text .text.* .gnu.linkonce.t*)
    }

    .rodata : {
        *(.rodata .rodata.* .gnu.linkonce.r*)
    }

    PROVIDE(_data = .);

    .data : {
        *(.data .data.* .gnu.linkonce.d*)
    }

    .bss (NOLOAD) : {
        PROVIDE(_bss_start = .);
        *(.bss .bss.*)
        *(COMMON)
        PROVIDE(_bss_end = .);
    }
    _end = .;

    /DISCARD/ : {
       *(.comment)
       *(.gnu*)
       *(.note*)
       *(.eh_frame*)
    }
}
