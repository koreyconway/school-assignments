//
//  SYSC 4001 - Assignment 1
//  Monisha Gunalan (100871444)
//  Korey Conway (100838924)
//  October 2013
//

#ifndef Assignment_1_common_h
#define Assignment_1_common_h

// Constants
#define CONTROLLER_FIFO_NAME "./fifo.controller"
#define MONITOR_FIFO_NAME "./fifo.monitor.%d"
#define MONITOR_FIFO_NAME_MAX_LENGTH sizeof(MONITOR_FIFO_NAME) + 5
#define MESSAGE_QUEUE_KEY ftok(CONTROLLER_FIFO_NAME, 5555)
#define NAME_MAX_LENGTH 50

// Data Types
typedef struct process_t {
	bool(*setup)();
	void(*loop)();
	void(*cleanup)();
} process_t;

typedef struct msg_data {
	long int destination_key;
	struct {
        int source_key;
		int heartbeat;
		bool ack;
		char patient_name[NAME_MAX_LENGTH];
	} data;
} msg_data;

typedef struct fifo_data {
	pid_t source_pid;
	enum {
		START, // controller tells monitor to start
		STOP, // controller tells monitor to stop
		CONNECT, // monitor requests connection to controller
		STOPPING // monitor informs controller that it is stopping
	} request_type;
} fifo_data;



// Functions
void fork_process(void(*parent_main)(), void(*child_main)());
void dump(const char * format, ...);
bool is_parent(void);
void setup_signal_handling(int sigtype, void(*handler)());
void send_signal(int signal_type, bool parent);
pid_t get_parent_pid(void);
pid_t get_child_pid(void);
char* get_signal_name(int sigtype);
#endif
