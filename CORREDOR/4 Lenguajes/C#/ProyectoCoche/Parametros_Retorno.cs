using System;

    class Parametros_Retorno
    {
        // Método con retorno
        int Multiplicar(int x, int y)
        {
            return x * y; // devuelve el resultado
        }

        int Division(int x, int y)
        {
            return x / y;
        }

        int Suma(int x, int y)
        {
            return x + y;
        }

        int Resta(int x, int y)
        {
            return x - y;
        }

        static void Main(string[] args)
        {
            Parametros_Retorno calc = new Parametros_Retorno();

            int resultado = calc.Multiplicar(4, 2);
            Console.WriteLine("La multiplicación es: " + resultado);

            int resultado2 = calc.Division(40, 10);
            Console.WriteLine("La división es: " + resultado2);

            int resultado3 = calc.Suma(8, 15);
            Console.WriteLine("La suma es: " + resultado3);

            int resultado4 = calc.Resta(15, 20);
            Console.WriteLine("La resta es: " + resultado4);
        }
    }