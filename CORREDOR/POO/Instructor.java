public class Instructor {
    private String nombre;
    private String materia;
    private int anosExperiencia;

    public Instructor(String nombre, String materia, int anosExperiencia) {
        this.nombre = nombre;
        this.materia = materia;
        this.anosExperiencia = anosExperiencia;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getMateria() {
        return materia;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }

    public int getAnosExperiencia() {
        return anosExperiencia;
    }

    public void setAnosExperiencia(int anosExperiencia) {
        this.anosExperiencia = anosExperiencia;
    }

    public void enseñar() {
        System.out.println("Instructor " + nombre + " enseña " + materia + ".");
    }
}