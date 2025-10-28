public class Basurero {
    private String tamano;
    private int cantidadBasura;

    public Basurero(String tamano, int cantidadBasura) {
        this.tamano = tamano;
        this.cantidadBasura = cantidadBasura;
    }

    
    public String getTamano() {
        return tamano;
    }

    public void setTamano(String tamano) {
        this.tamano = tamano;
    }

    public int getCantidadBasura() {
        return cantidadBasura;
    }

    public void setCantidadBasura(int cantidadBasura) {
        this.cantidadBasura = cantidadBasura;
    }

    public void vaciar() {
        cantidadBasura = 0;
        System.out.println("Basurero " + tamano + " vaciado.");
    }
}