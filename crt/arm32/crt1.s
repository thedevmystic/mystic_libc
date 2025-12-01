/**
 * Copyright 2025 Suryansh Singh
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * ------------------------------------------------------------------------------------------------------
 *
 * @path [ROOT]/crt/arm32/crt1.s
 * @file crt1.s
 * @brief Entry point of C Runtime Routine.
 *
 * @details
 * This header file contains entry point of C Runtime (CRT) Routine.
 * i.e., It contains `_start` symbol. It initializes the stack pointer (SP),
 * along with other crucial registers. It is fully PIC-compatible.
 *
 * This file calls `__start_c` which is defined in `[ROOT]/crt/crt1.c`.
 * It does minimal setup and passes the control to the platform agnostic
 * C function (i.e., `__start_c`). So, that we can call `__libc_start_main()`,
 * without setting up the entire environment in other architectures.
 *
 * @sa [ROOT]/crt/arm32/crti.s - The initialization start of C Runtime
 * @sa [ROOT]/crt/arm32/crtn.s - The initialization end of C Runtime
 * @sa [ROOT]/crt/crtbegin.c - The initialization of constructors and destructor
 *                             of C Runtime (GNU C feature, or C++ feature)
 * @sa [ROOT]/crt/crtend.c   - The end of constructor and destructor lists of 
 *                             C Runtime (GNU C feature, or C++ feature)
 * @sa [ROOT]/crt/crt1.c     - The __start_c, and __libc_start_main functions.
 *
 * @author thedevmystic (Surya)
 * @copyright 2025 Suryansh Singh Apache-2.0 License
 *
 * SPDX-FileCopyrightText: 2025 Suryansh Singh
 * SPDX-License-Identifier: Apache-2.0
 */


/**
 * @brief Generate 32 bits instructions.
 */
.code32

/**
 * @brief Use unified syntax (thumb + arm).
 */
.syntax unified

/**
 * @brief Start function.
 * This is the start symbol of any program.
 */
.global _start
.section .text, "ax"
.type _start, @function
_start:
    /* Clear frame pointer */
    mov fp, #0
    /* Clear link register */
    mov lr, #0
    /* Load forward label to a2 */
    ldr a2, 1f
    /* Add pc and a2 and store in a2 */
    add a2, pc, a2
    /* Move stack pointer to a1 */
    mov a1, sp

2:
    /* Align to 16 bytes */
    and ip, a1, #-16
    /* Copy stack pointer */
    mov sp, ip
    /* Call __start_c function */
    bl __start_c

/**
 * @brief Weak and hidden _DYNAMIC label for PIC.
 */
.weak   _DYNAMIC
.hidden _DYNAMIC
.align 2

1:
    /* Calculate relative position of _DYNAMIC */
    .word _DYNAMIC - 2b

    /* Should never reach here */
    /* Branch-link to abort */
    bl abort

