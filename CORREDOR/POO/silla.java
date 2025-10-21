public class silla {
    String material;
    boolean disponible;
    silla(String m, boolean d) { material = m; disponible = d; }
    void sentarse() { System.out.println("Te sientas en una silla de " + material); }
}
