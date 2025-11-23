const Dispositivo = require("./Dispositivo");

class Electronico {
    constructor() {
        // Constructor sin parámetros
        this.marca = "Genérica";
        this.año = 2024;
    }

    informacion() {
        throw new Error("El método informacion() debe ser implementado por la subclase.");
    }
}
module.exports = Electronico;