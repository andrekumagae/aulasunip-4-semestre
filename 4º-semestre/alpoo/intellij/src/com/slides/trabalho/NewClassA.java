package com.slides.trabalho;

public class NewClassA {
    public double calcular(int x, int y) {
        return x + y;
    }

    public double calcular(double x, double y) {
        return x * y;
    }

    // Necessário deixar esta classe estática para funcionar
    public static class NewClassB extends NewClassA {

    }

    // Necessário deixar esta classe estática para funcionar
    public static class Start {
        public static void main(String[] args) {
            NewClassA newClassA = new NewClassA();
            NewClassB newClassB = new NewClassB();
//            NewClassB c = (NewClassB) new NewClassA();
            NewClassA b = new NewClassB();
            double res = newClassB.calcular(2, 3);
            double res2 = newClassB.calcular(2, 3);
            System.out.println("metodo 1: " + res + "\nmetodo 2: " + res2);
        }
    }
}
