package Java;

public class Parametros_Retorno {
    // Método con retorno
        int multiplicar(int x, int y) {
        return x * y; // devuelve el resultado
    }
        int Division(int x, int y){
        return x / y;
    }
        int suma(int x, int y){
        return x + y;
    }
        int resta(int x, int y){
            return x - y;
        }

    public static void main(String[] args) {
        Parametros_Retorno calc = new Parametros_Retorno();

        int resultado = calc.multiplicar(4, 2);
        System.out.println("La multiplicación es: " + resultado); 

        int resultado2 = calc.Division(40, 10);
        System.out.println("la division es: " + resultado2);

        int resultado3 = calc.suma(8, 15);
        System.out.println("La suma es: " + resultado3);

        int resultado4 = calc.resta(15, 20);
        System.out.println("La resta es: " + resultado4);
    }
}