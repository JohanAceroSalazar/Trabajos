import 'react-native-gesture-handler';

import React, { useEffect, useState } from 'react';
import {
  ActivityIndicator,
  Alert,
  Button,
  FlatList,
  Modal,
  Pressable,
  SafeAreaView,
  ScrollView,
  StatusBar,
  StyleSheet,
  Text,
  TextInput,
  View,
} from 'react-native';
import { Picker } from '@react-native-picker/picker';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { createDrawerNavigator } from '@react-navigation/drawer';

const Stack = createNativeStackNavigator();
const Tab = createBottomTabNavigator();
const Drawer = createDrawerNavigator();

function HomeScreen({ navigation }) {
  const [mensaje, setMensaje] = useState('Presiona un boton para cambiar este texto.');
  const [modalVisible, setModalVisible] = useState(false);
  const [opcion, setOpcion] = useState('React Native');

  return (
    <SafeAreaView style={styles.safeArea}>
      <ScrollView contentContainerStyle={styles.container}>
        <Text style={styles.title}>Taller navegacion movil</Text>
        <Text style={styles.text}>
          Esta pantalla tiene botones, modal y dropdown, como pide la primera parte del taller.
        </Text>

        <View style={styles.card}>
          <Text style={styles.subtitle}>Parte 1 - Botones</Text>
          <Text style={styles.result}>{mensaje}</Text>

          {/* Cada boton usa onPress. onPress es el evento que se ejecuta al tocar el boton. */}
          <View style={styles.buttonGroup}>
            <Pressable style={styles.primaryButton} onPress={() => setMensaje('Boton 1: Hola desde la app.')}>
              <Text style={styles.buttonText}>Mensaje 1</Text>
            </Pressable>

            <Pressable
              style={styles.secondaryButton}
              onPress={() => setMensaje('Boton 2: El texto cambio correctamente.')}
            >
              <Text style={styles.buttonText}>Mensaje 2</Text>
            </Pressable>

            <Pressable
              style={styles.darkButton}
              onPress={() => Alert.alert('Evento onPress', 'Este es un mensaje usando Alert.')}
            >
              <Text style={styles.buttonText}>Mostrar alerta</Text>
            </Pressable>
          </View>
        </View>

        <View style={styles.card}>
          <Text style={styles.subtitle}>Parte 2 - Modal</Text>
          <Text style={styles.text}>El modal se abre y se cierra con botones.</Text>

          <Button title="Abrir modal" onPress={() => setModalVisible(true)} />

          {/* Modal sirve para mostrar informacion encima de la pantalla actual. */}
          <Modal visible={modalVisible} transparent animationType="slide">
            <View style={styles.modalBackground}>
              <View style={styles.modalBox}>
                <Text style={styles.subtitle}>Informacion</Text>
                <Text style={styles.text}>
                  Este es un Dialog o Modal. Se usa para mostrar mensajes importantes al usuario.
                </Text>
                <Pressable style={styles.primaryButton} onPress={() => setModalVisible(false)}>
                  <Text style={styles.buttonText}>Cerrar modal</Text>
                </Pressable>
              </View>
            </View>
          </Modal>
        </View>

        <View style={styles.card}>
          <Text style={styles.subtitle}>Parte 3 - Dropdown / Picker</Text>
          <Text style={styles.text}>Selecciona una opcion:</Text>

          {/* Picker funciona como dropdown y es compatible con Android e iOS. */}
          <View style={styles.pickerBox}>
            <Picker selectedValue={opcion} onValueChange={(valor) => setOpcion(valor)}>
              <Picker.Item label="React Native" value="React Native" />
              <Picker.Item label="Expo" value="Expo" />
              <Picker.Item label="Navegacion" value="Navegacion" />
              <Picker.Item label="Componentes" value="Componentes" />
            </Picker>
          </View>

          <Text style={styles.result}>Seleccionaste: {opcion}</Text>
        </View>

        <Pressable style={styles.detailButton} onPress={() => navigation.navigate('Detalle')}>
          <Text style={styles.buttonText}>Ir a detalle</Text>
        </Pressable>
      </ScrollView>
    </SafeAreaView>
  );
}

