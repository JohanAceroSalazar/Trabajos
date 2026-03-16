function agregar(){

    var tarea = document.getElementById("tarea").value;
    var elemento = document.createElement("li");

    elemento.textContent = tarea;

    var lista = document.getElementById("lista");
    lista.appendChild(elemento);
}