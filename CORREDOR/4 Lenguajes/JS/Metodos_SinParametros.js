class Coche {
    arrancar() {
        console.log("El coche ha arrancado.");
    }

    detener() {
        console.log("El coche se ha detenido.");
    }
}

class Persona {
    saludar() {
        console.log("Hola, mucho gusto!");
    }

    dormir() {
        console.log("La persona está durmiendo...");
    }
}

class Perro {
    ladrar() {
        console.log("El perro está ladrando ¡Guau guau!");
    }

    comer() {
        console.log("El perro está comiendo su comida.");
    }
}

const mp = new Coche();
mp.arrancar();
mp.detener();

const p = new Persona();
p.saludar();
p.dormir();

const pe = new Perro();
pe.comer();
pe.ladrar();