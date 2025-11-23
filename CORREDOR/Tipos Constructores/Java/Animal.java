package Java;

// Esta clase es abstracta porque NO se puede instanciar directamente.
// Solo sirve como plantilla para otras clases hijas (como Perro).
abstract class Animal{
    String nombre;
    int edad;

    // Constructor CON parámetros
    public Animal(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }

    // Método abstracto (debe ser implementado por las clases hijas)
    abstract void informacion();
}