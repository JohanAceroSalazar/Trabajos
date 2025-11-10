package Java;

public class Metodos_SinParametros {
    public void arrancar() {
        System.out.println("El coche ha arrancado.");
    }

    public void detener() {
        System.out.println("El coche se ha detenido.");
    }

    public static void main(String[] args) {
        Metodos_SinParametros mp = new Metodos_SinParametros();
        mp.arrancar();
        mp.detener();

        Persona p = new Persona();
        p.saludar();
        p.dormir();

        Perro pe = new Perro();
        pe.comer();
        pe.ladrar();
    }
}

    class Persona {
    public void saludar() {
        System.out.println("Hola, mucho gusto!");
    }

    public void dormir() {
        System.out.println("La persona está durmiendo...");
    }
}

    class Perro {
    public void ladrar() {
        System.out.println("El perro está ladrando ¡Guau guau!");
    }

    public void comer() {
        System.out.println("El perro está comiendo su comida.");
    }
}