let biblioteca = [];

function registrarLibro(){

    let titulo = document.getElementById("tituloLibro").value;
    let autor = document.getElementById("autorLibro").value;
    let mensaje = document.getElementById("mensajeBiblioteca");

    let libro = {
        titulo: titulo,
        autor: autor,
        estado: "Disponible"
    };

    biblioteca.push(libro);

    mensaje.textContent = "Libro registrado: " + titulo;
}

function prestarLibro(){

    let titulo = document.getElementById("libroOperacion").value;
    let mensaje = document.getElementById("mensajeBiblioteca");

    for(let libro of biblioteca){

        if(libro.titulo === titulo){

            if(libro.estado === "Prestado"){
                mensaje.textContent = "El libro ya está prestado";
            }else{
                libro.estado = "Prestado";
                mensaje.textContent = "Libro prestado: " + titulo;
            }

            return;
        }
    }

    mensaje.textContent = "Libro no encontrado";
}

function devolverLibro(){

    let titulo = document.getElementById("libroOperacion").value;
    let mensaje = document.getElementById("mensajeBiblioteca");

    for(let libro of biblioteca){

        if(libro.titulo === titulo){

            libro.estado = "Disponible";

            mensaje.textContent = "Libro devuelto: " + titulo;

            return;
        }
    }

    mensaje.textContent = "Libro no encontrado";
}

function mostrarLibros(){

    let lista = document.getElementById("listaLibros");

    lista.innerHTML = "";

    for(let libro of biblioteca){

        let li = document.createElement("li");

        li.textContent =
        "Título: " + libro.titulo +
        " | Autor: " + libro.autor +
        " | Estado: " + libro.estado;

        lista.appendChild(li);
    }
}