/**
 * MysticLibc - Standard C Library.
 *
 * @file crti.s (i386)
 *
 * @brief Prolouge of C Runtime Routine.
 */

.code32                          /* Generate 32 bits instructions */

.global _init
.global _fini

/* Prolouge section of _init */
.section .init, "ax"
.type _init, @function
.align 16
_init:
    pushl %ebp              /* Push EBP register */
    movl  %esp, %ebp        /* Move ESP to EBP */

/* Prolouge section of _fini */
.section .fini, "ax"
.type _fini, @function
.align 16
_fini:
    pushl %ebp              /* Push EBP register */
    movl  %esp, %ebp        /* Move ESP to EBP */
