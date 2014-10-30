
all: monitor controller

make_temp_dir:
	-mkdir ./bin
	-mkdir ./bin/temp	
	
monitor: make_temp_dir common
	gcc -o ./bin/temp/monitor.o -c ./src/monitor.c
	gcc -o ./bin/monitor ./bin/temp/monitor.o ./bin/temp/common.o
	
controller: make_temp_dir common
	gcc -o ./bin/temp/controller.o -c ./src/controller.c
	gcc -o ./bin/controller ./bin/temp/controller.o ./bin/temp/common.o

common: make_temp_dir
	gcc -o ./bin/temp/common.o -c ./src/common.c
	
clean:
	-rm ./bin/monitor
	-rm ./bin/controller
	-rm -rf ./bin/temp
	-rm ./bin/fifo.*

