public class Reloj {
    private String tipo;
    private String hora;

    Reloj(String tipo, String hora) {
        this.tipo = tipo;
        this.hora = hora;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public void mostrarHora() {
        System.out.println("Reloj (" + tipo + ") marca: " + hora);
    }
}
