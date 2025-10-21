public class AireAcondicionado {
    String marca;
    int temperatura;
    AireAcondicionado(String m, int t) { marca = m; temperatura = t; }
    void regularTemperatura() { System.out.println("Temperatura ajustada a " + temperatura + "°C"); }
}
