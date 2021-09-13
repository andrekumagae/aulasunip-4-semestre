from time import sleep  # Módulo que simula tempo de 2 segundos para criptografar e descriptografar mensagens.

M = N1 = cont = D = 0  # Todos as variáveis começarão com 0, porem no conforme o programa é utilizado
# cada uma vai ter seu valor definido
CRIP = []  # Varaivel utilizada para receber o texto convertido em números da tabela ASCII
crip = []  # Variavel recebe CRIP eleva a D, após isso calcula o resto da divisão por N
DECRIP = []  # Calculo para descriptografar recebe criptografia, eleva a D, após isso calcula o resto da divisão por N
decript = []  # Recebe DESCRIP e retorna a variável em caractere
TEXTO = input('DIGITE O QUE DESEJA CRIPTOGRAFAR: ')  # Usuario digita a palavra que gostaria de cifrar
TAMANHO = len(TEXTO)  # Mostra em números quantos caracteres foram digitados


def decrip():
    print('\033[31mMensagem decodificada... \033[m ')  # Função utilizada para chamar a mensagem ao termino


for c in range(0, TAMANHO, 1):  # Contar de 0 até o que foi definido pela variável TAMANHO, em 1 passo.
    CRIP.append(int(ord(TEXTO[c])))  # CRIP recebe O TEXTO e converte para TABELA ASCII
    p = 41  # 1º Primeiro número primo
    q = 107  # 2º Segundo número Primo
    n = p * q  # Multiplicar para obter o número N que vai ser utilizado para codificar e decodificar.
    M = ((p - 1) * (q - 1))
    E = 3  # O MDC entre E e M precisaria ser um, então o escolhido foi o 3.
    crip.append((CRIP[c] ** E) % n)
    while 3 * D % M != 1:  # O resultado apresentado nessa operação tem que ser o resto da divisão 1-com isso             #conseguimos obter a chave privada, a mesma vai ser útilizada-
        D += 1  # para descriptografar
    DECRIP.append(int(crip[c] ** D) % n)  # Calculo feito para Descriptografar a mensagem, transformamos
    # em a mensagem convertida para a tabela ASCII recebe int e é
    # elevada a D que seria a chave para descriptografar, logo tambem
    # será elevada a N
print('\033[31mCodificando mensagem... \033[m ')
sleep(2)  # perfumaria para esperar 2 segundos
for Q in crip:  # retiro a mensagem que foi criptografada e o valor apresentado dentro de um vetor
    # passa a ser outra variável fora do vetor, a mesma será apresentada para o usuário
    print(Q, end=' ')  # mensagem fora do vetor
for c1 in range(0, TAMANHO, 1):  # contar novamente para realizar a descriptografia.
    decript.append(chr(DECRIP[c1]))  # utilizado para transformar o número representado na tabela ASCII
    # em um novo vetor com seu determinado caractere ja convertido.
# Chave para decifrar = 4240
while N1 != M:  # Enquanto N1  que vai ser digitado pelo usuário for diferente de 4240, entrara em um laço
    # para verificar autenticidade do caractere digitado.
    N1 = int(input('\n\033[1;33mDigite a senha para decodificar: \033[m '))
    cont += 1
    if cont == 3:  # Após 3 tentativas, não vai poder continuar e será bloqueado.

        print('Você atingiu o máximo de tentativas!')
        break
if N1 == M:  # Com a chave privada inserida corretamente
    decrip()  # Vai ser apresentado a função
    sleep(2)  # perfumaria para esperar 2 segundos
    for Q in decript:  # converter vetor em uma nova variável com os seus resultados anteriores.
        print(Q, end='')  # palavra descriptografada
