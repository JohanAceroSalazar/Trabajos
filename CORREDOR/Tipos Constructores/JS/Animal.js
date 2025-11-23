const AccionesAnimal = require("./AccionesAnimal");

// Constructor CON parámetros 
class Animal {
    constructor(nombre, edad) {
        this.nombre = nombre;
        this.edad = edad;
    }

    informacion(){
        throw new Error("El método 'informacion()' debe ser implementado por la clase hija.");
    }
}
module.exports = Animal;