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
 * @path [ROOT]/crt/x86/crt1.s
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
 * @sa [ROOT]/crt/x86/crti.s - The initialization start of C Runtime
 * @sa [ROOT]/crt/x86/crtn.s - The initialization end of C Runtime
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
 
.code32                             /* Generate 32 bits instructions */

.global _start

.section .text, "ax"
.type _start, @function
_start:
    xorl  %ebp, %ebp                /* Clears EBP register */
    movl  %esp, %eax                /* Pass pointer to argc */
    andl  $-16, %esp                /* Align to 16 byte */
    pushl %eax                      /* Push EAX */
    pushl %eax                      /* Push EAX */

.weak   _DYNAMIC
.hidden _DYNAMIC
    call 1f                         /* Call forward label */

1:
    addl  $_DYNAMIC - 1b, (%esp)    /* ESP = &_DYNAMIC */
    pushl %eax                      /* Push EAX */
    call  __start_c                 /* Call main __start_c function */
    hlt                             /* Halt if somehow __start_c returns */

