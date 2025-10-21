public class Televisor {
    String marca;
    int pulgadas;
    Televisor(String m, int p) { marca = m; pulgadas = p; }
    void encender() { System.out.println("Televisor " + marca + " encendido."); }
}