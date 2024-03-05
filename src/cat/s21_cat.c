#include "s21_cat.h"

int main(int argc, char* argv[]) {
  opt options = {0};
  parser(argc, argv, &options);
  if (options.b) options.n = 0;
  reader(argc, argv, &options);
  return 0;
}

void parser(int argc, char* argv[], opt* options) {
  static struct option long_options[] = {{"number-nonblank", 0, NULL, 'b'},
                                         {"number", 0, NULL, 'n'},
                                         {"squeeze-blank", 0, NULL, 's'},
                                         {NULL, 0, NULL, 0}};
  int opt;
  int options_index;
  while ((opt = getopt_long(argc, argv, "+benstvTE", long_options,
                            &options_index)) != -1) {
    switch (opt) {
      case 'b':
        options->b = 1;
        break;
      case 'e':
        options->e = 1;
        options->v = 1;
        break;
      case 'E':
        options->e = 1;
        break;
      case 'n':
        options->n = 1;
        break;
      case 's':
        options->s = 1;
        break;
      case 't':
        options->t = 1;
        options->v = 1;
        break;
      case 'T':
        options->t = 1;
        break;
      case 'v':
        options->v = 1;
        break;
      default:
        fprintf(stderr, "usage: cat [-benstuv] [file ...]\n");
        return;
    }
  }
}

void reader(int argc, char* argv[], opt* options) {
  for (int i = optind; i < argc; i++) {
    FILE* f = fopen(argv[i], "rt");
    if (f != NULL) {
      int cur, str_count = 0, counter = 0, empty_string = 0, prev = 0;
      while ((cur = fgetc(f)) != EOF) {
        if (options->s) {
          if (cur == '\n' && prev == '\n') {
            if (empty_string) continue;
            empty_string = 1;
          } else {
            empty_string = 0;
          }
        }
        b_flag(&cur, &counter, &str_count, options);
        n_flag(&cur, &counter, &str_count, options);
        e_flag(&cur, options);
        v_flag(&cur, options);
        t_flag(&cur, options);
        printf("%c", cur);
        prev = cur;
      }
      fclose(f);
    } else {
      fprintf(stderr, "cat: %s: No such file or directory\n", argv[i]);
    }
  }
}

void b_flag(int* cur, int* counter, int* str_count, opt* options) {
  if (options->b) {
    if (*counter == 0 && *cur != '\n') printf("%6d\t", ++(*str_count));
    *counter = 1;
    if (*cur == '\n') *counter = 0;
  }
}

void n_flag(int* cur, int* counter, int* str_count, opt* options) {
  if (options->n) {
    if (*counter == 0) printf("%6d\t", ++(*str_count));
    *counter = 1;
    if (*cur == '\n') *counter = 0;
  }
}

void e_flag(int* cur, opt* options) {
  if (options->e && (*cur == '\n')) printf("$");
}

void v_flag(int* cur, opt* options) {
  if (options->v) {
    if (*(cur) > 127 && *(cur) < 160) printf("M-^");
    if ((*(cur) < 32 && *(cur) != '\n' && *(cur) != '\t') || *(cur) == 127)
      printf("^");
    if ((*(cur) < 32 || (*(cur) > 126 && *(cur) < 160)) && *(cur) != '\n' &&
        *(cur) != '\t') {
      if (*(cur) > 126) {
        *(cur) = *(cur)-128 + 64;
      } else {
        *(cur) = *(cur) + 64;
      }
    }
  }
}

void t_flag(int* cur, opt* options) {
  if (options->t && *cur == '\t') {
    printf("^");
    *cur = '\t' + 64;
  }
}
