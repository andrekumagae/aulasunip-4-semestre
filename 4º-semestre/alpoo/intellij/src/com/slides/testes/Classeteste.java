package com.slides.testes;

public class Classeteste {
    double salarioNovo=0;
    double aumento=0.0;
    public double calculaNovoSalario(double sal, double aumento) {
        double salNovo=0;
        salNovo = sal + (sal * aumento/100);
        return salNovo;
    }


    public static void main(String[] args) {
        Classeteste classeteste = new Classeteste();
        double  sal =classeteste.calculaNovoSalario(1300.00,20);
        System.out.println(sal);
    }
}
