package Java;

    class Atributos{
        public String nombre;
        private int edad;


        public Atributos(String nombre, int edad) {
            this.nombre = nombre;
            this.edad = edad;
        }

        public void caminar(){
            System.out.println( nombre + " esta caminando en el parque y tiene " + edad + " años");
        }
        public static void main(String[] args) {

        Atributos p1 = new Atributos("Johan", 18);
        p1.caminar();

        Coche c1 = new Coche("Audi", "rojo", 300);
        c1.acelerar();

        Libro l1 = new Libro("Don quijote", "Gabriel Garcia", 280);
        l1.mostrarInfo();

        Celular c2 = new Celular("Samsung", "15", 1500000);
        c2.mostrarDatos();
        }
    }

    class Coche{
        public String marca;
        private String color;
        public int velocidad;

        public Coche(String marca, String color, int velocidad) {
            this.marca = marca;
            this.color = color;
            this.velocidad = velocidad;
        }

        public void acelerar(){
            System.out.println("El " + marca + " de color " + color + " va a " + velocidad + "km/h");
        }
    }

    class Libro {
    public String titulo;
    private String autor;
    public int paginas;

    public Libro(String titulo, String autor, int paginas) {
        this.titulo = titulo;
        this.autor = autor;
        this.paginas = paginas;
    }

    public void mostrarInfo() {
        System.out.println("El libro '" + titulo + "' fue escrito por " + autor + " y tiene " + paginas + " páginas.");
    }
}

    class Celular {
    public String marca;
    private String modelo;
    public double precio;

    public Celular(String marca, String modelo, double precio) {
        this.marca = marca;
        this.modelo = modelo;
        this.precio = precio;
    }

    public void mostrarDatos() {
        System.out.println("Celular " + marca + " modelo " + modelo + " cuesta $" + precio);
    }
}