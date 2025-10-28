public class Ventana {
    String tamaño;
    boolean abierta;

    Ventana(String tamaño, boolean abierta) { 
        this.tamaño = tamaño; 
        this.abierta = abierta; 
    }

    public String getTamaño(){
        return tamaño;
    }

    public void setTamaño(String tamaño){
        this.tamaño = tamaño;
    }

    public boolean getAbierta(){
        return abierta;
    }

    public void setAbierta(boolean abierta){
        this.abierta = abierta;
    }

    void abrir() {
        System.out.println("Ventana " + tamaño + " abierta.");
    }
}