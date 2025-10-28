public class Ventilador {
    private String marca;
    private int velocidad;

    public Ventilador(String marca, int velocidad) {
        this.marca = marca;
        this.velocidad = velocidad;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public int getVelocidad() {
        return velocidad;
    }

    public void setVelocidad(int velocidad) {
        this.velocidad = velocidad;
    }

    public void encender() {
        System.out.println("Ventilador " + marca + " encendido a velocidad " + velocidad + ".");
    }
}