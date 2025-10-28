public class Computador {
    private String marca;
    private int ramGb;

    public Computador(String marca, int ramGb) {
        this.marca = marca;
        this.ramGb = ramGb;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public int getRamGb() {
        return ramGb;
    }

    public void setRamGb(int ramGb) {
        this.ramGb = ramGb;
    }

    public void encender() {
        System.out.println("Computador " + marca + " con " + ramGb + "GB de RAM encendido.");
    }
}