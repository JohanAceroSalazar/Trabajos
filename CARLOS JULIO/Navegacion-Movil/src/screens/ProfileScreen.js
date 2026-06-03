import React from 'react';
import { SafeAreaView, Text, View } from 'react-native';
import styles from '../styles/globalStyles';

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

export default ProfileScreen;