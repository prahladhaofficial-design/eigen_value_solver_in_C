CC=gcc
CFLAGS=-Wall -Wextra -O2

all: eigen

eigen: src/eigen.c
	$(CC) $(CFLAGS) src/eigen.c -o eigen

clean:
	rm -f eigen eigen.exe