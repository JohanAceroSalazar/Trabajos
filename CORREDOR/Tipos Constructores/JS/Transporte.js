const Vehiculo = require("./Vehiculo");

//Constructor sin parametros
class Transporte{
    constructor(){
        this.tipo = "Desconocido";
    }

    informacion() {
        throw new Error("El método informacion() debe ser implementado por la subclase.");
    }
}
module.exports = Transporte;