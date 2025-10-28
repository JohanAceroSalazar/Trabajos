public class Pizarra {
    private String tipo;
    private boolean limpia;

    public Pizarra(String tipo, boolean limpia) {
        this.tipo = tipo;
        this.limpia = limpia;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public boolean isLimpia() {
        return limpia;
    }

    public void setLimpia(boolean limpia) {
        this.limpia = limpia;
    }

    public void escribir(String texto) {
        System.out.println("En la pizarra (" + tipo + "): " + texto);
    }
}