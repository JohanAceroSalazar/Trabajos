public class pizarra {
    String tipo;
    boolean limpia;
    pizarra(String t, boolean l) { tipo = t; limpia = l; }
    void escribir(String texto) { System.out.println("Escribiendo en la pizarra: " + texto); }
}
