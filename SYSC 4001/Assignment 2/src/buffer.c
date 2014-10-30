//
// SYSC 4001 - Assignment 2
// Monisha Gunalan (100871444)
// Korey Conway (100838924)
// November 2013
//

#include <stdlib.h>
#include <stdio.h>
#include <sys/mman.h>
#include <sys/stat.h> /* For mode constants */
#include <fcntl.h> /* For O_* constants */
#include <unistd.h>
#include <sys/types.h>
#include "buffer.h"

static int buffer_size;
static int buffer_memory_size;
static int buffer_fd; // Buffer file descriptor
static buffer_st* buffer;

// Initializes the buffer in shared memory
void buffer_init(int buff_size, int producers_count)
{
    // Save buffer size in global var
    buffer_size = (buff_size > BUFFER_MAX_VALUES) ? BUFFER_MAX_VALUES : buff_size;
    buffer_memory_size = sizeof(buffer_st);
    
    // Create shared memory
    buffer_fd = shm_open(BUFFER_SHM_KEY, O_RDWR | O_CREAT, 0666);
    
    // Check for errors
    if (-1 == buffer_fd) {
        fprintf(stderr, "Failed to create buffer\n");
        exit(-1);
    }
    
    // Allocate the buffer memory size
    ftruncate(buffer_fd, buffer_memory_size);
    
    // Map the shared memory to the process
    buffer = (buffer_st *) mmap(NULL, buffer_memory_size, PROT_READ | PROT_WRITE, MAP_SHARED, buffer_fd, 0);
    
    // Initialize the indices
    buffer->in_index = 0;
    buffer->out_index = 0;
    
    // Initialize the producers count
    buffer->producers = producers_count;
}

// Retrieves the next value from the buffer and increments the out index
// Returns the index of where the value was retrieved
// Returns -1 if there are no more producers
int buffer_retrieve(int* value)
{
    if (buffer->producers <= 0) {
        return -1;
    }
    
    int index = buffer->out_index;
    *value = buffer->values[buffer->out_index];
    buffer->out_index = (buffer->out_index + 1) % buffer_size;
    msync(buffer, buffer_memory_size, MS_SYNC | MS_INVALIDATE); // ensure values are synced across processes
    return index;
}

// Adds a value the the buffer and increments the in index
// Returns the buffer index where the value is stored
int buffer_add(int value)
{
    int index = buffer->in_index;
    buffer->values[buffer->in_index] = value;
    buffer->in_index = (buffer->in_index + 1) % buffer_size;
    msync(buffer, buffer_memory_size, MS_SYNC | MS_INVALIDATE); // ensure values are synced across processes
    return index;
}

int buffer_decrement_producers()
{
    buffer->producers -= 1;
    return buffer->producers;
}

// Closes the buffer
void buffer_close()
{
    close(buffer_fd);
}

// Deletes the buffer
void buffer_delete()
{
    shm_unlink(BUFFER_SHM_KEY);
}
