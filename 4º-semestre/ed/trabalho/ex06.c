#include <stdio.h>

void Hanoi(int discos, char origem, char destino, char auxiliar)
{
    if (discos == 1)
    {
        printf("\nDisco 1 de %c -> %c", origem, destino);
        return;
    }
    Hanoi(discos - 1, origem, auxiliar, destino);
    printf("\nDisco %d de %c -> %c", discos, origem, destino);
    Hanoi(discos - 1, auxiliar, destino, origem);
}
void main() { Hanoi(2, 'A', 'C', 'B'); }