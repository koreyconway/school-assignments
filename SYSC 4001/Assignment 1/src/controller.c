//
//  SYSC 4001 - Assignment 1
//  Monisha Gunalan (100871444)
//  Korey Conway (100838924)
//  October 2013
//

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <sys/msg.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <stdbool.h>
#include <fcntl.h>
#include <signal.h>
#include "common.h"
#include "controller.h"

// Variables
int controller_fifo_fd = -1;
int msg_queue_id = -1;
int monitor_pid[MAX_MONITORS];
int monitor_count = 0;
bool running = true;

int main(int argc, const char * argv[])
{
	// Init
	if (false == init()) {
		dump("Finshed");
		return 1;
	}
	
	// For the 2 processes, and handle the signals and main loops
	fork_process(parent_main, child_main);

    return 0;
}

bool init() {
	// Setup inital signal handling
	setup_signal_handling(SIGINT, handle_signal);
	setup_signal_handling(SIGTERM, handle_signal);

	// Create controller FIFO
	if (-1 == mkfifo(CONTROLLER_FIFO_NAME, 0777)) {
		dump("Failed to create controller FIFO with error: %d", errno);
		return false;
	}
	
	// Create message queue
	msg_queue_id = msgget(MESSAGE_QUEUE_KEY, 0666 | IPC_CREAT);
	if (-1 == msg_queue_id) {
		dump("Failed to setup mesage queue with error: %d", errno);
		unlink(CONTROLLER_FIFO_NAME);
		return false;
	}
	
	return true;
}

void parent_main() {
	while(running) {
		parent_loop();
	}
	
	int i;
	for(i = 0; i < monitor_count; i++) {
		close_monitor(monitor_pid[i]);
	}
	
	dump("Removing fifo file: %s", CONTROLLER_FIFO_NAME);
	unlink(CONTROLLER_FIFO_NAME);
	dump("Finished");

}

void parent_loop() {
	dump("Waiting to receive request through FIFO");
	
	// Open FIFO (blocks until monitor connects)
	controller_fifo_fd = open(CONTROLLER_FIFO_NAME, O_RDONLY);
	if (-1 == controller_fifo_fd) {
		if (EINTR != errno) {
			dump("[warn] Failed to open fifo with error: %d", errno);
		}
		return;
	}

	// Read from controller FIFO
	fifo_data fdata;
	if (-1 == read(controller_fifo_fd, &fdata, sizeof(fdata))) {
		// Error reading from fifo, just warn and continue next request
		if (EINTR != errno) {
			dump("[warn] Failed to read fifo with error: %d", errno);
		}
		return;
	}
	
	switch(fdata.request_type) {
		case CONNECT:
			dump("Received request to start from PID: %d", fdata.source_pid);

			// Open FIFO for monitor to respond
			char monitor_fifo_name[MONITOR_FIFO_NAME_MAX_LENGTH];
			sprintf(monitor_fifo_name, MONITOR_FIFO_NAME, fdata.source_pid);
			dump("Opening fifo %s to respond.", monitor_fifo_name);
			int monitor_fifo_fd = open(monitor_fifo_name, O_WRONLY);
			if (-1 == monitor_fifo_fd) {
				dump("Failed to open fifo with error: %d", errno);
				return; // continue looping
			}

			// Add the PID to the array and increment count
			monitor_pid[monitor_count++] = fdata.source_pid;

			// Write response
			dump("Responding with start command");
			fdata.source_pid = get_child_pid();
			fdata.request_type = START;
			if(-1 == write(monitor_fifo_fd, &fdata, sizeof(fdata))) {
				dump("Failed to write to fifo");
				close(monitor_fifo_fd);
				return; // continue looping
			}
			
			close(monitor_fifo_fd);
			
			return;
		default:
			dump("Received unknown request. Ignoring it.");
			return;
	}
}

void close_monitor(int monitor_pid) {
	// Open FIFO for monitor to respond
	char monitor_fifo_name[MONITOR_FIFO_NAME_MAX_LENGTH];
	sprintf(monitor_fifo_name, MONITOR_FIFO_NAME, monitor_pid);
	dump("Opening fifo %s to send terminate request.", monitor_fifo_name);
	int monitor_fifo_fd = open(monitor_fifo_name, O_WRONLY);
	if (-1 == monitor_fifo_fd) {
		dump("Failed to open fifo with error: %d", errno);
		return;
	}
	
	// Write response
	dump("Sending request to terminate to monitor pid: %d", monitor_pid);
	fifo_data fdata;
	fdata.source_pid = getpid();
	fdata.request_type = STOP;
	if(-1 == write(monitor_fifo_fd, &fdata, sizeof(fdata))) {
		dump("Failed to write to fifo");
	}
	
	close(monitor_fifo_fd);
}


void child_main() {
	// Ignore control-C in child
	setup_signal_handling(SIGINT, SIG_IGN);

	// Create the message queue
	msg_queue_id = msgget(MESSAGE_QUEUE_KEY, 0666 | IPC_CREAT);
	
	if (msg_queue_id == -1) {
		// Invalid message queue
		dump("Failed to open/create controller queue.");
		send_signal(SIGTERM, true);
		return;
	}
	
	while(running) {
		child_loop();
	}
	
	// Delete the message queue
	dump("Removing message queue");
	if (-1 == msgctl(msg_queue_id, IPC_RMID, 0)) {
		dump("Failed to delete message queue");
	}
	
	dump("Finished");
}

void child_loop() {
	msg_data msg;
	
	// Read from message queue
	dump("Reading from the message queue");
	
	if (-1 == msgrcv(msg_queue_id, &msg, sizeof(msg.data), getpid(), 0)) {
		if (EINTR != errno) {
			dump("Failed to receive from message queue with error: %d", errno);
		}
		return;
	}

	dump("Received heartbeat: %d from %s", msg.data.heartbeat, msg.data.patient_name);

	dump("Sending ack back to monitor\n");
	msg_data response_msg = {
		.destination_key = msg.data.source_key,
		.data = {
			.source_key = getpid(),
			.heartbeat = 0,
			.ack = true,
			.patient_name = "",
		},
	};
	
	// Sending ack back message to monitor
	if( -1 == msgsnd(msg_queue_id, &response_msg, sizeof(msg.data), 0)) {
		if (EINTR != errno) {
			dump("Failed to send from message queue with error: %d", errno);
		}
		return;
	}

}

void handle_signal(int sigtype) {
	if (SIGINT == sigtype) {
		dump("Received SIGINT signal");
		running = false;
		
		if (is_parent()) {
			send_signal(SIGTERM, false);
		}
	} else if (SIGTERM == sigtype) {
		dump("Received SIGTERM signal");
		running = false;
		
		if (is_parent()) {
			send_signal(SIGTERM, false);
		}
	} else {
		dump("Received unknown signal. Ignoring it");
	}
}


