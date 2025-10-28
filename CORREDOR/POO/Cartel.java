public class Cartel {
    private String titulo;
    private String material;

    public Cartel(String titulo, String material) {
        this.titulo = titulo;
        this.material = material;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public void mostrar() {
        System.out.println("Cartel: " + titulo + " material: " + material);
    }
}