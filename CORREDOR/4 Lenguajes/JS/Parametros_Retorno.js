class Parametros_Retorno {
    // Método con retorno
    decirAlgo(nombre){
        return "Hola " + nombre;
    }
    multiplicar(x, y) {
        return x * y; // devuelve el resultado
    }

    Division(x, y) {
        return x / y;
    }

    suma(x, y) {
        return x + y;
    }

    resta(x, y) {
        return x - y;
    }
}

const calc = new Parametros_Retorno();

console.log(calc.decirAlgo ("Johan"));

const resultado = calc.multiplicar(4, 2);
console.log("La multiplicación es: " + resultado);

const resultado2 = calc.Division(40, 10);
console.log("La división es: " + resultado2);

const resultado3 = calc.suma(8, 15);
console.log("La suma es: " + resultado3);

const resultado4 = calc.resta(15, 20);
console.log("La resta es: " + resultado4);