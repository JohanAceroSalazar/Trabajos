package Java;

public class TelefonoInteligente extends Electronico implements Dispositivo{
    String modelo;
    int almacenamiento;

    // Constructor sobrecargado
    public TelefonoInteligente(String modelo, int almacenamiento) {
        super();// Llama al constructor sin parámetros de Electronico
        this.modelo = modelo;
        this.almacenamiento = almacenamiento;
    }

    @Override
    public void encender() {
        System.out.println("Encendiendo el teléfono...");
    }

    @Override
    void informacion() {
        System.out.println("Marca: " + marca);
        System.out.println("Año: " + año);
        System.out.println("Modelo: " + modelo);
        System.out.println("Almacenamiento: " + almacenamiento + " GB");
    }
}