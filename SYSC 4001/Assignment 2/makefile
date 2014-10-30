TARGET  := assign2
SRCS    := $(wildcard src/*.c)
OBJS    := $(addprefix bin/, $(notdir ${SRCS:.c=.o}))
#DEPS    := $(addprefix bin/, $(notdir ${SRCS:.c=.dep}))
XDEPS   := $(wildcard ${DEPS}) 

CCFLAGS = -std=gnu99 -Wall -MMD
LDFLAGS = -pthread -lrt
LIBS    = 

.PHONY: all clean distclean 
all:: ${TARGET} 

ifneq (${XDEPS},) 
include ${XDEPS} 
endif 

${TARGET}: ${OBJS} 
	#-include $(OBJS:bin/.o=.d)
	${CC} ${LDFLAGS} -o bin/$@ $^ ${LIBS} 

${OBJS}: bin/%.o: src/%.c
	${CC} ${CCFLAGS} -o $@ -c $< 

#${DEPS}: %.dep: %.c makefile 
#	${CC} ${CCFLAGS} -MM $< > $@ 

clean:
	-rm -f bin/*

distclean:: clean

