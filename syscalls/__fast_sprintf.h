#ifndef MYSYSDIG_FAST_SPRINTF_H
#define MYSYSDIG_FAST_SPRINTF_H
#include <stdarg.h>

static char *my_sprintf_assemble_string(char *dst_buf, const char *str) {
  char *tmp = (char *)str;
  while (*tmp != '\0') {
    *dst_buf = *tmp;
    dst_buf++;
    tmp++;
  }
  return dst_buf;
}

typedef union {
  unsigned long long _unsigned_long_val;
  long long _long_val;
  int _int_val;
  unsigned _unsigned_val;
} _number;

static char *my_sprintf_assemble_number(char *dst_buf, _number var,
                                       const short base, const bool singed,
                                       const bool is_32) {
  static char sta[35];
  static const char c20[] = "0123456789abcdef";
  int top = 0;
  bool neg_flag = false;
  if (singed) {
    if (is_32) {
      if (var._int_val < 0) {
        var._int_val = -var._int_val;
        neg_flag = true;
      }
      do {
        sta[top++] = c20[var._int_val % base];
        var._int_val /= base;
      } while (var._int_val);
    } else {
      if (var._long_val < 0) {
        var._long_val = -var._long_val;
        neg_flag = true;
      }
      do {
        sta[top++] = c20[var._long_val % base];
        var._long_val /= base;
      } while (var._long_val);
    }
    if (neg_flag) {
      sta[top++] = '-';
    }
  } else {
    if (is_32) {
      do {
        sta[top++] = c20[var._unsigned_val % base];
        var._unsigned_val /= base;
      } while (var._unsigned_val);
    } else {
      do {
        sta[top++] = c20[var._unsigned_long_val % base];
        var._unsigned_long_val /= base;
      } while (var._unsigned_long_val);
    }
  }
  while (top) {
    *dst_buf = sta[--top];
    dst_buf++;
  }
  return dst_buf;
}

int fast_sprintf(char *dst_buf, char *format, ...) {
  va_list args;
  int format_cnt = 0;
  _number num;
  va_start(args, format);

  while (*format != '\0') {
    if (*format == '%') {
      format++;
      if (*format == 'l') {
        format++;
        if (*format == 'd') {
          num._long_val = va_arg(args, long);
          dst_buf = my_sprintf_assemble_number(dst_buf, num, 10, true, false);
        } else if (*format == 'u') {
          num._unsigned_val = va_arg(args, unsigned long);
          dst_buf = my_sprintf_assemble_number(dst_buf, num, 10, false, false);
        } else if (*format == 'x') {
          num._long_val = va_arg(args, long);
          dst_buf = my_sprintf_assemble_number(dst_buf, num, 16, false, false);
        } else {
          // unsupported
          format_cnt--;
        }
      } else if (*format == 'd') {
        num._int_val = va_arg(args, int);
        dst_buf = my_sprintf_assemble_number(dst_buf, num, 10, true, true);
      } else if (*format == 'u') {
        num._unsigned_val = va_arg(args, unsigned);
        dst_buf = my_sprintf_assemble_number(dst_buf, num, 10, false, true);
      } else if (*format == 'p') {
        // base 16
        num._unsigned_val = (unsigned long)va_arg(args, void *);
        dst_buf = my_sprintf_assemble_number(dst_buf, num, 16, false, true);
      } else if (*format == 'x') {
        num._int_val = va_arg(args, int);
        dst_buf = my_sprintf_assemble_number(dst_buf, num, 16, false, true);
      } else if (*format == 's') {
        dst_buf = my_sprintf_assemble_string(dst_buf, va_arg(args, char *));
      } else {
        // unsupported
        format_cnt--;
      }
      format_cnt++;
    } else {
      *dst_buf = *format;
      dst_buf++;
    }
    // *format = *format + 1;
    format++;
  }
  va_end(args);
  *dst_buf = '\0';
  return format_cnt;
}

#endif