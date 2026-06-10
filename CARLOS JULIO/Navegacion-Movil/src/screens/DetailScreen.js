import React from 'react';
import { Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import styles from '../styles/globalStyles';

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

export default DetailScreen;
