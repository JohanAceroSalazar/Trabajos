async function getAllPosts() {

    let data = await queue(urlPosts, get);

    let container = document.getElementById("postsContainer");
    container.innerHTML = "";

    data.posts.forEach(post => {

        let row = document.createElement("tr");

        row.innerHTML = `
            <td>${post.id}</td>
            <td>${post.title}</td>
            <td>${post.tags.join(", ")}</td>
            <td>${post.reactions.likes}</td>
            <td>${post.views}</td>
        `;

        container.appendChild(row);
    });
}

async function getPostById() {

    let id = document.getElementById("postId").value;

    if(!id){
        alert("Ingrese un ID");
        return;
    }

    let post = await queue(`${urlPosts}/${id}`, get);

    let container = document.getElementById("postsContainer");
    container.innerHTML = "";

    let row = document.createElement("tr");

    row.innerHTML = `
        <td>${post.id}</td>
        <td>${post.title}</td>
        <td>${post.tags.join(", ")}</td>
        <td>${post.reactions.likes}</td>
        <td>${post.views}</td>
    `;

    container.appendChild(row);
}

async function createPost() {

    let title = document.getElementById("titlePost").value;
    let tagsInput = document.getElementById("tagsPost").value;
    let likes = parseInt(document.getElementById("likesPost").value);
    let views = parseInt(document.getElementById("viewsPost").value);

    if(!title || !tagsInput || isNaN(likes) || isNaN(views)){
        alert("Complete todos los campos");
        return;
    }

    let post = {
        title,
        tags: tagsInput.split(",").map(tag => tag.trim()),
        reactions: {
            likes,
            dislikes: 0
        },
        views
    };

    try {
        await queue(urlPosts, post, post);
        alert("Post creado");
        getAllPosts();
    } catch {
        alert("Error al crear");
    }
}

async function updatePost() {

    let id = document.getElementById("postId").value;

    if(!id){
        alert("Ingrese un ID");
        return;
    }

    let title = document.getElementById("titlePost").value;
    let tagsInput = document.getElementById("tagsPost").value;
    let likes = parseInt(document.getElementById("likesPost").value);
    let views = parseInt(document.getElementById("viewsPost").value);

    let post = {
        title,
        tags: tagsInput.split(",").map(tag => tag.trim()),
        reactions: {
            likes,
            dislikes: 0
        },
        views
    };

    try {
        await queue(`${urlPosts}/${id}`, put, post);
        alert("Post actualizado");
        getAllPosts();
    } catch {
        alert("Error al actualizar");
    }
}

async function deletePost() {

    let id = document.getElementById("postId").value;

    if(!id){
        alert("Ingrese un ID");
        return;
    }

    if(!confirm("Seguro que desea eliminar el post")) return;

    try {
        await queue(`${urlPosts}/${id}`, deletes);
        alert("Post eliminado");
        getAllPosts();
    } catch {
        alert("Error al eliminar");
    }
}