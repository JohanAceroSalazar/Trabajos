let vehiculos=[];

function registrarVehiculo(){
    let nombre = document.getElementById("nombreVehiculo").value;
    let mensaje = document.getElementById("mensajeVehiculo");

    let vehiculo = {
        nombre:nombre,
        velocidad: 0
    };

    vehiculos.push(vehiculo);

    mensaje.textContent = "Vehiculo registrado: " + nombre;
}

function aumentarVelocidad(){
    let nombre = document.getElementById("vehiculoOperacion").value;
    let velocidad = parseFloat(document.getElementById("velocidad").value);
    let mensaje = document.getElementById("mensajeVehiculo");

    for(let vehiculo of vehiculos){

        if(vehiculo.nombre === nombre){

            vehiculo.velocidad += velocidad;
            mensaje.textContent = "Nueva velocidad de " + nombre + ": " + vehiculo.velocidad + " km/h";

            return;
        }
    }

    mensaje.textContent = "Vehículo no encontrado";
}

function disminuirVelocidad(){
    let nombre = document.getElementById("vehiculoOperacion").value;
    let velocidad = parseFloat(document.getElementById("velocidad").value);
    let mensaje = document.getElementById("mensajeVehiculo");

    for(let vehiculo of vehiculos){

        if(vehiculo.nombre === nombre){

            vehiculo.velocidad -= velocidad;
            if(vehiculo.velocidad < 0){
                vehiculo.velocidad = 0;
            }

            mensaje.textContent = "Nueva velocidad de " + nombre + ": " + vehiculo.velocidad + " km/h";

            return;
        }
    }
    mensaje.textContent = "Vehiculo no encontrado";
}

function mostrarEstado(){
    let lista = document.getElementById("listaVehiculos");

    lista.innerHTML = "";

    for(let vehiculo of vehiculos){

        let li = document.createElement("li");

        li.textContent = vehiculo.nombre + " | Velocidad actual: " + vehiculo.velocidad + " km/h";

        lista.appendChild(li);
    }
}