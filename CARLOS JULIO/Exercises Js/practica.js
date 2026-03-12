function mostrarMensaje(){
    var button = document.getElementById("Mensaje").innerHTML="Hola mundo desde JavaScript";
}

function sumar(){
    var numero1= parseFloat(document.getElementById("num1").value);
    var numero2= parseFloat(document.getElementById("num2").value);

    var suma = numero1 + numero2;

    document.getElementById("resultado").innerHTML= "Resultado: " + suma;
}

function colorRojo(){
    document.body.style.background = "red";
}

function colorAzul(){
    document.body.style.background = "blue";
}

function colorVerde(){
    document.body.style.background = "green";
}

let contador = 0;

const botonContador= document.getElementById("contador");
const textoContador = document.getElementById("textoContador");

botonContador.addEventListener("click", function(){
    contador++;
    textoContador.textContent = "Clics: " + contador;
});

function agregar(){

    var tarea = document.getElementById("tarea").value;
    var elemento = document.createElement("li");

    elemento.textContent = tarea;

    var lista = document.getElementById("lista");
    lista.appendChild(elemento);
}

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

function calcular(){
    let num1 = parseFloat(document.getElementById("numero1").value);
    let num2 = parseFloat(document.getElementById("numero2").value);

    let operacion = document.getElementById("operacion").value;
    let resultado;

    if(operacion === "+"){
        resultado = num1 + num2;
        }
        else if(operacion === "-"){
            resultado = num1 - num2;
        }
        else if(operacion === "*"){
            resultado = num1 * num2;
        }
        else if(operacion === "/"){
            resultado = num1 / num2;
        }

        document.getElementById("resultadoCalc").textContent = "Resultado: " + resultado;
}

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

let segundos = 0;
let intervalo;

function iniciar(){
    intervalo = setInterval(function(){
        segundos++;

        document.getElementById("tiempo").textContent = segundos;
    },1000);
}

function detener(){
    clearInterval(intervalo);
}

function reiniciar(){
    clearInterval(intervalo);
    segundos = 0;

    document.getElementById("tiempo").textContent = segundos;

}