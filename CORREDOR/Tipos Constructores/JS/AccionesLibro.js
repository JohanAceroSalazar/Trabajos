// Se usa una clase con un método que debe ser implementado por las clases hijas
class AccionesLibro {
    abrir() {
        throw new Error("El método 'abrir()' debe ser implementado por la clase hija.");
    }
}
module.exports = AccionesLibro;