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
 * @path [ROOT]/crt/arm64/crtn.s
 * @file crti.s
 * @brief Initialization end of C Runtime Routine.
 *
 * @details
 * This header file contains _init, and _fini end sections of a C program.
 * It provides essential initialization teardown routine of the core
 * C Runtime Routine.
 *
 *
 * @sa [ROOT]/crt/arm64/crt1.s - Entry point of C Runtime Routine
 * @sa [ROOT]/crt/arm64/crti.s - The initialization start of C Runtime
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
 * @brief Generate 64 bits instructions.
 */
.code64

/**
 * @brief Epilogue section of init.
 */
.section .init
    /* Load frame pointer, link register and stack pointer back */
    ldp x29, x30, sp, #16
    /* Return */
    ret

/**
 * @brief Epilogue section of fini.
 */
.section .fini
    /* Load frame pointer, link register and stack pointer back */
    ldp x29, x30, sp, #16
    /* Return */
    ret

