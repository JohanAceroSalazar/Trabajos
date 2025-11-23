const Animal = require("./Animal");

// Constructor CON parámetros 
class Perro extends Animal {
    constructor(nombre, edad, raza, peso) {
        super(nombre, edad); // llama al constructor de la clase abstracta
        this.raza = raza;
        this.peso = peso;
    }

    // Implementación del método de la interfaz simulada
    sonido() {
        console.log("Guau, guau");
    }

    // Implementación del método abstracto
    informacion() {
        console.log(`Nombre: ${this.nombre}`);
        console.log(`Edad: ${this.edad} años`);
        console.log(`Raza: ${this.raza}`);
        console.log(`Peso: ${this.peso} kg`);
    }
}

const perro = new Perro("Firulais", 4, "Labrador", 25);
perro.sonido();     
perro.informacion();

module.exports = Perro;