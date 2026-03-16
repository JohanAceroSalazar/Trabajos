function calcular(){
    let num1 = parseFloat(document.getElementById("numero1").value);
    let num2 = parseFloat(document.getElementById("numero2").value);

    let operacion = document.getElementById("operacion").value;
    let resultado;

    if(operacion === "+"){
        resultado = num1 + num2;
        }
        else if(operacion === "-"){
            resultado = num1 - num2;
        }
        else if(operacion === "*"){
            resultado = num1 * num2;
        }
        else if(operacion === "/"){
            resultado = num1 / num2;
        }

        document.getElementById("resultadoCalc").textContent = "Resultado: " + resultado;
}