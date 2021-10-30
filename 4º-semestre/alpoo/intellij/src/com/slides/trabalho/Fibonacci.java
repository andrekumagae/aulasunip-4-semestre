package com.slides.trabalho;

public class Fibonacci {
    public int fibonacci(int num) {
        if (num == 1 || num == 2) return 1;
        else return fibonacci(num - 1) + fibonacci(num - 2);
    }
    public static void main(String[] args) {
        int i;
        Fibonacci f = new Fibonacci();
        for (i = 0; i < 5; i++) f.fibonacci(i + 1);
    }
}
