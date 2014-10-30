//
// SYSC 4001 - Assignment 3
// Monisha Gunalan (100871444)
// Korey Conway (100838924)
// December 2013
//

#ifndef Assignment3_queue_h
#define Assignment3_queue_h

#include <stdbool.h>
#include "common.h"

typedef struct queue_item_t {
	struct queue_item_t* next;
	task_t task;
} queue_item_t;

typedef struct queue_t {
	struct queue_item_t* first;
	struct queue_item_t* last;
} queue_t;


void queue_init(queue_t* queue);
void queue_enqueue(queue_t* queue, task_t task);
bool queue_dequeue(queue_t* queue, task_t* task);
bool queue_is_empty(queue_t* queue);

#endif
