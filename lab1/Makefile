.PHONY: clean

OBJS = fibonacci.o program.o
CFLAGS = -g3

program: $(OBJS)
		gcc $(CFLAGS) -o program $(OBJS)

program.o: program.c fibonacci.h
		gcc $(CFLAGS) -c -o program.o program.c

fibonacci.o: fibonacci.o fibonacci.h
		gcc $(CFLAGS) -c -o fibonacci.o fibonacci.c


clean:
		rm -f fibonacci *.o *~ *.a

asm:
		gcc -c -S -o fibonacci.s fibonacci.c
		gcc -c -s -o program.s program.c
