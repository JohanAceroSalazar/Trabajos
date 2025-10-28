public class Puerta {
    private String material;
    private boolean abierta;

    public Puerta(String material, boolean abierta) {
        this.material = material;
        this.abierta = abierta;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public boolean isAbierta() {
        return abierta;
    }

    public void setAbierta(boolean abierta) {
        this.abierta = abierta;
    }

    public void cerrar() {
        abierta = false;
        System.out.println("Puerta de " + material + " cerrada.");
    }
}