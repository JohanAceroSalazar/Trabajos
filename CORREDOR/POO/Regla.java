public class Regla {
    private int longitudCm;
    private String material;

    public Regla(int longitudCm, String material) {
        this.longitudCm = longitudCm;
        this.material = material;
    }

    public int getLongitudCm() { 
        return longitudCm; 
    }

    public void setLongitudCm(int longitudCm) { 
        this.longitudCm = longitudCm; 
    }

    public String getMaterial() { 
        return material; 
    }

    public void setMaterial(String material) { 
        this.material = material; 
    }

    public void medir() {
        System.out.println("Midiendo con regla de " + longitudCm + " cm, material " + material + ".");
    }
}