const Transporte = require("./Transporte");

//Constructor sin parametros
class Carro extends Transporte {
    constructor() {
        super(); // llama al constructor de Transporte
        this.tipo = "Carro";
        this.marca = "Toyota";
        this.modelo = 2020;
    }

    mover() {
        console.log("El carro está en movimiento.");
    }

    informacion() {
        console.log("Tipo de transporte:", this.tipo);
        console.log("Marca:", this.marca);
        console.log("Modelo:", this.modelo);
    }
}
module.exports = Carro;

const c = new Carro();
c.mover();
c.informacion();