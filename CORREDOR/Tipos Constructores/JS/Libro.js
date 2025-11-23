const AccionesLibro = require("./AccionesLibro");

// Simulación de clase abstracta con el constructor con parametros
class Libro {
    constructor(titulo, autor) {
        this.titulo = titulo;
        this.autor = autor;
    }

    informacion() {
        throw new Error("El método 'informacion()' debe ser implementado por la clase hija.");
    }
}
module.exports = Libro;