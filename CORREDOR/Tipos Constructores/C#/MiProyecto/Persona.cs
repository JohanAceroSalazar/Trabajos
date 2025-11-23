abstract class Persona{
    public string Nombre;
    public string Documento;

    // Constructor con parámetros Copia
    public Persona(string nombre, string documento){
        Nombre = nombre;
        Documento = documento;
    }

    // Constructor copia
    public Persona(Persona otra){
        Nombre = otra.Nombre;
        Documento = otra.Documento;
    }
    public abstract void MostrarInformacion();
}