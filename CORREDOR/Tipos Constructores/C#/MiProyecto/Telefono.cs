public class Telefono : Electronico, Dispositivo{
    public string Modelo { get; set; }
    //Constructor Sobrecargado
    public Telefono() : base(){
        Modelo = "Desconocido";
    }
    public Telefono(string marca, string modelo) : base(marca){
        Modelo = modelo;
    }
    public void Encender(){
        Console.WriteLine("Encendiendo teléfono...");
    }
    public override void Informacion(){
        Console.WriteLine($"Marca: {Marca}");
        Console.WriteLine($"Modelo: {Modelo}");
    }
}