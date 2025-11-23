public class Carro : Transporte, Vehiculo{
    public string Marca { get; set; }
    public int Modelo { get; set; }
    //Constructor Sin Parametros
    public Carro(){
        Tipo = "Carro";
        Marca = "Toyota";
        Modelo = 2020;
    }

    public void Mover(){
        Console.WriteLine("El carro está en movimiento.");
    }

    public override void Informacion(){
        Console.WriteLine($"Tipo de transporte: {Tipo}");
        Console.WriteLine($"Marca: {Marca}");
        Console.WriteLine($"Modelo: {Modelo}");
    }
}
