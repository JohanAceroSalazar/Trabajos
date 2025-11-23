package Java;

public class Main {
    public static void main(String[] args) {

        //Constructor sin parametros
        System.out.println("Ejemplo 1: Constructor sin parametros:");
        Carro car = new Carro();
        car.informacion();
        car.mover();
        System.out.println("                        ");

        //Constructor con parametros
        System.out.println("Ejemplo 2: Constructor con parametros:");
        Perro p = new Perro("Max", 5, "Lobo siberiano", 15);
        p.informacion();
        p.sonido();
        System.out.println("                        ");

        //Constructor sobrecargado
        System.out.println("Ejemplo 3: Constructor Sobrecargado:");
        TelefonoInteligente ti = new TelefonoInteligente("Samsung Galaxy S25 Ultra", 512);
        ti.informacion();
        ti.encender();
        System.out.println("                        ");

        //Constructor de Copia
        System.out.println("Ejemplo 4: Constructor de Copia:");
        Estudiante estudiante1 = new Estudiante("Carlos Pérez",
                "1023456789",
                20,
                "Programación");
        System.out.println("Estudiante 1 (original)");
        estudiante1.saludar();
        estudiante1.mostrarInformacion();
        System.out.println("                        ");

        Estudiante estudiante2 = new Estudiante(estudiante1);
        System.out.println("Estudiante 2 (copia)");
        estudiante2.saludar();
        estudiante2.mostrarInformacion();
        System.out.println("                        ");

        //Constructor con parametros
        System.out.println("Ejemplo 5: Constructor con Parametros:");
        Novela n = new Novela("Caperucita", "Charles Perrault", 32, "Infantil");
        n.informacion();
        n.abrir();
    }
}