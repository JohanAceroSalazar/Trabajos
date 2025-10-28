public class Mochila {
    private String color;
    private double pesoKg;

    public Mochila(String color, double pesoKg) {
        this.color = color;
        this.pesoKg = pesoKg;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public double getPesoKg() {
        return pesoKg;
    }

    public void setPesoKg(double pesoKg) {
        this.pesoKg = pesoKg;
    }

    public void abrir() {
        System.out.println("Mochila " + color + " abierta. Peso: " + pesoKg + "kg.");
    }
}