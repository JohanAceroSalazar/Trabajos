import React, { useEffect, useState } from 'react';
import { ActivityIndicator, FlatList, Pressable, SafeAreaView, Text, View } from 'react-native';
import styles from '../styles/globalStyles';

function LoadingListScreen() {
  // cargando controla si se muestra el ActivityIndicator.
  // datos guarda los elementos que se pintan en la lista.
  const [cargando, setCargando] = useState(true);
  const [datos, setDatos] = useState([]);

  useEffect(() => {
    // useEffect se ejecuta al abrir la pantalla.
    // Aqui se simula una carga inicial para que se vea el ActivityIndicator.
    const temporizador = setTimeout(() => {
      setDatos([
        'Botones',
        'Modal',
        'Dropdown',
        'Calculadora',
        'ScrollView',
        'FlatList',
        'Stack Navigation',
        'Bottom Tabs',
        'Drawer Layout',
      ]);
      setCargando(false);
    }, 1200);

    // Si la pantalla se cierra antes de terminar, se limpia el temporizador.
    return () => clearTimeout(temporizador);
  }, []);

  const cargarMas = () => {
    setCargando(true);

    // Se usa setTimeout para simular que la app esta cargando datos.
    setTimeout(() => {
      // Se usa listaActual para no perder los datos que ya estaban cargados.
      setDatos((listaActual) => [
        ...listaActual,
        `Nuevo elemento ${listaActual.length + 1}`,
        `Nuevo elemento ${listaActual.length + 2}`,
      ]);
      setCargando(false);
    }, 1200);
  };

  return (
    <SafeAreaView style={styles.safeArea}>
      <View style={styles.listScreen}>
        <Text style={styles.title}>Scroll Loading</Text>
        <Text style={styles.text}>FlatList permite mostrar listas con desplazamiento vertical.</Text>

        {cargando && datos.length === 0 ? (
          <View style={styles.loadingBox}>
            <ActivityIndicator size="large" color="#2f7d63" />
            <Text style={styles.text}>Cargando lista...</Text>
          </View>
        ) : (
          // FlatList es mejor que ScrollView cuando se van a mostrar varios elementos de una lista.
          <FlatList
            style={styles.list}
            data={datos}
            // keyExtractor le da un identificador a cada elemento para que React Native lo controle mejor.
            keyExtractor={(item, index) => `${item}-${index}`}
            renderItem={({ item }) => (
              <View style={styles.listItem}>
                <Text style={styles.listText}>{item}</Text>
              </View>
            )}
            // Este indicador aparece al final cuando se presiona "Cargar mas".
            ListFooterComponent={cargando ? <ActivityIndicator size="large" color="#2f7d63" /> : null}
            contentContainerStyle={styles.listContent}
            showsVerticalScrollIndicator
          />
        )}

        <Pressable style={styles.primaryButton} onPress={cargarMas} disabled={cargando}>
          <Text style={styles.buttonText}>Cargar mas</Text>
        </Pressable>
      </View>
    </SafeAreaView>
  );
}

export default LoadingListScreen;
