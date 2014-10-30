//
// SYSC 4001 - Assignment 2
// Monisha Gunalan (100871444)
// Korey Conway (100838924)
// November 2013
//

#include <time.h>
#include <sys/time.h>
#include "timer.h"

static double timer_total_time = 0;
static double timer_start_time = 0;

// Start timer
void timer_start()
{
    struct timeval tv;
    gettimeofday(&tv, NULL);
    timer_start_time = tv.tv_usec + (tv.tv_sec * 1000000);
    timer_total_time = 0;
}

// Stop timer
double timer_stop()
{
    struct timeval tv;
    gettimeofday(&tv, NULL);
    double total_time = tv.tv_usec + (tv.tv_sec * 1000000);
    total_time -= timer_start_time;
    timer_total_time = 0;
    timer_start_time = 0;
    return total_time / 1000000;
}
