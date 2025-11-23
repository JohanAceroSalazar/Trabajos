public abstract class Libro{
    public string Titulo { get; set; }
    public string Autor { get; set; }
    public Libro(string titulo, string autor){
        Titulo = titulo;
        Autor = autor;
    }
    public abstract void Informacion();
}