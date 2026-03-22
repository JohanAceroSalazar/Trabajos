//función para consulta todos los productos 
async function getAllProducts(){

    var products = await queue(urlProducts, get);

    var container=document.getElementById("container");
    container.innerHTML= "";

    const fields = ["id", "title", "description", "category", "price"];

    loadData(container, products, fields);
}

async function getFindByIdP(){
    
    let id = document.getElementById("productId").value;

    if(!id){
        alert("Ingrese un ID");
        return;
    }

    var products = await queue(`${urlProducts}/${id}`, get);

    var container = document.getElementById("container");
    container.innerHTML = "";

    const fields = ["id", "title", "description", "category", "price"];

    loadData(container, [products], fields);
}

async function createProduct() {

    let title = document.getElementById("title").value;
    let description = document.getElementById("description").value;
    let category = document.getElementById("category").value;
    let price = parseFloat(document.getElementById("price").value);

    if(!title || !description || !category || isNaN(price)){
        alert("Complete todos los campos");
        return;
    }

    let product = {
        title,
        description,
        category,
        price
    };

    try{
        await queue(urlProducts, post, product);
        alert("Producto creado exitosamente");
        getAllProducts();
    } catch(error){
        alert("Error al crear");
    }
}

async function updateProduct() {

    let id = document.getElementById("id").value;

    if(!id){
        alert("Seleccione un producto para editar");
        return;
    }

    let product = {
        title: document.getElementById("title").value,
        description: document.getElementById("description").value,
        category: document.getElementById("category").value,
        price: parseFloat(document.getElementById("price").value)
    };

    try {
        await queue(`${urlProducts}/${id}`, put, product);
        alert("Producto actualizado correctamente");
        getAllProducts();
    } catch (error) {
        alert("Error al actualizar");
    }
}

async function deleteByIdPro(){

    let id = document.getElementById("productId").value;

    if(!confirm("Seguro que desea eliminar el producto")) return;

    try{
        await queue(`${urlProducts}/${id}`, deletes);
        alert("Producto eliminado");
        getAllProducts();
    } catch (error){
        alert("Error al eliminar");
    }
}