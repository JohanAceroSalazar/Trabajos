using System;

    class Parametros_SinRetorno
    {
        static void Main(string[] args)
        {
            Operaciones op = new Operaciones();

            op.Sumar(8, 5);
            op.Restar(15, 6);
            op.Multiplicar(4, 3);
            op.MostrarNombre("Johan", "Acero");
        }
    }

    class Operaciones
    {
        public void Sumar(int a, int b)
        {
            int resultado = a + b;
            Console.WriteLine("La suma es: " + resultado);
        }

        public void Restar(int a, int b)
        {
            int resultado = a - b;
            Console.WriteLine("La resta es: " + resultado);
        }

        public void Multiplicar(int a, int b)
        {
            int resultado = a * b;
            Console.WriteLine("La multiplicación es: " + resultado);
        }

        public void MostrarNombre(string nombre, string apellido)
        {
            Console.WriteLine("Nombre completo: " + nombre + " " + apellido);
        }
    }
