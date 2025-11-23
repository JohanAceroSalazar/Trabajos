package Java;

// Novela extiende Libro e implementa AccionesLibro.
public class Novela extends Libro implements AccionesLibro{
    int paginas;
    String genero;

    // Constructor con parámetros
    public Novela(String titulo, String autor, int paginas, String genero) {
        super(titulo, autor); // llama al constructor con parámetros de libro
        this.paginas = paginas;
        this.genero = genero;
    }

    @Override
    public void abrir() {
        System.out.println("Abriendo la novela...");
    }

    @Override
    void informacion() {
        System.out.println("Título: " + titulo);
        System.out.println("Autor: " + autor);
        System.out.println("Páginas: " + paginas);
        System.out.println("Género: " + genero);
    }
}