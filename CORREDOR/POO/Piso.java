public class Piso {
    private String material;
    private String color;

    public Piso(String material, String color) {
        this.material = material;
        this.color = color;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public void limpiar() {
        System.out.println("Limpiando piso de " + material + " color " + color + ".");
    }
}