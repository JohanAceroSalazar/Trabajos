public class Computador {
    String marca;
    int ram;
    Computador(String m, int r) { marca = m; ram = r; }
    void encender() { System.out.println("Computador " + marca + " encendido."); }
}
