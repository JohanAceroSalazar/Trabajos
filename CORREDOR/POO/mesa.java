public class Mesa {
    private String material;
    private boolean limpia;

    public Mesa(String material, boolean limpia) {
        this.material = material;
        this.limpia = limpia;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public boolean isLimpia() {
        return limpia;
    }

    public void setLimpia(boolean limpia) {
        this.limpia = limpia;
    }

    public void usar() {
        System.out.println("Mesa de " + material + (limpia ? " está limpia y en uso." : " necesita limpieza."));
    }
}