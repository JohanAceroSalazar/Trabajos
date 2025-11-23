class Estudiante : Persona, AccionesPersona{
    public int Edad;
    public string Curso;

    // Constructor con parámetros Copia
    public Estudiante(string nombre, string documento, int edad, string curso)
        : base(nombre, documento)
    {
        Edad = edad;
        Curso = curso;
    }
    // Constructor copia
    public Estudiante(Estudiante otro)
        : base(otro)   // llama al constructor copia de Persona
    {
        Edad = otro.Edad;
        Curso = otro.Curso;
    }
    public void Saludar(){
        Console.WriteLine("Hola, soy " + Nombre + ".");
    }
    public override void MostrarInformacion(){
        Console.WriteLine("Nombre: " + Nombre);
        Console.WriteLine("Documento: " + Documento);
        Console.WriteLine("Edad: " + Edad);
        Console.WriteLine("Curso: " + Curso);
    }
}