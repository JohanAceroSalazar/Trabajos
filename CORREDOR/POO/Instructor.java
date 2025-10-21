public class Instructor {
    String nombre;
    String materia;
    int añosExperiencia;
    Instructor(String n, String m, int a) { nombre = n; materia = m; añosExperiencia = a; }
    void enseñar() { System.out.println(nombre + " enseña " + materia); }
}