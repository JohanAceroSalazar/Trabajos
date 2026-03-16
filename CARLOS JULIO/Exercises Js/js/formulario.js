const formulario = document.getElementById("formulario");

formulario.addEventListener("submit", function(event){
    event.preventDefault();

    let nombre = document.getElementById("nombre").value;
    let correo = document.getElementById("correo").value;
    let edad = document.getElementById("edad").value;

    if(nombre === "" || correo === "" || edad === ""){
        document.getElementById("mensaje").textContent = "Debe completar todos los campos";
    }
    else{
        alert("Registro exitoso")
    }
});