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
 * @path [ROOT]/crt/x86/crti.s
 * @file crti.s
 * @brief Initialization start of C Runtime Routine.
 *
 * @details
 * This header file contains _init, and _fini sections of a C program.
 * It provides essential initialization startup routine of the core
 * C Runtime Routine.
 *
 * @sa [ROOT]/crt/x86/crt1.s - Entry point of C Runtime Routine
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

/**
 * @brief Generate 32 bits instructions.
 */
.code32

/**
 * @brief Prologue initialization section for constructors.
 */
.global _init
.section .init, "ax"
.type _init, @function
.align 16
_init:
    /* Push EBP register */
    pushl %ebp
    /* Move ESP to EBP */
    movl  %esp, %ebp

/**
 * @brief Prologue initialization section for destructors.
 */
.global _fini
.section .fini, "ax"
.type _fini, @function
.align 16
_fini:
    /* Push EBP register */
    pushl %ebp
    /* Move ESP to EBP */
    movl  %esp, %ebp

