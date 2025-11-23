public class Perro : Animal, AnimalActions{
    public int Edad { get; set; }
    //Constructor con parametros
    public Perro(string nombre, int edad) : base(nombre){
        Edad = edad;
    }
    public void Sonido(){
        Console.WriteLine("¡Guau!");
    }
    public override void Informacion(){
        Console.WriteLine($"Nombre del perro: {Nombre}");
        Console.WriteLine($"Edad: {Edad}");
    }
}