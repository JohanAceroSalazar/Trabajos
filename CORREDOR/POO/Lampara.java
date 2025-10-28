public class Lampara {
    private String tipo;
    private boolean encendida;

    public Lampara(String tipo, boolean encendida) {
        this.tipo = tipo;
        this.encendida = encendida;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public boolean isEncendida() {
        return encendida;
    }

    public void setEncendida(boolean encendida) {
        this.encendida = encendida;
    }

    public void encender() {
        encendida = true;
        System.out.println("Lámpara " + tipo + " encendida.");
    }
}