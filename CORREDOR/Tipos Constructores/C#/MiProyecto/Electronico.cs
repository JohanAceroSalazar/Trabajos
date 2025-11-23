public abstract class Electronico{
    public string Marca { get; set; }
    public Electronico(){
        Marca = "Genérica";
    }
    public Electronico(string marca){
        Marca = marca;
    }
    public abstract void Informacion();
}