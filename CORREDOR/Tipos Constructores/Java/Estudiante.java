package Java;

public class Estudiante extends Persona implements AccionesPersona{
    int edad;
    String curso;

    // Constructor con parámetros
    public Estudiante(String nombre, String documento, int edad, String curso) {
        super(nombre, documento);
        this.edad = edad;
        this.curso = curso;
    }

    // Constructor copia (recibe otro Estudiante)
    public Estudiante(Estudiante otro) {
        super(otro); // Llama al constructor copia de Persona
        this.edad = otro.edad;
        this.curso = otro.curso;
    }

    @Override
    public void saludar(){
        System.out.println("Hola soy " + nombre);
    }

    @Override
    void mostrarInformacion(){
        System.out.println("Nombre: " + nombre);
        System.out.println("Documento: " + documento);
        System.out.println("Edad: " + edad);
        System.out.println("Curso: " + curso);
    }
}