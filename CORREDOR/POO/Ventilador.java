public class Ventilador {
    String marca;
    int velocidad;
    Ventilador(String m, int v) { marca = m; velocidad = v; }
    void encender() { System.out.println("Ventilador " + marca + " encendido."); }
}
