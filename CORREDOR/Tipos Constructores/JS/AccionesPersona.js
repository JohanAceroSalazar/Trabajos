// Se usa una clase con un método que debe ser implementado por las clases hijas
class AccionesPersona {
    saludar() {
        throw new Error("El método 'saludar()' debe ser implementado por la clase hija.");
    }
}
module.exports = AccionesPersona;