function CalculatorScreen() {
  const [numero1, setNumero1] = useState('');
  const [numero2, setNumero2] = useState('');
  const [resultado, setResultado] = useState('0');

  const calcular = (operacion) => {
    const n1 = parseFloat(numero1);
    const n2 = parseFloat(numero2);

    // Validacion sencilla para evitar calcular con campos vacios o texto.
    if (Number.isNaN(n1) || Number.isNaN(n2)) {
      setResultado('Digite dos numeros validos');
      return;
    }

    if (operacion === 'dividir' && n2 === 0) {
      setResultado('No se puede dividir entre cero');
      return;
    }

    if (operacion === 'sumar') setResultado(String(n1 + n2));
    if (operacion === 'restar') setResultado(String(n1 - n2));
    if (operacion === 'multiplicar') setResultado(String(n1 * n2));
    if (operacion === 'dividir') setResultado(String(n1 / n2));
  };

  return (
    <SafeAreaView style={styles.safeArea}>
      <View style={styles.container}>
        <Text style={styles.title}>Calculadora basica</Text>

        <TextInput
          style={styles.input}
          placeholder="Primer numero"
          keyboardType="numeric"
          value={numero1}
          onChangeText={setNumero1}
        />
        <TextInput
          style={styles.input}
          placeholder="Segundo numero"
          keyboardType="numeric"
          value={numero2}
          onChangeText={setNumero2}
        />

        <View style={styles.grid}>
          <Pressable style={styles.calcButton} onPress={() => calcular('sumar')}>
            <Text style={styles.buttonText}>Sumar</Text>
          </Pressable>
          <Pressable style={styles.calcButton} onPress={() => calcular('restar')}>
            <Text style={styles.buttonText}>Restar</Text>
          </Pressable>
          <Pressable style={styles.calcButton} onPress={() => calcular('multiplicar')}>
            <Text style={styles.buttonText}>Multiplicar</Text>
          </Pressable>
          <Pressable style={styles.calcButton} onPress={() => calcular('dividir')}>
            <Text style={styles.buttonText}>Dividir</Text>
          </Pressable>
        </View>

        <Text style={styles.result}>Resultado: {resultado}</Text>
      </View>
    </SafeAreaView>
  );
}

