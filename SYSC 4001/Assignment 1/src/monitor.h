//
// SYSC 4001 - Assignment 1
// Monisha Gunalan (100871444)
// Korey Conway (100838924)
// October 2013
//

#ifndef monitor_h
#define monitor_h

// Constants
#define HEARTBEAT_INTERVAL 2
#define HEARTBEAT_MAX 100
#define HEARTBEAT_MIN 60
#define RAND_SEED (unsigned) time(NULL)

// Functions
bool init(void);
void parent_main(void);
void parent_loop(void);
void child_main(void);
void child_loop(void);
void handle_signal(int sigtype);
#endif
