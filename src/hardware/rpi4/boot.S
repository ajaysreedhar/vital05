.section .text.boot

.global _start
.extern kmain

_start:

    /* Checking the processor ID is zero. If not, hang in an infinite loop.
    * MPIDR_EL1 is the Multiprocessor affinity register. It is a system register
    * that provides an additional PE (Processing Element) mechanism. */
    MRS    X1, MPIDR_EL1

    AND    X1, X1, #3

    /* Compare and branch if zero.
     * Jump to label 2. The "f" in 2f means "forward reference". */
    CBZ    X1, main_core_start

sub_core_hang:
    WFE                // The core enters a low-power state and remain until a wakeup event occurs.
    B    sub_core_hang // Branch to the same label, essentially ending in an infinite loop.

main_core_start:
    LDR    X1, =_stack_top
    MOV    SP, X1

    LDR    X2, =_bss_start
    LDR    X3, =_bss_end
    CBZ    x2, call_kmain
    CMP    X2, X3
    BCS    call_kmain

clear_bss:
    STR    XZR, [X2], #8
    CMP    X2, X3
    BLO    clear_bss

call_kmain:
    BL kmain


.section .bss
.align 16
.space 65536
_stack_bottom:
.align 4
_stack_top:
