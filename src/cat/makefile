CC = gcc
FLAGS = -Wall -Werror -Wextra -std=c11 -Wpedantic
CFLAGS = -c -Wall -Werror -Wextra
MAKE = make 

all: s21_cat

s21_grep: s21_cat.o
	$(CC) $(FLAGS) s21_cat.o -o s21_cat
s21_cat.o: s21_cat.c
	$(CC) $(CFLAGS) s21_cat.c
clean:
	rm -rf s21_cat s21_cat.o

rebuild:
	$(MAKE) clean
	$(MAKE) all
 