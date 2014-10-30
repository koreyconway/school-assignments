//
// SYSC 4001 - Assignment 2
// Monisha Gunalan (100871444)
// Korey Conway (100838924)
// November 2013
//

#ifndef SYSC_4001_Assignment_2_semaphore_h
#define SYSC_4001_Assignment_2_semaphore_h

#include <semaphore.h> // needed for sem_t type

sem_t * semaphore_create(char* name, int inital_value);
void semaphore_signal(sem_t* sem);
void semaphore_wait(sem_t* sem);
void semaphore_close(sem_t* sem);
void semaphore_delete(char* name);

#endif
