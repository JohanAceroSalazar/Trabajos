async function queue(url,method,data=null){
  //cabecera de la petición
    let headersList = {
      "Content-Type": "application/json"
    };
    
    let config = {
        method: method,
        headers: headersList
    };

    // 👇 SOLO si hay data
    if(data){
        config.body = JSON.stringify(data);
    }

    let response = await fetch(url, config);

    return await response.json();
}