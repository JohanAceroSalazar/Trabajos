package Java;

public class Metodos_Parametros {
    void sumar(int a, int b){
        int resultado = a + b;
        System.out.println("La suma es: " + resultado);
    }

    public static void main(String[] args) {
        Metodos_Parametros cal = new Metodos_Parametros();
        cal.sumar(8, 7);

        Resta r1 = new Resta();
        r1.restar(18, 5);

        areaTriangulo area = new areaTriangulo();
        area.area(8, 6);

        Promedio pro = new Promedio();
        pro.inicial(9, 18, 12);
    }
}

    class Resta{
    void restar(int a, int b){
        int resultado = a - b;
        System.out.println("La resta es: " + resultado);
    }
}

    class areaTriangulo{
    void area(int base, int altura){
        int resultado = base * altura / 2;
        System.out.println("El area del triangulo: " + resultado);
    }
}

    class Promedio{
    void inicial(int a, int b, int c){
        int resultado = a + b + c;
        int promedio = resultado / 3;
        System.out.println("El promedio es: " + promedio);
    }
}