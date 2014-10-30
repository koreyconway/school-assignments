//
//  controller.h
//  Assignment 1
//
//  Created by Korey Conway on 2013-10-07.
//  Copyright (c) 2013 SG•Nexus. All rights reserved.
//

#ifndef Assignment_1_controller_h
#define Assignment_1_controller_h

#define MAX_MONITORS 25

// Functions
bool init(void);

void parent_main(void);
void parent_loop(void);

void child_main(void);
void child_loop(void);

void close_monitor(int monitor_pid);
void handle_signal(int sigtype);
#endif