function LoadingListScreen() {
  const [cargando, setCargando] = useState(true);
  const [datos, setDatos] = useState([]);

  useEffect(() => {
    // Esta carga inicial es para que se vea el ActivityIndicator al abrir la pantalla.
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

    return () => clearTimeout(temporizador);
  }, []);

  const cargarMas = () => {
    setCargando(true);

    // Se usa setTimeout para simular que la app esta cargando datos.
    setTimeout(() => {
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
          <FlatList
            style={styles.list}
            data={datos}
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

function ProfileScreen() {
  return (
    <SafeAreaView style={styles.safeArea}>
      <View style={styles.container}>
        <Text style={styles.title}>Perfil</Text>
        <Text style={styles.text}>Pantalla creada para cumplir con la navegacion solicitada.</Text>
      </View>
    </SafeAreaView>
  );
}

function DetailScreen() {
  return (
    <SafeAreaView style={styles.safeArea}>
      <View style={styles.container}>
        <Text style={styles.title}>Pantalla Detalle</Text>
        <Text style={styles.text}>
          Esta vista sirve para evidenciar Stack Navigation, porque se puede entrar y volver atras.
        </Text>
      </View>
    </SafeAreaView>
  );
}

function SettingsScreen() {
  return (
    <SafeAreaView style={styles.safeArea}>
      <View style={styles.container}>
        <Text style={styles.title}>Configuracion</Text>
        <Text style={styles.text}>Otra pantalla del Drawer Layout para navegar desde el menu lateral.</Text>
      </View>
    </SafeAreaView>
  );
}

function HomeStack() {
  return (
    <Stack.Navigator>
      <Stack.Screen name="Home" component={HomeScreen} options={{ title: 'Inicio' }} />
      <Stack.Screen name="Detalle" component={DetailScreen} />
    </Stack.Navigator>
  );
}

function BottomMenu() {
  return (
    <Tab.Navigator>
      <Tab.Screen name="Inicio" component={HomeStack} options={{ headerShown: false }} />
      <Tab.Screen name="Calculadora" component={CalculatorScreen} />
      <Tab.Screen name="Lista" component={LoadingListScreen} />
    </Tab.Navigator>
  );
}

export default function App() {
  return (
    <NavigationContainer>
      <StatusBar barStyle="dark-content" />

      {/* Drawer es el menu lateral. Dentro de el queda el menu inferior con tabs. */}
      <Drawer.Navigator>
        <Drawer.Screen name="Principal" component={BottomMenu} />
        <Drawer.Screen name="Perfil" component={ProfileScreen} />
        <Drawer.Screen name="Configuracion" component={SettingsScreen} />
        <Drawer.Screen name="Detalle" component={DetailScreen} />
      </Drawer.Navigator>
    </NavigationContainer>
  );
}

const styles = StyleSheet.create({
  safeArea: {
    flex: 1,
    backgroundColor: '#f4f6f5',
  },
  container: {
    flexGrow: 1,
    padding: 18,
    gap: 14,
  },
  listScreen: {
    flex: 1,
    padding: 18,
    gap: 14,
  },
  title: {
    color: '#17332b',
    fontSize: 26,
    fontWeight: '700',
  },
  subtitle: {
    color: '#17332b',
    fontSize: 18,
    fontWeight: '700',
  },
  text: {
    color: '#3d4f4a',
    fontSize: 15,
    lineHeight: 22,
  },
  result: {
    color: '#17332b',
    fontSize: 16,
    fontWeight: '600',
    marginTop: 4,
  },
  card: {
    backgroundColor: '#ffffff',
    borderRadius: 8,
    padding: 14,
    gap: 12,
    borderWidth: 1,
    borderColor: '#d9e4df',
  },
  buttonGroup: {
    gap: 10,
  },
  primaryButton: {
    backgroundColor: '#2f7d63',
    borderRadius: 8,
    padding: 13,
    alignItems: 'center',
  },
  secondaryButton: {
    backgroundColor: '#4f6fb5',
    borderRadius: 8,
    padding: 13,
    alignItems: 'center',
  },
  darkButton: {
    backgroundColor: '#30363d',
    borderRadius: 8,
    padding: 13,
    alignItems: 'center',
  },
  detailButton: {
    backgroundColor: '#805f2e',
    borderRadius: 8,
    padding: 13,
    alignItems: 'center',
  },
  buttonText: {
    color: '#ffffff',
    fontSize: 15,
    fontWeight: '700',
  },
  modalBackground: {
    flex: 1,
    backgroundColor: 'rgba(0,0,0,0.45)',
    justifyContent: 'center',
    padding: 20,
  },
  modalBox: {
    backgroundColor: '#ffffff',
    borderRadius: 8,
    padding: 18,
    gap: 14,
  },
  pickerBox: {
    borderWidth: 1,
    borderColor: '#c8d6d0',
    borderRadius: 8,
    overflow: 'hidden',
    backgroundColor: '#ffffff',
  },
  input: {
    backgroundColor: '#ffffff',
    borderWidth: 1,
    borderColor: '#c8d6d0',
    borderRadius: 8,
    padding: 12,
    fontSize: 16,
  },
  grid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 10,
  },
  calcButton: {
    width: '48%',
    minHeight: 48,
    backgroundColor: '#4f6fb5',
    borderRadius: 8,
    alignItems: 'center',
    justifyContent: 'center',
  },
  listContent: {
    gap: 10,
    paddingBottom: 24,
  },
  list: {
    flex: 1,
  },
  loadingBox: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    gap: 12,
  },
  listItem: {
    backgroundColor: '#ffffff',
    borderRadius: 8,
    borderWidth: 1,
    borderColor: '#d9e4df',
    padding: 14,
  },
  listText: {
    color: '#17332b',
    fontSize: 16,
  },
});
