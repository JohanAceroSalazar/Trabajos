let carrito=[];
let total = 0;

function agregarCarrito(){

    let nombre = document.getElementById("nombreProduct").value;
    let precio = parseFloat(document.getElementById("precioProducto").value);
    let mensaje = document.getElementById("mensajeCarrito");

    let producto = {
        nombre: nombre,
        precio: precio
    };

    carrito.push(producto);

    mensaje.textContent = "Producto agregado al carrito";

    let li = document.createElement("li");
    li.textContent = nombre + "  $" + precio;

    let botonEliminar = document.createElement("button");
    botonEliminar.textContent = "Eliminar";

    botonEliminar.onclick = function(){

        total -= precio;

        document.getElementById("totalCompra").textContent =
        "Total: $" + total;

        li.remove();
    };

    li.appendChild(botonEliminar);

    document.getElementById("listaCarrito").appendChild(li);

    total += precio;

    document.getElementById("totalCompra").textContent =
    "Total: $" + total;
}