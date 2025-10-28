public class Proyector {
    private String marca;
    private boolean conectado;

    public Proyector(String marca, boolean conectado) {
        this.marca = marca;
        this.conectado = conectado;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public boolean isConectado() {
        return conectado;
    }

    public void setConectado(boolean conectado) {
        this.conectado = conectado;
    }

    public void proyectar() {
        System.out.println("Proyector " + marca + (conectado ? " proyectando imagen." : " sin conexión."));
    }
}