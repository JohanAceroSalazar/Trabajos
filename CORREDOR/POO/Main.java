public class Main {
    public static void main(String[] args) {
        
        Aprendiz e1 = new Aprendiz("Johan", 18, "A");
        e1.estudiar();

        Instructor p1 = new Instructor("Carlos", "Matemáticas", 5);
        p1.enseñar();

        mesa pup1 = new mesa("Madera", true);
        pup1.usar();

        silla s1 = new silla("Plástico", true);
        s1.sentarse();

        pizarra piz1 = new pizarra("Acrílica", true);
        piz1.escribir("Bienvenidos al salón");

        Computador c1 = new Computador("HP", 16);
        c1.encender();

        Ventana v1 = new Ventana("Grande", false);
        v1.abrir();

        Puerta pt1 = new Puerta("Madera", false);
        pt1.cerrar();

        Libro l1 = new Libro("Java Básico", "Deitel");
        l1.leer();

        Cuaderno cu1 = new Cuaderno(100, "Rojo");
        cu1.escribir();

        Lampara la1 = new Lampara("LED", false);
        la1.encender();

        Reloj r1 = new Reloj("Digital", "08:00");
        r1.mostrarHora();

        Ventilador v2 = new Ventilador("Oster", 3);
        v2.encender();

        Basurero bas1 = new Basurero("Grande", 0);
        bas1.vaciar();

        Mochila mo1 = new Mochila("Azul", 5);
        mo1.abrir();

        Regla re1 = new Regla(30, "Plástico");
        re1.medir();

        Calculadora cal1 = new Calculadora("Casio", true);
        cal1.sumar(5, 8);

        Estuche es1 = new Estuche("Negro", 10);
        es1.abrir();

        Televisor tv1 = new Televisor("Samsung", 42);
        tv1.encender();

        Piso pi1 = new Piso("Cerámica", "Beige");
        pi1.limpiar();

        Techo te1 = new Techo("Blanco", true);
        te1.revisar();

        AireAcondicionado ai1 = new AireAcondicionado("LG", 22);
        ai1.regularTemperatura();
    }
}