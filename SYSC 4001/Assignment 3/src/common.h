//
// SYSC 4001 - Assignment 3
// Monisha Gunalan (100871444)
// Korey Conway (100838924)
// December 2013
//

#ifndef Assignment3_common_h
#define Assignment3_common_h

#include <sys/time.h>

#define THREAD_COUNT	4
#define TASK_COUNT		30
#define PRIORITY_MAX	10
#define PRIORITY_LEVEL_GOLD		2
#define PRIORITY_LEVEL_SILVER	6
#define PRIORITY_LEVEL_BRONZE	10

#define TIME_GOLD_MIN	50
#define TIME_GOLD_MAX	120
#define TIME_SILVER_MIN	500
#define TIME_SILVER_MAX	5000
#define TIME_BRONZE_MIN	500
#define TIME_BRONZE_MAX	5000

#define MAX_SERVICE_TIME_SILVER	50
#define MAX_SERVICE_TIME_BRONZE	100

#define MAX_SILVER_BEFORE_BRONZE	2

typedef struct task_t {
	int id;
	int remaining_time;
	int total_time;
	int priority;
	int priority_level;
	struct timeval start_time;
} task_t;


#endif
