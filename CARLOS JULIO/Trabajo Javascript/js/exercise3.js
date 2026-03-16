let estudiantes= [];
function registrarEstudiantes(){

    let nombre = document.getElementById("nombreEstudiante").value;
    let edad = parseInt(document.getElementById("edad").value);
    let fechaNacimiento = document.getElementById("fecha").value;
    let nota = parseFloat(document.getElementById("nota").value);
    let mensaje = document.getElementById("mensajeRegistro");

    let estado;
    
    if(nota >= 3){
        estado = "Aprobó";
    }else{
        estado = "No aprobó";
    }

    let estudiante ={
        nombre:nombre,
        edad:edad,
        fechaNacimiento:fechaNacimiento,
        nota:nota,
        estado:estado
    };

    estudiantes.push(estudiante);

    mensaje.textContent = "Estudiante " + nombre + " registrado";
}

function mostrarEstudiantes(){

    let lista = document.getElementById("listaEstudiantes");

    lista.innerHTML = "";

    for(let estudiante of estudiantes){

        let li = document.createElement("li");

        li.textContent =
        estudiante.nombre +
        " | Edad: " + estudiante.edad +
        " | Fecha de nacimiento: " + estudiante.fechaNacimiento +
        " | Nota: " + estudiante.nota +
        " | Estado: " + estudiante.estado;

        lista.appendChild(li);
    }

}