class Persona {
    constructor(nombre, edad) {
        this.nombre = nombre;
        this.#edad = edad; // atributo privado
    }

    #edad;

    caminar() {
        console.log(`${this.nombre} está caminando en el parque y tiene ${this.#edad} años`);
    }
}

class Coche {
    constructor(marca, color, velocidad) {
        this.marca = marca;
        this.#color = color;
        this.velocidad = velocidad;
    }

    #color;

    acelerar() {
        console.log(`El ${this.marca} de color ${this.#color} va a ${this.velocidad} km/h`);
    }
}

class Libro {
    constructor(titulo, autor, paginas) {
        this.titulo = titulo;
        this.#autor = autor;
        this.paginas = paginas;
    }

    #autor;

    mostrarInfo() {
        console.log(`El libro '${this.titulo}' fue escrito por ${this.#autor} y tiene ${this.paginas} páginas.`);
    }
}

class Celular {
    constructor(marca, modelo, precio) {
        this.marca = marca;
        this.#modelo = modelo;
        this.precio = precio;
    }

    #modelo;

    mostrarDatos() {
        console.log(`Celular ${this.marca} modelo ${this.#modelo} cuesta $${this.precio}`);
    }
}

    const p1 = new Persona("Johan", 18);
    p1.caminar();

    const c1 = new Coche("Audi", "rojo", 300);
    c1.acelerar();

    const l1 = new Libro("Don Quijote", "Gabriel García", 280);
    l1.mostrarInfo();

    const c2 = new Celular("Samsung", "15", 1500000);
    c2.mostrarDatos();