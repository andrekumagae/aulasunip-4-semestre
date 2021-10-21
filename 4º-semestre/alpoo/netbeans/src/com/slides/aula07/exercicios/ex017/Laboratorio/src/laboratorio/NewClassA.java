package laboratorio;

public class NewClassA {

    public double calcular(int x, int y) {
        return x + y;
    }

    public double calcular(double x, double y) {
        return x * y;
    }

    public class NewClassB extends NewClassA {

    }

    public static void main(String[] args) {
//        NClasseB c = new ClasseA();
//        ClasseA b = new NClasseB();
//        NClasseb objb = new NewClassB();
        NewClassA newClassA = new NewClassA();
        NewClassB newClassB = new NewClassB();
    }

}

//class ClasseB extends ClasseA{
//    public static void main(String[] args) {
//        ClasseB c  = new ClasseB();
//        b.calcular(1,2);
//    }
//}
