public class Libro {
    String titulo;
    String autor;
    Libro(String t, String a) { titulo = t; autor = a; }
    void leer() { System.out.println("Leyendo: " + titulo); }
}
