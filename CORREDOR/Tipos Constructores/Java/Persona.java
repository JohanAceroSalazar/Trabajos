package Java;

// Constructor COPIA que recibe otra Persona
abstract class Persona {
    String nombre;
    String documento;
    
    // Constructor normal
    public Persona(String nombre, String documento) {
        this.nombre = nombre;
        this.documento = documento;
    }

    // Constructor copia
    public Persona(Persona otra) {
        this.nombre = otra.nombre;
        this.documento = otra.documento;
    }

    abstract void mostrarInformacion();
}