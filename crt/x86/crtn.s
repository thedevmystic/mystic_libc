/**
 * MysticLibc - Standard C Library.
 *
 * @file crtn.asm (i386)
 *
 * @brief Epilouge of C Runtime Routine.
 */

.code32                          /* Generate 32 bits instructions */

/* Epilouge section of _init */
.section .init
    popl %ebp               /* Pop EBP register */
    ret                     /* Return */

/* Epilouge section of _fini */
.section .fini
    popl %ebp               /* Pop EBP register */
    ret                     /* Return */
