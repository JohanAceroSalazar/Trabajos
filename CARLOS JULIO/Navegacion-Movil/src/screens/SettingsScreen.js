import React from 'react';
import { Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import styles from '../styles/globalStyles';

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

export default SettingsScreen;
