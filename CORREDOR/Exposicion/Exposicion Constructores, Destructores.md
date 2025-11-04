# Exposición Constructores y Destructores

# 1. Constructores
Un constructor es un método especial que se ejecuta automáticamente cuando se crea un objeto.  
Sirve para inicializar los atributos del objeto o asignar valores iniciales.

# Ejemplo general
```java
class Persona {
    String nombre;
    int edad;

    // Constructor
    Persona(String n, int e) {
        nombre = n;
        edad = e;
    }
}
```
Cuando hacemos:

Persona p1 = new Persona("Johan", 20);

Se ejecuta el constructor y asigna esos valores.

# 2. Tipos de Constructores

## Constructor Sin parámetros (vacío)
Lo escribe uno mismo, pero no tiene parámetros. Sirve para iniciar con valores fijos.
```java
public class Persona {
    String nombre;
    int edad;

    
    public Persona() {
        nombre = "Sin nombre";
        edad = 0;
    }

    public void mostrarInfo() {
        System.out.println("Nombre: " + nombre + ", Edad: " + edad);
    }
}
```

```java
public class Main {
    public static void main(String[] args) {
        
        Persona p1 = new Persona(); 
        p1.mostrarInfo();// Nombre: Sin nombre, Edad: 0
    }
}
```
## Constructor Con parámetros
Permite pasar valores al crear el objeto. Es el más común.

```java
public class Persona {
    String nombre;
    int edad;

public Persona(String n, int e) {
        nombre = n;
        edad = e;
    }

    public void mostrarInfo() {
        System.out.println("Nombre: " + nombre + ", Edad: " + edad);
    }
}
```

```java
public class Main {
    public static void main(String[] args) {

        Persona p2 = new Persona("Johan", 20);
        p2.mostrarInfo();
    }
}
```

## Constructor De Copia (en algunos lenguajes)
Crea un objeto copiando los valores de otro

```java
public class Persona {
    String nombre;
    int edad;

    public Persona(Persona p) {
        nombre = p.nombre;
        edad = p.edad;
    }

    public void mostrarInfo() {
        System.out.println("Nombre: " + nombre + ", Edad: " + edad);
    }
}
```

```java
public class Main {
    public static void main(String[] args) {

        Persona original = new Persona("Johan", 20);
        Persona copia = new Persona(original);  // Usa el constructor de copia

        copia.mostrarInfo();
    }
}
```

## Constructor Sobrecargados
Puedes tener varios constructores con distintos parámetros.

```java
public class Persona {
    String nombre;
    int edad;

    // Constructor 1: sin parámetros
    public Persona() {
        nombre = "Sin nombre";
        edad = 0;
    }

    // Constructor 2: solo nombre
    public Persona(String n) {
        nombre = n;
        edad = 18;
        System.out.println("Constructor sobrecargado (solo nombre) ejecutado");
    }

    // Constructor 3: nombre y edad
    public Persona(String n, int e) {
        nombre = n;
        edad = e;
        System.out.println("Constructor sobrecargado (nombre y edad) ejecutado");
    }

    public void mostrarInfo() {
        System.out.println("Nombre: " + nombre + ", Edad: " + edad);
    }
}
```

```java
public class Main {
    public static void main(String[] args) {

        Persona p1 = new Persona();               // Usa el sin parámetros
        Persona p2 = new Persona("Johan");        // Usa el de un parámetro
        Persona p3 = new Persona("Laura", 25);    // Usa el de dos parámetros

        p1.mostrarInfo();
        p2.mostrarInfo();
        p3.mostrarInfo();
    }
}
```

# 3. Destructores
El destructor es un método especial que se ejecuta automáticamente cuando el objeto deja de existir o se libera de memoria.

- En Java y C#, el **colector de basura (Garbage Collector) destruye los objetos automáticamente.  
  → No hay destructor directo, pero se puede usar `finalize()` (ya obsoleto).

- En C++, sí existe un destructor con el símbolo `~`.

# Ejemplo (C++)
```cpp
class Persona {
public:
    ~Persona() {
        cout << "Objeto destruido" << endl;
    }
};
```

---

## 4. Ciclo de vida de un objeto

| Etapa | Qué ocurre |
|-------|-------------|
| 1. Declaración | Se define la clase y sus atributos/métodos. |
| 2. Creación (instanciación) | Se usa `new` o similar para crear el objeto en memoria. |
| 3. Inicialización** | Se ejecuta el constructor. |
| 4. Uso | El objeto ejecuta sus métodos y manipula datos. |
| 5. Destrucción | Se libera la memoria (automático o con destructor). |

# Ejemplo
```java
Persona p1 = new Persona("Johan", 20); // se crea y se inicializa
p1.hablar();                           // se usa
p1 = null;                             // se libera (el Garbage Collector la destruye)
```

---

# Resumen
- El constructor inicializa el objeto cuando se crea.  
- Hay constructores por defecto, sin parámetros, con parámetros, de copia y sobrecargados.  
- El destructor libera recursos cuando el objeto ya no se usa.  
- El ciclo de vida del objeto va desde su creación, uso y destrucción.