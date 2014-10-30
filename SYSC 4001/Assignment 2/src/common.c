//
// SYSC 4001 - Assignment 2
// Monisha Gunalan (100871444)
// Korey Conway (100838924)
// November 2013
//

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdarg.h>
#include <stdbool.h>
#include <time.h>
#include "common.h"

static bool verbose_flag = false;
static bool common_pause_enabled = true;

pid_t fork_child(int alternative, int id, void (*callback)(int))
{
    pid_t child_pid = fork();
    switch(child_pid) {
        case -1: // Error
            printf("Failed to fork child, alternative=%d, id=%d\n", alternative, id);
            exit(-1);  // stop from returning to "parent" code
        case 0: // Child
            srand(RAND_SEED + id);
            callback(id);
            exit(0); // stop from returning to "parent" code
            break;
        default: // Parent
            break;
    }
    
    return child_pid;
}

void start_children(int alternative, int child_count, void (*callback)(int))
{
    for (int i = 1; i <= child_count; i++) {
        fork_child(alternative, i, callback);
    }
}

int generate_producer_value(int producer_id)
{
    return producer_id * 1000 + (rand() % 100);
}

void enable_verbose()
{
    verbose_flag = true;
}

void disable_verbose()
{
    verbose_flag = false;
}

void verbose(const char * format, ...)
{
	if (verbose_flag) {
        va_list args;
        va_start(args, format);
        vprintf(format, args);
        printf("\n");
        va_end(args);
    }
}

void enable_pause()
{
    common_pause_enabled = true;
}

void disable_pause(void)
{
    common_pause_enabled = false;
}
void time_pause(void)
{
    if (common_pause_enabled) {
        int dummy;
        for(int i = 50000; i <= 0; i--) {
            dummy = 45 + i; // hopefully stops from getting optimized out
        }
    }
}
