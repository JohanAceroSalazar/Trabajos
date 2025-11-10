using System;

    class Metodos_Parametros
    {
        void Sumar(int a, int b)
        {
            int resultado = a + b;
            Console.WriteLine("La suma es: " + resultado);
        }

        static void Main(string[] args)
        {
            Metodos_Parametros cal = new Metodos_Parametros();
            cal.Sumar(8, 7);

            Resta r1 = new Resta();
            r1.Restar(18, 5);

            AreaTriangulo area = new AreaTriangulo();
            area.Area(8, 6);

            Promedio pro = new Promedio();
            pro.Inicial(9, 18, 12);
        }
    }

    class Resta
    {
        public void Restar(int a, int b)
        {
            int resultado = a - b;
            Console.WriteLine("La resta es: " + resultado);
        }
    }

    class AreaTriangulo
    {
        public void Area(int baseT, int altura)
        {
            int resultado = baseT * altura / 2;
            Console.WriteLine("El área del triángulo es: " + resultado);
        }
    }

    class Promedio
    {
        public void Inicial(int a, int b, int c)
        {
            int resultado = a + b + c;
            int promedio = resultado / 3;
            Console.WriteLine("El promedio es: " + promedio);
        }
}