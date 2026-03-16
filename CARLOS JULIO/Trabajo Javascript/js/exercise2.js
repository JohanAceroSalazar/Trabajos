let inventario = [];

function agregarProducto(){

    let nombre = document.getElementById("nombreProducto").value;
    let precio = parseFloat(document.getElementById("precio").value);
    let cantidad = parseInt(document.getElementById("cantidad").value);
    let mensaje = document.getElementById("mensajeInventario");

    let producto ={
        nombre:nombre,
        precio:precio,
        cantidad:cantidad
    };

    inventario.push(producto);

    let li = document.createElement("li");
    li.textContent = nombre + "  $" + precio + "  Cantidad: " + cantidad;

    document.getElementById("listaProductos").appendChild(li);

    mensaje.textContent = "Producto " + nombre + " registrado con exito.";
    mensaje.className = "mensaje exito";
}

function consultarProducto(){

    let nombre = document.getElementById("buscarProducto").value;
    let mensaje = document.getElementById("mensajeInventario");

    for(let producto of inventario){

        if(producto.nombre === nombre){

            mensaje.textContent =
            "Producto: " + producto.nombre +
            " | Precio: $" + producto.precio +
            " | Cantidad: " + producto.cantidad;

            mensaje.className = "mensaje exito";

            return;
        }
    }

    mensaje.textContent = "Producto no encontrado";
    mensaje.className = "mensaje error";
}

function calcularInventario(){

    let total = 0;

    for(let producto of inventario){

        total += producto.precio * producto.cantidad;

    }

    document.getElementById("totalInventario").textContent =
    "Valor total del inventario: $" + total;
}