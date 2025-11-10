class Operaciones {
    sumar(a, b) {
        const resultado = a + b;
        console.log("La suma es: " + resultado);
    }

    restar(a, b) {
        const resultado = a - b;
        console.log("La resta es: " + resultado);
    }

    multiplicar(a, b) {
        const resultado = a * b;
        console.log("La multiplicación es: " + resultado);
    }

    mostrarNombre(nombre, apellido) {
        console.log("Nombre completo: " + nombre + " " + apellido);
    }
}

const op = new Operaciones();

op.sumar(8, 5);
op.restar(15, 6);
op.multiplicar(4, 3);
op.mostrarNombre("Johan", "Acero");