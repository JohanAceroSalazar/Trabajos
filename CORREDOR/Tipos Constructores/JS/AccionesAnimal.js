// Se usa una clase con un método que debe ser implementado por las clases hijas
class AccionesAnimal{
    sonido(){
        throw new Error("El método 'sonido()' debe ser implementado por la clase que lo use.");
    }
}
module.exports = AccionesAnimal;