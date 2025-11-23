using System;

class Program{
    static void Main(string[] args){

        Console.WriteLine("Ejemplo 1: Constructor sin Parametros ");
        Carro carro = new Carro();
        carro.Mover();
        carro.Informacion();

        Console.WriteLine("Ejemplo 2: constructor con Parametros");
        Perro perro = new Perro("Firulais", 5);
        perro.Sonido();
        perro.Informacion();

        Console.WriteLine("Ejemplo 3: constructores Sobrecargados");
        // Usando constructor sin parámetros
        Telefono tel1 = new Telefono();
        tel1.Encender();
        tel1.Informacion();

        // Usando constructor con parámetros
        Telefono tel2 = new Telefono("Samsung", "Galaxy S23");
        tel2.Encender();
        tel2.Informacion();

        Console.WriteLine("Ejemplo 4: constructor con Parametros");
        Novela n = new Novela("Cien años de soledad", "Gabriel García Márquez", 38, "Literario");
        n.Abrir();
        n.Informacion();

        Console.WriteLine("Ejemplo 5: constructor de Copia");
        // 1. Crear estudiante usando el constructor con parámetros
        Estudiante e1 = new Estudiante("Johan Acero", "123456", 20, "Programación");
        Console.WriteLine("Estudiante Original");
        e1.Saludar();
        e1.MostrarInformacion();

        // 2. Crear estudiante usando el constructor COPIA
        Estudiante e2 = new Estudiante(e1);
        Console.WriteLine("Estudiante Copiado");
        e2.Saludar();
        e2.MostrarInformacion();
    }
}