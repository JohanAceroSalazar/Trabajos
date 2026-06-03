import React, { useState } from 'react';
import {
  Alert,
  Button,
  Modal,
  Pressable,
  SafeAreaView,
  ScrollView,
  Text,
  View,
} from 'react-native';
import { Picker } from '@react-native-picker/picker';
import styles from '../styles/globalStyles';

function HomeScreen({ navigation }) {
  // useState guarda datos que pueden cambiar mientras la app esta abierta.
  // Cuando cambia un estado, React Native vuelve a pintar la parte necesaria de la pantalla.
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
            {/* setMensaje cambia el texto que se muestra arriba. */}
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

          {/* Modal sirve para mostrar informacion encima de la pantalla actual.
              visible recibe true o false: true lo muestra, false lo oculta. */}
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
            {/* selectedValue es la opcion actual y onValueChange se ejecuta al escoger otra. */}
            <Picker selectedValue={opcion} onValueChange={(valor) => setOpcion(valor)}>
              <Picker.Item label="React Native" value="React Native" />
              <Picker.Item label="Expo" value="Expo" />
              <Picker.Item label="Navegacion" value="Navegacion" />
              <Picker.Item label="Componentes" value="Componentes" />
            </Picker>
          </View>

          <Text style={styles.result}>Seleccionaste: {opcion}</Text>
        </View>

        {/* navigation.navigate cambia a otra pantalla registrada en el Stack o Drawer. */}
        <Pressable style={styles.detailButton} onPress={() => navigation.navigate('Detalle')}>
          <Text style={styles.buttonText}>Ir a detalle</Text>
        </Pressable>
      </ScrollView>
    </SafeAreaView>
  );
}

export default HomeScreen;
