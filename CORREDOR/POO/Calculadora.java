public class Calculadora {
    private String marca;
    private boolean encendida;

    public Calculadora(String marca, boolean encendida) {
        this.marca = marca;
        this.encendida = encendida;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public boolean isEncendida() {
        return encendida;
    }

    public void setEncendida(boolean encendida) {
        this.encendida = encendida;
    }

    public void sumar(int a, int b) {
        System.out.println("Calculadora " + marca + " suma: " + a + " + " + b + " = " + (a + b));
    }
}