#include <stdio.h>
#include <stdlib.h>

typedef struct elemento{
    int info;
    struct elemento *prox;
}no;

no *inicio, *novo, *fim, *aux, *aux1;
int criado = 0;

void criar();
void insereInicio();
void imprimir();
void comprimento();
void excluirInicio();
void insmeio(no*t, int x);
void remeio(no*t);
void insreFim();
void removeFim();

int main(int argc, char const *argv[])
{
    system("cls");
    return 0;
}

void criar()
{
    inicio = fim = null;
    criado = 1;
    printf("\nLista criada\n\n");
}

void comprimento()
{
    int cont = 0;
    aux = inicio;
    while (aux != null)
    {
        cont++;
        aux = aux -> prox;
    }
    printf("\nOtamanho da lista eh: %d\n",cont);
    getch();
    system("cls");
}

void insereInicio()
{
    int valor;
    if (criado==1)
    {
        printf("Entre com um valor para ser armazneado na lista\n");
        scanf("%d",&valor);
        novo = (no *)malloc( sizeof(no));
        novo -> info = valor;
        if (inicio == null){
            inicio = fim = novo;
            novo -> prox = null;
        }
        {
            /* code */
        }
        
    }else{
        novo -> prox = inicio;
        inicio = novo;
    }
    
}
