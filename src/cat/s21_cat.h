#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct options {
  int b;
  int e;
  int n;
  int s;
  int t;
  int v;
} opt;

void parser(int argc, char* argv[], opt* options);
void reader(int argc, char* argv[], opt* options);
void b_flag(int* cur, int* counter, int* str_count, opt* options);
void n_flag(int* cur, int* counter, int* str_count, opt* options);
void e_flag(int* cur, opt* options);
void v_flag(int* cur, opt* options);
void t_flag(int* cur, opt* options);