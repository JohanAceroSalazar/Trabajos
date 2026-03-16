function mostrarSeccion(id){

    let secciones = document.querySelectorAll(".seccion");

    for(let seccion of secciones){
        seccion.style.display = "none";
    }

    document.getElementById(id).style.display = "block";
}

mostrarSeccion("ej1");