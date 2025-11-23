package Java;

abstract class Electronico {
    String marca;
    int año;

    //Constructor sin parámetros (sobrecarga)
    public Electronico() {
        this.marca = "Genérica";
        this.año = 2024;
    }

    abstract void informacion();
}