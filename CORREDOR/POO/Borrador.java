public class Borrador {
    private String tipo;
    private boolean disponible;

    public Borrador(String tipo, boolean disponible) {
        this.tipo = tipo;
        this.disponible = disponible;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public boolean isDisponible() {
        return disponible;
    }

    public void setDisponible(boolean disponible) {
        this.disponible = disponible;
    }

    public void borrar(){
        System.out.println("Borrador tipo " + tipo + (disponible ? " borrando..." : " no disponible."));
    }
}