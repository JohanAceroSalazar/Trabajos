const Libro = require("./Libro");

// Constructor con parámetros
class Novela extends Libro {
    constructor(titulo, autor, paginas, genero) {
        super(titulo, autor); // llama al constructor de la "clase abstracta"
        this.paginas = paginas;
        this.genero = genero;
    }

    abrir() {
        console.log("Abriendo la novela...");
    }

    informacion() {
        console.log(`Título: ${this.titulo}`);
        console.log(`Autor: ${this.autor}`);
        console.log(`Páginas: ${this.paginas}`);
        console.log(`Género: ${this.genero}`);
    }
}

const novela = new Novela("Cien años de soledad","Gabriel García Márquez",417,"Realismo mágico");
novela.abrir();
novela.informacion();

module.exports = Novela;