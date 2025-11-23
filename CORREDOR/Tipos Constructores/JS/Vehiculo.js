// Se usa una interfaz con un método que debe ser implementado por las clases hijas
class Vehiculo{
    mover(){
        throw new Error("El método 'mover()' debe ser implementado por la clase que lo use");
    }
}
module.exports = Vehiculo;