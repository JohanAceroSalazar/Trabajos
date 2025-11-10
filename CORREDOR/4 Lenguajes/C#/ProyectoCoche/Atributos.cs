using System;

    class Persona{
        public string nombre;
        private int edad;

        public Persona(string nombre, int edad){
            this.nombre = nombre;
            this.edad = edad;
        }

        public void Caminar(){
            Console.WriteLine($"{nombre} está caminando en el parque y tiene {edad} años");
        }

        static void Main(string[] args){
            Persona p1 = new Persona("Johan", 18);
            p1.Caminar();

            Coche c1 = new Coche("Audi", "rojo", 300);
            c1.Acelerar();

            Libro l1 = new Libro("Don Quijote", "Gabriel Garcia", 280);
            l1.MostrarInfo();

            Celular c2 = new Celular("Samsung", "15", 1500000);
            c2.MostrarDatos();
        }
    }

    class Coche{
        public string marca;
        private string color;
        public int velocidad;
        public Coche(string marca, string color, int velocidad)
        {
            this.marca = marca;
            this.color = color;
            this.velocidad = velocidad;
        }

        public void Acelerar(){
            Console.WriteLine($"El {marca} de color {color} va a {velocidad} km/h");
        }
    }
    class Libro{
        public string titulo;
        private string autor;
        public int paginas;

        public Libro(string titulo, string autor, int paginas){
            this.titulo = titulo;
            this.autor = autor;
            this.paginas = paginas;
        }

        public void MostrarInfo(){
            Console.WriteLine($"El libro '{titulo}' fue escrito por {autor} y tiene {paginas} páginas.");
        }
    }
    class Celular{
        public string marca;
        private string modelo;
        public double precio;

        public Celular(string marca, string modelo, double precio){
            this.marca = marca;
            this.modelo = modelo;
            this.precio = precio;
        }
        public void MostrarDatos(){
            Console.WriteLine($"Celular {marca} modelo {modelo} cuesta ${precio}");
        }
    }