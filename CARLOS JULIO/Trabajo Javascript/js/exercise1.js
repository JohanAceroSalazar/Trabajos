let cuentas = [];

function crearCuentas(){

    let nombre = document.getElementById("cliente").value;
    let saldo = parseFloat(document.getElementById("saldo").value);
    let mensaje = document.getElementById("mensajeBanco");

    let cuenta ={
        nombre : nombre,
        saldo : saldo
    };

    cuentas.push(cuenta);

    mensaje.textContent = "Cuenta creada para " + nombre;
}

function ingresar(){

    let nombre = document.getElementById("clienteOperacion").value;
    let monto = parseFloat(document.getElementById("monto").value);
    let mensaje = document.getElementById("mensajeBanco");

    for(let cuenta of cuentas){

        if(cuenta.nombre === nombre){

            cuenta.saldo += monto;

            mensaje.textContent = "Ingreso realizado. Nuevo saldo: $" + cuenta.saldo;
            mensaje.className = "mensaje exito";

            return;
        }
    }

    mensaje.textContent = "Cliente no encontrado";
    mensaje.className = "mensaje error";
}

function retirar(){

    let nombre = document.getElementById("clienteOperacion").value;
    let monto = parseFloat(document.getElementById("monto").value);
    let mensaje = document.getElementById("mensajeBanco");

    for(let cuenta of cuentas){

        if(cuenta.nombre === nombre){

            if(monto > cuenta.saldo){

                mensaje.textContent = "Saldo insuficiente";
                mensaje.className = "mensaje error";

            }else{

                cuenta.saldo -= monto;

                mensaje.textContent = "Retiro exitoso. Saldo: $" + cuenta.saldo;
                mensaje.className = "mensaje exito";
            }

            return;
        }
    }

    mensaje.textContent = "Cliente no encontrado";
    mensaje.className = "mensaje error";
}

function consultarSaldo(){

    let mensaje = document.getElementById("mensajeBanco");
    let nombre = document.getElementById("clienteOperacion").value;

    for(let cuenta of cuentas){
        if(cuenta.nombre === nombre){

            mensaje.textContent = "El saldo de " + nombre + " es $ " + cuenta.saldo;
            mensaje.className = "mensaje exito";

            return;
        }
    }
    mensaje.textContent = "Cliente no encontrado";
    mensaje.textContent = "mensaje error";
}