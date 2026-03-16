function mostrarSeccion(id){

    let ejercicios = document.querySelectorAll(".ejercicio");

    for(let ejercicio of ejercicios){
        ejercicio.style.display = "none";
    }

    document.getElementById(id).style.display = "block";
}

mostrarSeccion("e1");