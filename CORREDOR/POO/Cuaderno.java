public class Cuaderno {
    int hojas;
    String color;
    Cuaderno(int h, String c) { hojas = h; color = c; }
    void escribir() { System.out.println("Escribiendo en cuaderno " + color); }
}
