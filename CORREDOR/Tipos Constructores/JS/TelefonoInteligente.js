const Electronico = require("./Electronico");

//Constructor Sobrecargado
class TelefonoInteligente extends Electronico {
    constructor(modelo, almacenamiento) {
        super(); // Llama al constructor sin parámetros de Electronico
        this.modelo = modelo;
        this.almacenamiento = almacenamiento;
    }

    encender() {
        console.log("Encendiendo el teléfono...");
    }

    informacion() {
        console.log("Marca:", this.marca);
        console.log("Año:", this.año);
        console.log("Modelo:", this.modelo);
        console.log("Almacenamiento:", this.almacenamiento + " GB");
    }
}
module.exports = TelefonoInteligente;

const t1 = new TelefonoInteligente("Galaxy A54", 128);
t1.encender();
t1.informacion();