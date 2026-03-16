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