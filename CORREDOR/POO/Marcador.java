public class Marcador {
    private String color;
    private boolean tieneTinta;

    public Marcador(String color, boolean tieneTinta) {
        this.color = color;
        this.tieneTinta = tieneTinta;
    }

    public String getColor(){
        return color; 
    }

    public void setColor(String color) { 
        this.color = color; }

    public boolean isTieneTinta() {
        return tieneTinta; 
    }

    public void setTieneTinta(boolean tieneTinta) { 
        this.tieneTinta = tieneTinta; 
    }

    public void escribir() {
        System.out.println("Marcador " + color + " escribiendo.");
    }
}