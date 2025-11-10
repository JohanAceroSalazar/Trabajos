class TiposDatos {
    static main() {
        // 🔢 1. Tipos numéricos enteros
        let edad = 25;
        let año = 2025;
        let poblacion = 500000;
        let distancia = 9876543210;
        let letra = 'A';

        console.log("Tipos Enteros");
        console.log("Edad: " + edad);
        console.log("Año: " + año);
        console.log("Población: " + poblacion);
        console.log("Distancia: " + distancia);
        console.log("Letra: " + letra);

        let precio = 19.99;
        let peso = 70.45;
        console.log("Tipos Decimales");
        console.log("Precio: " + precio);
        console.log("Peso: " + peso);

        let nombre = "Johan";
        let saludo = "Hola, ¿cómo estás?";
        let curso = "Programación en JavaScript";

        console.log("Tipo Texto");
        console.log(nombre);
        console.log(saludo);
        console.log(curso);

        let esMayorDeEdad = true;
        let tieneLicencia = false;
        let aprobado = true;
        let encendido = false;
        let accesoPermitido = true;

        console.log("Tipo Booleano");
        console.log("Mayor de edad: " + esMayorDeEdad);
        console.log("Tiene licencia: " + tieneLicencia);
        console.log("Aprobado: " + aprobado);
        console.log("Encendido: " + encendido);
        console.log("Acceso permitido: " + accesoPermitido);

        // 💾 5. Tipo binario (representado con números o texto)
        let binario1 = 0b1010;
        let binario2 = 0b1100;
        let binario3 = 0b1111;
        let binario4 = 0b100000;
        let binario5 = "101010";

        console.log("Tipo Binario");
        console.log("Binario 1: " + binario1);
        console.log("Binario 2: " + binario2);
        console.log("Binario 3: " + binario3);
        console.log("Binario 4: " + binario4);
        console.log("Binario 5 (texto): " + binario5);
    }
}

TiposDatos.main();