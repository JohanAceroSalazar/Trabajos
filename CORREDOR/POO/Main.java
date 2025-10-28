public class Main {
    public static void main(String[] args) {

        Aprendiz a1 = new Aprendiz("Johan", 18, "A");
        Aprendiz a2 = new Aprendiz("Ana", 25, "B");
        Aprendiz a3 = new Aprendiz("Luis", 19, "A");
        Aprendiz a4 = new Aprendiz("Marta", 18, "C");
        Aprendiz a5 = new Aprendiz("Diego", 20, "B");
        a1.estudiar(); a2.estudiar(); a3.estudiar(); a4.estudiar(); a5.estudiar();

        Instructor i1 = new Instructor("Carlos", "Matematicas", 5);
        Instructor i2 = new Instructor("Sofia", "Fisica", 8);
        Instructor i3 = new Instructor("Ruben", "Quimica", 3);
        Instructor i4 = new Instructor("Laura", "Historia", 10);
        Instructor i5 = new Instructor("Pablo", "Ingles", 2);
        i1.enseñar(); i2.enseñar(); i3.enseñar(); i4.enseñar(); i5.enseñar();

        Mesa m1 = new Mesa("Madera", true);
        Mesa m2 = new Mesa("Metal", false);
        Mesa m3 = new Mesa("Plastico", true);
        Mesa m4 = new Mesa("Madera", false);
        Mesa m5 = new Mesa("MDF", true);
        m1.usar(); m2.usar(); m3.usar(); m4.usar(); m5.usar();

        Silla s1 = new Silla("Plastico", true);
        Silla s2 = new Silla("Madera", false);
        Silla s3 = new Silla("Metal", true);
        Silla s4 = new Silla("Acero", true);
        Silla s5 = new Silla("Resina", false);
        s1.sentarse(); s2.sentarse(); s3.sentarse(); s4.sentarse(); s5.sentarse();

        Pizarra pz1 = new Pizarra("Acrilica", true);
        Pizarra pz2 = new Pizarra("Blanca", false);
        Pizarra pz3 = new Pizarra("Negra", true);
        Pizarra pz4 = new Pizarra("Vidrio", true);
        Pizarra pz5 = new Pizarra("Corcho", false);
        pz1.escribir("Bienvenidos"); pz2.escribir("Tema 1"); pz3.escribir("Ejemplo"); pz4.escribir("Anuncio"); pz5.escribir("Aviso");

        Marcador mc1 = new Marcador("Negro", true);
        Marcador mc2 = new Marcador("Azul", false);
        Marcador mc3 = new Marcador("Rojo", true);
        Marcador mc4 = new Marcador("Verde", true);
        Marcador mc5 = new Marcador("Morado", false);
        mc1.escribir(); mc2.escribir(); mc3.escribir(); mc4.escribir(); mc5.escribir();

        Borrador b1 = new Borrador("Espuma", true);
        Borrador b2 = new Borrador("Tela", false);
        Borrador b3 = new Borrador("Goma", true);
        Borrador b4 = new Borrador("Cepillo", true);
        Borrador b5 = new Borrador("Paño", false);
        b1.borrar(); b2.borrar(); b3.borrar(); b4.borrar(); b5.borrar();

        Computador cp1 = new Computador("HP", 8);
        Computador cp2 = new Computador("Dell", 16);
        Computador cp3 = new Computador("Lenovo", 4);
        Computador cp4 = new Computador("Asus", 32);
        Computador cp5 = new Computador("Acer", 8);
        cp1.encender(); cp2.encender(); cp3.encender(); cp4.encender(); cp5.encender();

        Proyector pr1 = new Proyector("Epson", true);
        Proyector pr2 = new Proyector("BenQ", false);
        Proyector pr3 = new Proyector("ViewSonic", true);
        Proyector pr4 = new Proyector("Optoma", true);
        Proyector pr5 = new Proyector("LG", false);
        pr1.proyectar(); pr2.proyectar(); pr3.proyectar(); pr4.proyectar(); pr5.proyectar();

        Ventana v1 = new Ventana("Grande", false);
        Ventana v2 = new Ventana("Pequena", true);
        Ventana v3 = new Ventana("Mediana", false);
        Ventana v4 = new Ventana("Panoramica", true);
        Ventana v5 = new Ventana("Basica", false);
        v1.abrir(); v2.abrir(); v3.abrir(); v4.abrir(); v5.abrir();

        Puerta pt1 = new Puerta("Madera", true);
        Puerta pt2 = new Puerta("Metal", false);
        Puerta pt3 = new Puerta("PVC", true);
        Puerta pt4 = new Puerta("Vidrio", true);
        Puerta pt5 = new Puerta("Aluminio", false);
        pt1.cerrar(); pt2.cerrar(); pt3.cerrar(); pt4.cerrar(); pt5.cerrar();

        Libro l1 = new Libro("Java Basico", "Deitel");
        Libro l2 = new Libro("Algoritmos", "Cormen");
        Libro l3 = new Libro("Estructuras", "Gonzalez");
        Libro l4 = new Libro("Redes", "Tanenbaum");
        Libro l5 = new Libro("Bases de Datos", "Elmasri");
        l1.leer(); l2.leer(); l3.leer(); l4.leer(); l5.leer();

        Cuaderno cu1 = new Cuaderno(100, "Rojo");
        Cuaderno cu2 = new Cuaderno(200, "Azul");
        Cuaderno cu3 = new Cuaderno(50, "Verde");
        Cuaderno cu4 = new Cuaderno(150, "Negro");
        Cuaderno cu5 = new Cuaderno(80, "Amarillo");
        cu1.escribir(); cu2.escribir(); cu3.escribir(); cu4.escribir(); cu5.escribir();

        Lampara lm1 = new Lampara("LED", false);
        Lampara lm2 = new Lampara("Fluorescente", true);
        Lampara lm3 = new Lampara("Incandescente", false);
        Lampara lm4 = new Lampara("Halogena", true);
        Lampara lm5 = new Lampara("Neon", false);
        lm1.encender(); lm2.encender(); lm3.encender(); lm4.encender(); lm5.encender();

        Reloj r1 = new Reloj("Digital", "08:00");
        Reloj r2 = new Reloj("Analogico", "08:05");
        Reloj r3 = new Reloj("Digital", "08:10");
        Reloj r4 = new Reloj("Analogico", "08:15");
        Reloj r5 = new Reloj("Smart", "08:20");
        r1.mostrarHora(); r2.mostrarHora(); r3.mostrarHora(); r4.mostrarHora(); r5.mostrarHora();

        Ventilador vf1 = new Ventilador("Oster", 3);
        Ventilador vf2 = new Ventilador("Orbit", 2);
        Ventilador vf3 = new Ventilador("Philco", 1);
        Ventilador vf4 = new Ventilador("Xiaomi", 4);
        Ventilador vf5 = new Ventilador("Midea", 3);
        vf1.encender(); vf2.encender(); vf3.encender(); vf4.encender(); vf5.encender();

        Basurero bs1 = new Basurero("Grande", 5);
        Basurero bs2 = new Basurero("Mediano", 2);
        Basurero bs3 = new Basurero("Pequeno", 0);
        Basurero bs4 = new Basurero("Industrial", 10);
        Basurero bs5 = new Basurero("Exterior", 3);
        bs1.vaciar(); bs2.vaciar(); bs3.vaciar(); bs4.vaciar(); bs5.vaciar();

        Cartel ct1 = new Cartel("Reglamento", "Papeleria");
        Cartel ct2 = new Cartel("Horario", "Vinilo");
        Cartel ct3 = new Cartel("Mapa", "Impreso");
        Cartel ct4 = new Cartel("Anuncio", "Carton");
        Cartel ct5 = new Cartel("Evento", "Plastico");
        ct1.mostrar(); ct2.mostrar(); ct3.mostrar(); ct4.mostrar(); ct5.mostrar();

        Mochila mo1 = new Mochila("Azul", 2.5);
        Mochila mo2 = new Mochila("Negra", 3.0);
        Mochila mo3 = new Mochila("Roja", 1.8);
        Mochila mo4 = new Mochila("Verde", 4.2);
        Mochila mo5 = new Mochila("Gris", 2.0);
        mo1.abrir(); mo2.abrir(); mo3.abrir(); mo4.abrir(); mo5.abrir();

        Regla rg1 = new Regla(30, "Plastico");
        Regla rg2 = new Regla(15, "Madera");
        Regla rg3 = new Regla(20, "Metal");
        Regla rg4 = new Regla(10, "PVC");
        Regla rg5 = new Regla(50, "Fibra");
        rg1.medir(); rg2.medir(); rg3.medir(); rg4.medir(); rg5.medir();

        Calculadora cl1 = new Calculadora("Casio", false);
        Calculadora cl2 = new Calculadora("Sharp", true);
        Calculadora cl3 = new Calculadora("HP", false);
        Calculadora cl4 = new Calculadora("Texas", true);
        Calculadora cl5 = new Calculadora("Canon", false);
        cl1.sumar(2,3); cl2.sumar(10,5); cl3.sumar(7,8); cl4.sumar(0,1); cl5.sumar(100,200);

        Estuche es1 = new Estuche("Negro", 10);
        Estuche es2 = new Estuche("Azul", 5);
        Estuche es3 = new Estuche("Rojo", 8);
        Estuche es4 = new Estuche("Gris", 12);
        Estuche es5 = new Estuche("Verde", 6);
        es1.abrir(); es2.abrir(); es3.abrir(); es4.abrir(); es5.abrir();

        Televisor tv1 = new Televisor("Samsung", 42);
        Televisor tv2 = new Televisor("LG", 32);
        Televisor tv3 = new Televisor("Sony", 50);
        Televisor tv4 = new Televisor("Panasonic", 40);
        Televisor tv5 = new Televisor("Hisense", 43);
        tv1.encender(); tv2.encender(); tv3.encender(); tv4.encender(); tv5.encender();

        Piso ps1 = new Piso("Ceramica", "Beige");
        Piso ps2 = new Piso("Madera", "Marron");
        Piso ps3 = new Piso("Vinilo", "Gris");
        Piso ps4 = new Piso("Baldosa", "Blanco");
        Piso ps5 = new Piso("Cemento", "Natural");
        ps1.limpiar(); ps2.limpiar(); ps3.limpiar(); ps4.limpiar(); ps5.limpiar();

        Techo tc1 = new Techo("Blanco", true);
        Techo tc2 = new Techo("Gris", false);
        Techo tc3 = new Techo("Beige", true);
        Techo tc4 = new Techo("Azul", true);
        Techo tc5 = new Techo("Crema", false);
        tc1.revisar(); tc2.revisar(); tc3.revisar(); tc4.revisar(); tc5.revisar();

        AireAcondicionado ac1 = new AireAcondicionado("LG", 22);
        AireAcondicionado ac2 = new AireAcondicionado("Samsung", 24);
        AireAcondicionado ac3 = new AireAcondicionado("Daikin", 20);
        AireAcondicionado ac4 = new AireAcondicionado("Carrier", 23);
        AireAcondicionado ac5 = new AireAcondicionado("Midea", 21);
        ac1.regularTemperatura(); ac2.regularTemperatura(); ac3.regularTemperatura(); ac4.regularTemperatura(); ac5.regularTemperatura();
    }
}