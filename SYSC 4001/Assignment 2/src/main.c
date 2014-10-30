//
// SYSC 4001 - Assignment 2
// Monisha Gunalan (100871444)
// Korey Conway (100838924)
// November 2013
//

#include <stdlib.h>
#include <stdio.h>
#include "common.h"
#include "buffer.h"
#include "alternative1.h"
#include "alternative2.h"
#include "alternative3.h"

/*
* Note: using -1 to signal to consumers has too many limitations
* (eg. what if more consumers than producers?). So we keep track
* of the number of producers by using shared memory.
*/

int main(int argc, const char * argv[])
{
    int part;
    int alternative;
    int producers_count = 15;
    int consumers_count = 5;
    
    printf("Select assignment part (1, 2): ");
    scanf("%d", &part);
    
    if (part == 1) {
        enable_verbose();
    } else {
        disable_verbose();
    }

    printf("Select alternative (1, 2, 3): ");
    scanf("%d", &alternative);
    
    switch (alternative) {
        case 1:
            if (part == 1) {
                run_alternative1(BUFFER_SMALL, producers_count, consumers_count);
            } else {
                run_alternative1(BUFFER_SMALL, producers_count, consumers_count);
                run_alternative1(BUFFER_MEDIUM, producers_count, consumers_count);
                run_alternative1(BUFFER_LARGE, producers_count, consumers_count);
            }
            break;
        case 2:
            if (part == 1) {
                run_alternative2(BUFFER_SMALL);
            } else {
                run_alternative2(BUFFER_SMALL);
                run_alternative2(BUFFER_MEDIUM);
                run_alternative2(BUFFER_LARGE);
            }
            break;
        case 3:
            if (part == 1) {
                run_alternative3(BUFFER_SMALL, producers_count, consumers_count);
            } else {
                run_alternative3(BUFFER_SMALL, producers_count, consumers_count);
                run_alternative3(BUFFER_MEDIUM, producers_count, consumers_count);
                run_alternative3(BUFFER_LARGE, producers_count, consumers_count);
            }
            break;
    }
    return 0;
}


