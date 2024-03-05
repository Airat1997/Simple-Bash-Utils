#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define ARRAY 10000

typedef struct options {
  int e;  //+
  int i;  //+
  int v;  //+
  int c;  //+
  int l;  //+
  int n;  //+
  int h;
  int s;  //+
  int f;  //+
  int o;
  int c_flag;
  char str_o[ARRAY];
  char str[ARRAY];
  char str_regexec[ARRAY];
  char file_name[ARRAY];  //Имя для файла
} opt;

void parsing(int agrc, char* agrv[], opt* options);
void output(char* argv[], opt* options);
void file_flag(opt* options, char* agrv[]);
void flag_cl(int* match_counter, int* str_counter, char* argv[], opt* options);
void flag_n(int* str_counter, int* match, opt* options);
