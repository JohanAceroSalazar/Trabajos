async function getAllCarts() {

    var data = await queue(urlCarts, get);

    var container = document.getElementById("cartsContainer");
    container.innerHTML= "";

    data.carts.forEach(cart => {

        cart.products.forEach(product => {

            let row = document.createElement("tr");

            row.innerHTML = `
                <td>${cart.id}</td>
                <td>${product.title}</td>
                <td>${product.price}</td>
                <td>${product.quantity}</td>
                <td>${product.total}</td>
            `;

            container.appendChild(row);
        });

    });
}

async function getByIdCart() {

    let id = document.getElementById("cartId").value;

    if(!id){
        alert("Ingrese un ID");
        return;
    }

    var cart = await queue(`${urlCarts}/${id}`, get);

    var container = document.getElementById("cartsContainer");
    container.innerHTML = "";

    cart.products.forEach(product => {

        let row = document.createElement("tr");

        row.innerHTML = `
            <td>${cart.id}</td>
            <td>${product.title}</td>
            <td>${product.price}</td>
            <td>${product.quantity}</td>
            <td>${product.total}</td>
        `;

        container.appendChild(row);
    });
}

async function createCart() {

    let title = document.getElementById("titleCart").value;
    let price = parseFloat(document.getElementById("priceCart").value);
    let quantity = parseInt(document.getElementById("quantity").value);
    let total = parseFloat(document.getElementById("total").value);

    if(!title || isNaN(price) || isNaN(quantity) || isNaN(total)){
        alert("Complete todos los campos");
        return;
    }

    let cart = {
        products: [
        {
        title,
        price,
        quantity,
        total
        }
    ]
};

    try {
        await queue(urlCarts, post, cart)
        alert("Carrito creado exitosamnete");
        getAllCarts();
    } catch (error) {
        alert("Error al crear");
    }
}

async function updateCart() {

    let id = document.getElementById("cartId").value

    if(!id){
        alert("Seleccione un carrito");
        return;
    }

    let cart = {
        products: [
            {
        title: document.getElementById("titleCart").value,
        price: parseFloat(document.getElementById("priceCart").value),
        quantity: parseInt(document.getElementById("quantity").value),
        total: parseFloat(document.getElementById("total").value)
            }
        ]
    };

    try {
        await queue(`${urlCarts}/${id}`, put, cart)
        alert("Carrito actualizado exitosamente");
        getAllCarts();
    } catch (error) {
        alert("Error al actualizar");
    }
}

async function deleteByIdCart() {

    let id = document.getElementById("cartId").value;

    if(!id){
        alert("Ingrese un ID");
        return;
    }

    if(!confirm("Seguro que desea eliminar el carrito")) return;

    try{
        await queue(`${urlCarts}/${id}`, deletes);
        alert("Carrito eliminado");
        getAllCarts();
    } catch (error){
        alert("Error al eliminar");
    }
}