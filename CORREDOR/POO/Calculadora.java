public class Calculadora {
    String marca;
    boolean encendida;
    Calculadora(String m, boolean e) { marca = m; encendida = e; }
    void sumar(int a, int b) { System.out.println("Resultado: " + (a + b)); }
}