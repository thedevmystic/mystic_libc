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
 * @path [ROOT]/crt/crt1.c
 * @file crt1.c
 * @brief __start_c stub function that calls __libc_start_main.
 *
 * @details
 * This file contains the platform-agnostic C stub function (__start_c) that is called from
 * `crt1.s`. Which in turn calls __libc_start_main.
 *
 * This file acts as a platform-agnostic middle layer in `crt1.o`. So, we can write minimal
 * architecture-specific assembly code, and use platform-agnostic C function stub.
 *
 * @sa [ROOT]/crt/x86_64     - x86-64 specific CRT files.
 * @sa [ROOT]/crt/x86        - x86 specific CRT files.
 * @sa [ROOT]/crt/arm64      - arm64 specific CRT files.
 * @sa [ROOT]/crt/arm32      - arm32 specific CRT files.
 * @sa [ROOT]/crt/crtbegin.c - The initialization of constructors and destructor
 *                             of C Runtime (GNU C feature, or C++ feature)
 * @sa [ROOT]/crt/crtend.c   - The end of constructor and destructor lists of 
 *                             C Runtime (GNU C feature, or C++ feature)
 *
 * @author thedevmystic (Surya)
 * @copyright 2025 Suryansh Singh Apache-2.0 License
 *
 * SPDX-FileCopyrightText: 2025 Suryansh Singh
 * SPDX-License-Identifier: Apache-2.0
 */

#include <features.h>
#include <stdint.h>
#include "libc.h"

/**
 * @brief Extern declaration of main function
 *
 * @param argc The given argument count passed to the program.
 * @param argv The given argument vector passed to the program.
 * @param envp The given environment pointer passed to the program.
 *
 * @returns Exit code, 0 for success, and non-zero for failure.
 */
int main(int argc, char** argv, char** envp);

/**
 * @brief init function from the routine.
 */
__weak void _init(void);

/**
 * @brief fini function from the routine.
 */
__weak void _fini(void);

/**
 * @brief Standard C Library start function.
 * This function handles the start of a C program, prepares
 * the environment and passes control to the main program.
 *
 * @param main The main program's entry function.
 * @param argc The given argument count.
 * @param argv The given argument vector.
 * @param init The initialization of ctor.
 * @param fini The initialization of dtor.
 * @param rtld_fini The dynamic loader's finalization function.
 *
 * @returns Nothing, this function should never return.
 * It should call exit, for exiting the program.
 */
int __libc_start_main(
    int (*main)(int argc, char** argv, char** envp),
    int argc,
    char** argv,
    void (*init)(void),
    void (*fini)(void),
    void (*rtld_fini)(void)
);

/**
 * @brief Main __start_c function, called from _start.
 *
 * @param p The pointer passed by _start.
 */
__hidden __noreturn
void __start_c(uintptr_t* p) {
    // Arguments extraction from the pointer
    int argc = (int)p[0];
    char** argv = (char**)(p + 1);
    // char** envp = argv + argc + 1;  <-- Reconstructed in __libc_start_main
    __libc_start_main(main, argc, argv, _init, _fini, 0);

    // Should never reach here.
    __unreachable();
}

