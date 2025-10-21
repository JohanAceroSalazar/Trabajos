public class Estuche {
    String color;
    int capacidad;
    Estuche(String c, int cap) { color = c; capacidad = cap; }
    void abrir() { System.out.println("Abriendo estuche " + color); }
}
