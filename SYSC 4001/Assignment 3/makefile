TARGET  := assign3
SRCS    := $(wildcard src/*.c)
OBJS    := $(addprefix bin/, $(notdir ${SRCS:.c=.o}))

CC     = gcc
CCFLAGS = -std=gnu99 -Wall -MMD -pthread
LDFLAGS = -pthread

all:: ${TARGET} 

${TARGET}: ${OBJS} 
	${CC} ${LDFLAGS} -o bin/$@ $^ 

${OBJS}: bin/%.o: src/%.c
	${CC} ${CCFLAGS} -o $@ -c $< 

clean:
	@-find ./bin -type f -not -name 'README' | xargs rm
	@-find ./bin/* -type d | xargs rm -r

