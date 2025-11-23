package Java;

abstract class Transporte {
    String tipo;

    //Constructor sin parametros 
    public Transporte(){
        this.tipo = "Desconocido";
    }

    abstract void informacion();
}