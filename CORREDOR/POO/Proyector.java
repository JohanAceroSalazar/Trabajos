public class Proyector {
    String marca;
    boolean conectado;
    Proyector(String m, boolean c) { marca = m; conectado = c; }
    void proyectar() { System.out.println("Proyector " + marca + " mostrando imagen."); }
}
