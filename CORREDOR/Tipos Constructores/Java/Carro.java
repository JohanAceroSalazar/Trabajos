package Java;

public class Carro extends Transporte implements Vehiculo{
    String marca;
    int modelo;

    //Constructor sin parámetros
    public Carro() {
        this.tipo = "Carro";
        this.marca = "Toyota";   
        this.modelo = 2020;
    }

    @Override
    public void mover() {
        System.out.println("El carro está en movimiento.");
    }

    @Override
    void informacion() {
        System.out.println("Tipo de transporte: " + tipo);
        System.out.println("Marca: " + marca);
        System.out.println("Modelo: " + modelo);
    }
}