package Java;

abstract class Libro {
    String titulo;
    String autor;

    // Constructor con parámetros
    public Libro(String titulo, String autor) {
        this.titulo = titulo;
        this.autor = autor;
    }

    abstract void informacion();
}