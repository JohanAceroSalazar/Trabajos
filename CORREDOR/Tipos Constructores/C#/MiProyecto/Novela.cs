public class Novela : Libro, AccionesLibro{
    public int Paginas { get; set; }
    public string Genero { get; set; }

    // Constructor con parámetros
    public Novela(string titulo, string autor, int paginas, string genero)
        : base(titulo, autor) // llama al constructor de Libro
    {
        Paginas = paginas;
        Genero = genero;
    }
    public void Abrir(){
        Console.WriteLine("Abriendo la novela...");
    }
    public override void Informacion(){
        Console.WriteLine($"Título: {Titulo}");
        Console.WriteLine($"Autor: {Autor}");
        Console.WriteLine($"Páginas: {Paginas}");
        Console.WriteLine($"Género: {Genero}");
    }
}