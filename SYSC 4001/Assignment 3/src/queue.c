//
// SYSC 4001 - Assignment 3
// Monisha Gunalan (100871444)
// Korey Conway (100838924)
// December 2013
//

#include <stdbool.h>
#include "queue.h"
#include <stdlib.h>

void queue_init(queue_t* queue)
{
	queue->first = 0;
	queue->last = 0;
}

void queue_enqueue(queue_t* queue, task_t task)
{
	queue_item_t* qitem = malloc(sizeof(queue_item_t));
	qitem->next = queue->last;
	qitem->task = task;
	queue->last = qitem;
	
	if ( queue->first == 0 ) {
		queue->first = qitem;
	}
}

bool queue_dequeue(queue_t* queue, task_t* task)
{
	if ( queue->first == 0 ) {
		return false;
	}
	*task = queue->first->task;
	
	if ( queue->first == queue->last ) {
		free(queue->first);
		queue->first = queue->last = 0;
	} else {
		queue_item_t* item = queue->last;
		while(item->next != queue->first) {
			item = item->next;
		}
		item->next = 0;
		queue_item_t* temp = queue->first;
		queue->first = item;
		free(temp);
	}
	
	return true;
}

bool queue_is_empty(queue_t* queue)
{
	return (queue->first == 0);
}
