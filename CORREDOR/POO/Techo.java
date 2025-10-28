public class Techo {
    private String color;
    private boolean enBuenEstado;

    public Techo(String color, boolean enBuenEstado) {
        this.color = color;
        this.enBuenEstado = enBuenEstado;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public boolean isEnBuenEstado() {
        return enBuenEstado;
    }

    public void setEnBuenEstado(boolean enBuenEstado) {
        this.enBuenEstado = enBuenEstado;
    }

    public void revisar() {
        System.out.println("Revisando techo color " + color + ". Estado: " + (enBuenEstado ? "OK" : "REQUIERE REPARACIÓN"));
    }
}