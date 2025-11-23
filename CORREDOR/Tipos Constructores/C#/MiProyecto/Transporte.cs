public abstract class Transporte{
    public string Tipo { get; set; }
    public Transporte(){
        Tipo = "Desconocido";
    }
    public abstract void Informacion();
}