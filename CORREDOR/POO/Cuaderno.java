public class Cuaderno {
    private int hojas;
    private String color;

    public Cuaderno(int hojas, String color) {
        this.hojas = hojas;
        this.color = color;
    }

    public int getHojas() {
        return hojas;
    }

    public void setHojas(int hojas) {
        this.hojas = hojas;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public void escribir() {
        System.out.println("Escribiendo en el cuaderno " + color + " de " + hojas + " hojas.");
    }
}