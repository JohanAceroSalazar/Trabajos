//cargue de tabla
function loadData(table,registers, fields){
    clearTable(table);

    if(Array.isArray(registers)){
        registers.forEach(register=>{
            loadTable(table,register,fields);
        })
    }else{
        loadTable(table,registers,fields);
    }
}

function loadTable(table,data,fields){

    //creación de la estructura de la tabla    
    var register=document.createElement("tr");

    fields.forEach(field => {
        const cell = document.createElement("td");
        cell.innerText= data[field] ?? "";
        register.appendChild(cell);
    });

    table.appendChild(register);
}

function clearTable(table){
    table.innerHTML="";

}