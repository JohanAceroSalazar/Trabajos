public class Aprendiz {
    private String nombre;
    private int edad;
    private String grupo;

    Aprendiz(String nombre, int edad, String grupo){
        this.nombre = nombre;
        this.edad = edad;
        this.grupo = grupo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    public void estudiar(){
        System.out.println(nombre + " está estudiando en el grupo " + grupo + ".");
    }
}