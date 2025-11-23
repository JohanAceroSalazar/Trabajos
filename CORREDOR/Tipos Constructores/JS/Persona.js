const AccionesPersona = require("./AccionesPersona");

//Constructor Copia
class Persona {
    constructor(nombre, edad){
        this.nombre = nombre;
        this.edad = edad;
    }

    static copiar(otraPersona){
        return new this(otraPersona.nombre, otraPersona.edad);
    }

    mostrarInfo(){
        throw new Error("El método 'mostrarInfo()' debe ser implementado por la clase hija.");
    }
}
module.exports = Persona;