CC = gcc
FLAGS = -Wall -Werror -Wextra -std=c11 -Wpedantic
CFLAGS = -c -Wall -Werror -Wextra
MAKE = make 

all: s21_grep

s21_grep: s21_grep.o
	$(CC) $(FLAGS) s21_grep.o -o s21_grep
s21_grep.o: s21_grep.c
	$(CC) $(CFLAGS) s21_grep.c
clean:
	rm -rf s21_grep s21_grep.o

rebuild:
	$(MAKE) clean
	$(MAKE) all
 