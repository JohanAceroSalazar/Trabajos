public abstract class Animal{
    public string Nombre { get; set; }
    public Animal(string nombre){
        Nombre = nombre;
    }
    public abstract void Informacion();
}