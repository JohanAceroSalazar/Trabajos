const Persona = require("./Persona");

class Estudiante extends Persona {
    constructor(nombre, edad, curso, promedio) {
        super(nombre, edad); 
        this.curso = curso;
        this.promedio = promedio;
    }

    // Constructor COPIA
    static copiar(otroEstudiante) {
        return new Estudiante(
            otroEstudiante.nombre,
            otroEstudiante.edad,
            otroEstudiante.curso,
            otroEstudiante.promedio
        );
    }

    saludar() {
        console.log(`Hola, soy ${this.nombre}`);
    }

    mostrarInfo() {
        console.log(`Nombre: ${this.nombre}`);
        console.log(`Edad: ${this.edad} años`);
        console.log(`Curso: ${this.curso}`);
        console.log(`Promedio: ${this.promedio}`);
    }
}
// Objeto original
const e1 = new Estudiante("Johan", 20, "Programación", 4.5);

// Crear copia usando el constructor copia
const e2 = Estudiante.copiar(e1);

e1.saludar();
e1.mostrarInfo();

console.log("COPIA");

e2.saludar();
e2.mostrarInfo();

module.exports = Estudiante;