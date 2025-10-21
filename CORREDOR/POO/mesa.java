public class mesa {
    String material;
    boolean limpio;
    mesa(String m, boolean l) { material = m; limpio = l; }
    void usar() { System.out.println("Pupitre de " + material + " en uso."); }
}