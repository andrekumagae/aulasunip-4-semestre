#include <stdio.h>

int fibonacci(int num)
{
    if (num == 1 || num == 2)
        return 1;
    else
        return fibonacci(num - 1) + fibonacci(num - 2);
}
int main()
{
    int i;
    //clrscr();
    for (i = 0; i < 5; i++)
        printf("%d ", fibonacci(i + 1));
    getch();
    return 0;
}