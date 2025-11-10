package Java;

public class Parametros_SinRetorno {
    public static void main(String[] args) {

        Operaciones op = new Operaciones();

        op.sumar(8, 5);
        op.restar(15, 6);
        op.multiplicar(4, 3);
        op.mostrarNombre("Johan", "Acero");
    }
}

    class Operaciones {
    void sumar(int a, int b) {
        int resultado = a + b;
        System.out.println("La suma es: " + resultado);
    }

    void restar(int a, int b) {
        int resultado = a - b;
        System.out.println("La resta es: " + resultado);
    }

    void multiplicar(int a, int b) {
        int resultado = a * b;
        System.out.println("La multiplicación es: " + resultado);
    }

    void mostrarNombre(String nombre, String apellido) {
        System.out.println("Nombre completo: " + nombre + " " + apellido);
    }
}