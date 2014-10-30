//
// SYSC 4001 - Assignment 1
// Monisha Gunalan (100871444)
// Korey Conway (100838924)
// October 2013
//

#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <stdbool.h>
#include <unistd.h>
#include <stdarg.h>
#include "common.h"

// Variables
static pid_t child_pid = -1;
static pid_t parent_pid = -1;

// Fork the process into 2 sections, parent_main(), and child_main()
void fork_process(void(*parent_main)(), void(*child_main)()) {
	// Fork the child
	get_parent_pid();
	child_pid = fork();
	
	switch(child_pid) {
		case -1: // fork failed
			dump("Fork failed");
			exit(1);
		case 0: // child
			child_main();
			break;
		default: // parent
			parent_main();
			break;
	}
}

// Output to display and say which process it is from (parent or child)
void dump(const char * format, ...) {
	va_list args;
	va_start(args, format);
	
	if (is_parent()) {
		printf("[parent] ");
	} else {
		printf("[child]  ");
	}
	
	vprintf(format, args);
	printf("\n");
	
	va_end(args);
}

// Check if we are the parent
bool is_parent() {
	return (getpid() == get_parent_pid());
}

// Convert a signal type to string
char* get_signal_name(int sigtype) {
	char *signame;
	
	switch(sigtype) {
		case SIGTERM:
			signame = "SIGTERM";
			break;
		case SIGINT:
			signame = "SIGINT";
			break;
		default:
			signame = "UNKNOWN";
	}
	return signame;
}

// Setup the signal handler for a signal type
void setup_signal_handling(int sigtype, void(*handler)(int)) {
	// Setup signal listening
	char *signame = get_signal_name(sigtype);
	dump("Setup signal handling for signal type: %s", signame);

	struct sigaction handle_act = {
		.sa_handler = handler,
		.sa_flags = 0
	};
	
	sigemptyset(&handle_act.sa_mask);
	sigaction(sigtype, &handle_act, 0);
}

// Send a signal to either parent or child
void send_signal(int sigtype, bool parent_is_destination) {
	char *signame = get_signal_name(sigtype);
	
	if (parent_is_destination) {
		dump("Sending %s signal to parent process", signame);
		if (is_parent()) {
			kill(getpid(), sigtype);
		} else {
			kill(getppid(), sigtype);
		}
	} else {
		dump("Sending %s signal to child process", signame);
		
		if(!is_parent()) {
			kill(getpid(), sigtype);
		} else if (child_pid > 0) {
			kill(child_pid, sigtype);
		}
	}
}

// Get the parent pid
pid_t get_parent_pid() {
	if (-1 == parent_pid) {
		parent_pid = getpid();
	}
	
	return parent_pid;
}

// Get the child pid
pid_t get_child_pid() {
	if (is_parent()) {
		return child_pid;
	} else {
		return getpid();
	}
}
