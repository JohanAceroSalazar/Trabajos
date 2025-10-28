public class Estuche {
    private String color;
    private int capacidad;

    public Estuche(String color, int capacidad) {
        this.color = color;
        this.capacidad = capacidad;
    }

    public String getColor() {
        return color;
    }
    public void setColor(String color) {
        this.color = color;
    }
    public int getCapacidad() {
        return capacidad;
    }
    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }
    public void abrir() {
        System.out.println("Estuche " + color + " abierto. Capacidad: " + capacidad);
    }
}