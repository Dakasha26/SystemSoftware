
program: program.o fibonacci.o
		gcc -o program program.o fibonacci.o

program.o: program.c fibonacci.h
		gcc -c -o program.o program.c

fibonacci.o: fibonacci.o fibonacci.h
		gcc -c -o fibonacci.o fibonacci.c


clean: rm
