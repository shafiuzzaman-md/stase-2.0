/* SPDX-License-Identifier: GPL-2.0 */
#ifndef _LINUX_CONVERT_MOD_H
#define _LINUX_CONVERT_MOD_H

#include <linux/types.h>

/**
 * convert_perform - perform a conversion based on mode and input
 * @input: pointer to input data
 * @len: length of input data
 * @mode: 0 = standard, 1 = libxml2, 2 = pkexec
 *
 * This function allocates memory using kchunk and simulates
 * conversion behavior consistent with userland conversion logic.
 */
void convert_perform(const char *input, size_t len, int mode);

/**
 * convert_load_file - load file data into heap memory
 * @path: kernel-visible path to a file to read from
 *
 * This function reads file data and places it in a chunk.
 */
void convert_load_file(const char *path);

#endif /* _LINUX_CONVERT_MOD_H */