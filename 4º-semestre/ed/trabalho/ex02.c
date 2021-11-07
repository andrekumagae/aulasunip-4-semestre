#include <stdio.h> #include<conio.h> #include<stdlib.h>

void main()
{
    int i = 123;
    printf("\nprintf1 %x", i);
    printf("\nprintf2 %x", &i);
    int *ei;
    printf("\nprintf3 %x", &ei);
    ei = &i;
    printf("\nprintf? %x", ei);
}