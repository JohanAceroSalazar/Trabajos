public class Puerta {
    String material;
    boolean abierta;
    Puerta(String m, boolean a) { material = m; abierta = a; }
    void cerrar() { System.out.println("Puerta cerrada."); }
}