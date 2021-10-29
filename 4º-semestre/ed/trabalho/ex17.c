#include <stdio.h>
#include <conio.h>
#include <stdlib.h>

int x[20];
int b = 0;
void abcd(int a)
{
    x[b] = a;
    b++;
}
int xpto() { return (x[--b]); }
int tamanho() { return b; }
void main()
{
    printf("Colocando dados\n");
    abcd(5);
    //x[0] = 5;
    //b = 1
    //5
    abcd(9);
    //x[1] = 9;
    //b = 1
    //59
    abcd(3);
    //x[2] = 3;
    //b = 2
    //vetor: 593
    for (int i = 0; i <= b; i++)
    {
        printf("Valor: %d\nPosicao: %d\n", x[i], i);
    }
    printf("Tamanho: %d\n", tamanho());
    printf("Pegando dado na posicao %d: %d\n", b, x[b]);
    printf("Pegando dado: %d\n", xpto());
    //O vetor em C sempre aponta para um espaço vazio
    //Logo apesar de ter add 3 numeros ao vetor, a posicao atual eh x[3] = 0
    //executando o metodo xpto, eh decrementado um valor
    //Ou seja, executa o LIFO de uma pilha
    printf("Pegando dado: %d\n", xpto());
    //x[--b]
    //b-1 = 1
    //3
    printf("Pegando dado: %d\n", xpto());
    printf("Novo tamanho: %d\n", tamanho());
}