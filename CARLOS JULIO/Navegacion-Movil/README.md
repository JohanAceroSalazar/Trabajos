# Taller navegacion movil

Proyecto hecho en React Native con Expo para el taller del PDF.

## Que contiene

- Botones con eventos `onPress`.
- Modal que se abre y se cierra con botones.
- Dropdown con `Picker`, compatible con Android e iOS.
- Calculadora basica con suma, resta, multiplicacion y division.
- Lista con `FlatList` y `ActivityIndicator`.
- Navegacion con `NavigationContainer`, Stack, Bottom Tabs y Drawer.

## Como ejecutarlo

```bash
npm install
npm start
```

Luego se puede abrir con Expo Go en el celular o en un emulador.

## Explicacion corta para entregar

**Eventos onPress:**  
`onPress` es el evento que se ejecuta cuando el usuario toca un boton. En la aplicacion se usa para cambiar textos, abrir mensajes, abrir el modal y realizar acciones como calcular o cargar mas elementos.

**Modal/Dialog:**  
El `Modal` sirve para mostrar una ventana encima de la pantalla actual. Se puede usar para mensajes informativos o avisos. En el proyecto se abre con un boton y tambien se cierra con otro boton.

**Dropdown y Picker:**  
El `Picker` funciona como un menu desplegable donde el usuario puede escoger una opcion. Es util cuando hay varias opciones y solo se necesita seleccionar una. En la app se muestra tambien el valor elegido.

**Operaciones basicas en React Native:**  
Para la calculadora se usan campos `TextInput` para escribir numeros y botones para suma, resta, multiplicacion y division. Con `useState` se guardan los valores y se actualiza el resultado en pantalla.

**ScrollView y FlatList:**  
`ScrollView` permite desplazar contenido cuando la pantalla no alcanza. `FlatList` es mejor para listas de datos, porque organiza los elementos y permite hacer scroll vertical. Tambien se uso `ActivityIndicator` para mostrar que la lista esta cargando.

**React Navigation:**  
`React Navigation` es la libreria que permite moverse entre pantallas en React Native. En este proyecto se uso para conectar Inicio, Perfil, Configuracion, Detalle, Calculadora y Lista.

**Stack Navigation:**  
`Stack Navigation` funciona como una pila de pantallas. Sirve para entrar a una vista, como Detalle, y luego volver atras con el boton de regreso.

**Bottom Navigation:**  
`Bottom Tabs` muestra un menu inferior. En la app permite cambiar facilmente entre Inicio, Calculadora y Lista.

**Drawer Layout:**  
`Drawer` es el menu lateral que se abre desde un lado de la pantalla. En el proyecto se usa para navegar a Principal, Perfil y Configuracion.
