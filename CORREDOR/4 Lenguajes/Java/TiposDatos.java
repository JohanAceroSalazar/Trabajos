package Java;

public class TiposDatos {
    public static void main(String[] args) {

        // 🔢 1. Tipos numéricos enteros
        byte edad = 25;                
        short año = 2025;               
        int poblacion = 500000;         
        long distancia = 9876543210L;   
        char letra = 'A';               

        System.out.println("Tipos Enteros");
        System.out.println("Edad: " + edad);
        System.out.println("Año: " + año);
        System.out.println("Población: " + poblacion);
        System.out.println("Distancia: " + distancia);
        System.out.println("Letra: " + letra);

        // 🔢 2. Tipos numéricos decimales
        float precio = 19.99f;   
        double peso = 70.45;     
        System.out.println("Tipos Decimales");
        System.out.println("Precio: " + precio);
        System.out.println("Peso: " + peso);

        // 💬 3. Tipo texto (String)
        String nombre = "Johan";
        String saludo = "Hola, ¿cómo estás?";
        String curso = "Programación en Java";
        String ciudad = "Bogotá";
        String frase = "El conocimiento es poder";

        System.out.println("Tipo Texto");
        System.out.println(nombre);
        System.out.println(saludo);
        System.out.println(curso);
        System.out.println(ciudad);
        System.out.println(frase);

        // ✅ 4. Tipo booleano (true / false)
        boolean esMayorDeEdad = true;
        boolean tieneLicencia = false;
        boolean aprobado = true;
        boolean encendido = false;
        boolean accesoPermitido = true;

        System.out.println("Tipo Booleano");
        System.out.println("Mayor de edad: " + esMayorDeEdad);
        System.out.println("Tiene licencia: " + tieneLicencia);
        System.out.println("Aprobado: " + aprobado);
        System.out.println("Encendido: " + encendido);
        System.out.println("Acceso permitido: " + accesoPermitido);

        // 💾 5. Tipo binario (representado con int o byte)
        byte binario1 = 0b1010;     
        byte binario2 = 0b1100;     
        int binario3 = 0b1111;       
        int binario4 = 0b100000;     
        String binario5 = "101010";  

        System.out.println("Tipo Binario");
        System.out.println("Binario 1: " + binario1);
        System.out.println("Binario 2: " + binario2);
        System.out.println("Binario 3: " + binario3);
        System.out.println("Binario 4: " + binario4);
        System.out.println("Binario 5 (texto): " + binario5);
    }
}