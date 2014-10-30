//
// SYSC 4001 - Assignment 2
// Monisha Gunalan (100871444)
// Korey Conway (100838924)
// November 2013
//

#ifndef SYSC_4001_Assignment_2_iteration3_h
#define SYSC_4001_Assignment_2_iteration3_h

#include <semaphore.h> // needed for sem_t type

#define SEMAPHORE_P "/sem_p" // lock for producers
#define SEMAPHORE_C "/sem_c" // lock for consumers
#define SEMAPHORE_N "/sem_n"
#define SEMAPHORE_E "/sem_e"

void run_alternative3(int buffer_size, int number_of_producers, int number_of_consumers);
void start_producer3(int producer_id);
void start_consumer3(int consumer_id);

#endif
