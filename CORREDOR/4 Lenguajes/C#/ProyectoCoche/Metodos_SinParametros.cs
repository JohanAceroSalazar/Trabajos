using System;

namespace Java
{
    class Metodos_SinParametros
    {
        public void Arrancar()
        {
            Console.WriteLine("El coche ha arrancado.");
        }

        public void Detener()
        {
            Console.WriteLine("El coche se ha detenido.");
        }

        static void Main(string[] args)
        {
            Metodos_SinParametros mp = new Metodos_SinParametros();
            mp.Arrancar();
            mp.Detener();

            Persona p = new Persona();
            p.Saludar();
            p.Dormir();

            Perro pe = new Perro();
            pe.Comer();
            pe.Ladrar();
        }
    }

    class Persona
    {
        public void Saludar()
        {
            Console.WriteLine("Hola, mucho gusto!");
        }

        public void Dormir()
        {
            Console.WriteLine("La persona está durmiendo...");
        }
    }

    class Perro
    {
        public void Ladrar()
        {
            Console.WriteLine("El perro está ladrando ¡Guau guau!");
        }

        public void Comer()
        {
            Console.WriteLine("El perro está comiendo su comida.");
        }
    }
}