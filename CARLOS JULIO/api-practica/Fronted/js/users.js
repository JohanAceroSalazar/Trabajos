async function getAllUsers(){

    var users = await queue(urlUsers, get);

    var container = document.getElementById("usersContainer");
    container.innerHTML= "";

    const fields = ["id", "firstName", "lastName", "age", "gender"];

    loadData(container, users, fields);
}

async function getUserById() {

    let id = document.getElementById("userId").value;

    if(!id){
        alert("Ingrese un ID");
    return;
    }

    var user = await queue(`${urlUsers}/${id}`, get);

    var container = document.getElementById("usersContainer");
    container.innerHTML= "";

    const fields = ["id", "firstName", "lastName", "age", "gender"];

    loadData(container, [user], fields);
}

async function createUser() {

    let firstName = document.getElementById("firstName").value;
    let lastName = document.getElementById("lastName").value;
    let age = parseInt(document.getElementById("age").value);
    let gender = document.getElementById("gender").value;

    if(!firstName || !lastName || !age || !gender){
        alert("Complete todos los campos");
        return;
    }

    let user = {
        firstName,
        lastName,
        age,
        gender
    };

    try {
        await queue(urlUsers, post, user)
        alert("Usuario creado exitosamente");
        getAllUsers();
    } catch (error) {
        alert("Error al crear")
    }
}

async function updateUser() {

    let id = document.getElementById("idUser").value;

    if(!id){
        alert("Seleccione un usuario");
        return;
    }

    let user = {
        firstName: document.getElementById("firstName").value,
        lastName: document.getElementById("lastName").value,
        age: parseInt(document.getElementById("age").value),
        gender: document.getElementById("gender").value
    };

    try {
        await queue(`${urlUsers}/${id}`, put, user);
        alert("Usuario actualizado correctamente");
        getAllUsers();
    } catch (error) {
        alert("Error al actualizar");
    }
}

async function deleteByIdUser() {

    let id = document.getElementById("userId").value;

    if(!id){
        alert("Ingrese un ID");
    }

    if(!confirm("Seguro que desea eliminar el usuario")) return;

    try{
        await queue(`${urlUsers}/${id}`, deletes);
        alert("Usuario eliminado");
        getAllUsers();
    } catch (error){
        alert("Error al eliminar");
    }
}