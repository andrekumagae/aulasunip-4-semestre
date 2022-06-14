#!/bin/bash
#ESCOPO GLOBAL
algarismos='^[+-]?[0-9]+$'

#FUNÇÕES
function calcularX(){
x=`echo "scale=1;(-1*$1$2sqrt($3))/(2*$4)"|bc`
}

function mostraX(){
	echo ""
	echo "==========="
	echo " $1 = $2"
	echo "==========="
}

function validaA(){
numero=$2 
while [ true ];do
if [[ ! $numero =~ $algarismos ]];then
	echo "'$1' deve ser um numero inteiro." 
elif  [ $numero -eq 0 ];then
	echo "'$1' não pode ser menor ou igual a zero."
else    
	break
fi
echo -n "Informe um número para $1: "
read numero
done
}

function validaNumeros(){
numero=$2
while [[ ! $numero =~ $algarismos  ]]; do
	echo "'$1' deve ser um numero inteiro."
	echo -n "Digite o valor de $1: "
        read numero
done
}

#CÓDIGO
while [ true ];do
echo ""
echo "==============================="
echo " CÁLCULO DE EQUAÇÃO DO 2º GRAU "
echo "==============================="
echo ""
echo -n "Informe um número para a: "
read a
validaA a $a
a=$numero
echo -n "Informe um número para b: "
read b
validaNumeros b $b
b=$numero
echo -n "Informe um número para c: "
read c
validaNumeros c $c
c=$numero
delta=$(echo "$b^2-4*$a*$c"|bc)
echo ""
echo "====================="
echo "      RESULTADO      "
echo "====================="
echo ""
echo "--------------------"
echo "  a=$a, b=$b, c=$c  "
echo " O valor de Δ é: "$delta
echo "--------------------"
echo ""
if [ $delta -lt 0 ];then
		echo "Δ < 0 não possui raízes reais."
		echo ""
elif [ $delta -eq 0 ];then
		echo "Δ = 0 possui 1 raíz:"
		calcularX $b "+" $delta $a
		mostraX x1 $x
else
	echo "Δ > 0 possui duas raízes:"
	calcularX $b "+" $delta $a
	mostraX x1 $x
	calcularX $b "-" $delta $a
	mostraX x2 $x
fi
echo ""
echo -n "Digite 's'ou 'S' para calcular novamente ou qualquer tecla para encerrar o programa: "
read escolha
if [ "$escolha" = "s" -o "$escolha" = "S" ];then
	echo "$escolha"
	continue
else
	echo ""
	echo "====================="
	echo "   DESENVOLVIDO POR  "
	echo "    ANDRÉ KUMAGAE    "
	echo "====================="
	echo ""
	break
fi
done
