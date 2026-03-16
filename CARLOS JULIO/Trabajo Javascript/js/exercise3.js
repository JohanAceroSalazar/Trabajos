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

    let li = document.createElement("li");
    li.textContent = nombre +
    " | Edad: " + edad + 
    " | Fecha de nacimiento: " + fechaNacimiento + 
    " | Nota: " + nota + 
    " | Estado: " + estado;

    document.getElementById("listaEstudiantes").appendChild(li);

    mensaje.textContent =
    "Estudiante registrado: " + nombre + 
    " | Estado del curso: " + estado;
}