function agregar2(){

    let texto = document.getElementById("tareas").value;
    let li = document.createElement("li");

    li.textContent = texto + " ";

    let botonEliminar = document.createElement("button");

    botonEliminar.textContent = "Eliminar";
    botonEliminar.addEventListener("click", function(){
        li.remove();
    });

    li.appendChild(botonEliminar);
    document.getElementById("listas").appendChild(li);
}