#include "s21_grep.h"

int main(int argc, char* argv[]) {
  opt options = {0};
  parsing(argc, argv, &options);
  while (optind < argc) {
    output(argv, &options);
    optind++;
  }
  return 0;
}
void parsing(int argc, char* argv[], opt* options) {
  int opt;
  while ((opt = getopt(argc, argv, "e:ivclnhsf:o")) != -1) {
    switch (opt) {
      case 'e':
        options->e = 1;
        strcat(options->str_regexec, optarg);
        strcat(options->str_regexec, "|");
        break;
      case 'i':
        options->i = 1;
        break;
      case 'v':
        options->v = 1;
        break;
      case 'c':
        options->c = 1;
        break;
      case 'l':
        options->l = 1;
        break;
      case 'n':
        options->n = 1;
        break;
      case 'h':
        options->h = 1;
        break;
      case 's':
        options->s = 1;
        break;
      case 'f':
        options->f = 1;
        strcpy(options->file_name, optarg);
        file_flag(options, argv);
        break;
      case 'o':
        options->o = 1;
        break;
      default:
        fprintf(stderr,
                "usage: grep [-ivclnhso] [-e pattern] [-f file] [pattern] "
                "[file ...]");
        exit(1);
    }
  }
  if (options->v && options->o) {
    options->o = 0;
  }
  if (!options->e && !options->f) {
    if (argc > optind) {
      strcat(options->str_regexec, argv[optind]);
    }
    optind++;
  }
  if (options->e || options->f) {
    options->str_regexec[strlen(options->str_regexec) - 1] = '\0';
  }
  if (argc - optind > 1) options->c_flag = 1;
}
void output(char* argv[], opt* options) {
  int match = 0, match_counter = 0, str_counter = 0;
  regex_t reg;
  regmatch_t start;
  FILE* file = fopen(argv[optind], "r");
  if (file != NULL) {
    if (options->i) {
      int flag_i = REG_EXTENDED | REG_ICASE;
      regcomp(&reg, options->str_regexec, flag_i);
    } else
      regcomp(&reg, options->str_regexec, REG_EXTENDED);
    while (fgets(options->str, ARRAY, file) != NULL) {
      match = regexec(&reg, options->str, 1, &start, 0);
      str_counter++;
      if (options->o) strcpy(options->str_o, options->str);
      if ((!match || options->v) && options->c_flag && !options->l &&
          !options->h && !options->c && !options->f)
        printf("%s:",
               argv[optind]);  //оргинальный grep при нескольких шаблонах е
      if ((!match || options->v) && options->c_flag && !options->l &&
          !options->h && !options->c && options->f && !options->e)
        printf("%s:", argv[optind]);  //оргинальный grep при нескольких файлах
      if (!match) match_counter++;     // флаг с
      if (options->v) match = !match;  // флаг v
      if (!match && !options->l && !options->c && !options->n && !options->o) {
        printf("%s", options->str);  //оргинальный grep при одном файле
        if (options->str[strlen(options->str) - 1] != '\n') printf("\n");
      }
      flag_n(&str_counter, &match, options);
      if (!match && options->o && !options->l && !options->c) {
        char* pointer = options->str_o;
        while ((regexec(&reg, pointer, 1, &start, 0) == 0)) {
          printf("%.*s\n", (int)(start.rm_eo - start.rm_so),
                 pointer + start.rm_so);
          pointer += start.rm_eo;
        }
      }
    }
    regfree(&reg);
    flag_cl(&match_counter, &str_counter, argv, options);
    fclose(file);
  } else {
    if (!options->s) {
      fprintf(stderr, "grep: %s: No such file or directory\n", argv[optind]);
    }
  }
}

void flag_n(int* str_counter, int* match,
            opt* options) {  //нумерация строк флаг n
  if (!(*match) && options->n && !options->c && !options->l) {
    if (options->o) {
      printf("%d:", *str_counter);
    } else {
      printf("%d:%s", *str_counter, options->str);
    }
    if (options->str[strlen(options->str) - 1] != '\n') printf("\n");
  }
}
void flag_cl(int* match_counter, int* str_counter, char* argv[], opt* options) {
  if (options->l && *match_counter > 0 && !options->c)
    printf("%s\n", argv[optind]);  //Работа флагов cl
  if (options->c && options->c_flag && !options->h) printf("%s:", argv[optind]);
  if (options->c && !options->l && !options->v) printf("%d\n", *match_counter);
  if (options->c && !options->l && options->v)
    printf("%d\n", *str_counter - *match_counter);
  if (options->c && options->l) {
    if (*match_counter > 0) {
      *match_counter = 1;
      printf("%d\n%s\n", *match_counter, argv[optind]);
    } else {
      printf("%d\n", *match_counter);
    }
  }
}

void file_flag(opt* options, char* argv[]) {
  FILE* f;
  f = fopen(options->file_name, "r");
  if (f != NULL) {
    while (!feof(f)) {
      if (fgets(options->str, 1000, f) != NULL) {
        if (options->str[strlen(options->str) - 1] == '\n' &&
            strlen(options->str) - 1 != 0) {
          options->str[strlen(options->str) - 1] = '\0';
        }
        strcat(options->str_regexec, options->str);
        strcat(options->str_regexec, "|");
      }
    }
    fclose(f);
  } else {
    fprintf(stderr, "grep: %s: No such file or directory\n", argv[optind - 1]);
  }
}
