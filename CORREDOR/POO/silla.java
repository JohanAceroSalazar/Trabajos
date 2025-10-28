public class Silla {
    private String material;
    private boolean disponible;

    public Silla(String material, boolean disponible) {
        this.material = material;
        this.disponible = disponible;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public boolean isDisponible() {
        return disponible;
    }

    public void setDisponible(boolean disponible) {
        this.disponible = disponible;
    }

    public void sentarse() {
        System.out.println("Silla de " + material + (disponible ? " está disponible para sentarse." : " no está disponible."));
    }
}