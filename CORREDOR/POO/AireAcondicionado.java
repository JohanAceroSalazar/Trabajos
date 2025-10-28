public class AireAcondicionado {
    private String marca;
    private int temperatura;

    public AireAcondicionado(String marca, int temperatura) {
        this.marca = marca;
        this.temperatura = temperatura;
    }

    public String getMarca(){
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public int getTemperatura() {
        return temperatura;
    }

    public void setTemperatura(int temperatura) {
        this.temperatura = temperatura;
    }

    public void regularTemperatura() {
        System.out.println("Aire acondicionado " + marca + " ajustado a " + temperatura + "°C."); }
}