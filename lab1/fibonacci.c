#include <stdio.h>
#include "fibonacci.h"

void fibonacci() {
  int i, first = 0, second = 1, next;
  for(i = 0; i < 30; i++) {
    if(i <= 1) {
      next = i;
    } else {
      next = first + second;
      first = second;
      second = next;
    }
    printf("%d\n", next);
  }
}
