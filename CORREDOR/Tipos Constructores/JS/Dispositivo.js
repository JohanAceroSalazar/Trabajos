// Se usa una clase con un método que debe ser implementado por las clases hijas
class Dispositivo {
    encender() {
        throw new Error("El método encender() debe ser implementado por la clase que herede.");
    }
}
module.exports = Dispositivo;