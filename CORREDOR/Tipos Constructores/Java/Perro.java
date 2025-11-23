package Java;

public class Perro extends Animal implements AccionesAnimal {
    String raza;
    double peso;

    // Constructor CON parámetros 
    public Perro(String nombre, int edad, String raza, double peso) {
        super(nombre, edad);// Llama al constructor de Animal
        this.raza = raza;
        this.peso = peso; 
    }

    @Override
    public void sonido(){
        System.out.println("Guau guau...");
    }
    @Override
    void informacion(){
        System.out.println("Nombre: " + nombre);
        System.out.println("Edad: " + edad + " años");
        System.out.println("Raza: " + raza);
        System.out.println("Peso: " + peso + " kg");
    }
}