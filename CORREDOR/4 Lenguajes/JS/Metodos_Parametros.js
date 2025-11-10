class Sumar {
    sumar(a, b) {
        const resultado = a + b;
        console.log("La suma es: " + resultado);
    }
}

class Resta {
    restar(a, b) {
        const resultado = a - b;
        console.log("La resta es: " + resultado);
    }
}

class areaTriangulo {
    area(base, altura) {
        const resultado = (base * altura) / 2;
        console.log("El área del triángulo: " + resultado);
    }
}

class Promedio {
    inicial(a, b, c) {
        const resultado = a + b + c;
        const promedio = resultado / 3;
        console.log("El promedio es: " + promedio);
    }
}

const cal = new Sumar();
cal.sumar(8, 7);

const r1 = new Resta();
r1.restar(18, 5);

const area = new areaTriangulo();
area.area(8, 6);

const pro = new Promedio();
pro.inicial(9, 18, 12);