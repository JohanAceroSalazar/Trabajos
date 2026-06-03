import React, { useState } from 'react';
import { Pressable, SafeAreaView, Text, TextInput, View } from 'react-native';
import styles from '../styles/globalStyles';

function CalculatorScreen() {
  // Estos estados guardan lo que escribe el usuario y el resultado final.
  const [numero1, setNumero1] = useState('');
  const [numero2, setNumero2] = useState('');
  const [resultado, setResultado] = useState('0');

  const calcular = (operacion) => {
    // TextInput entrega texto, por eso se convierte a numero con parseFloat.
    const n1 = parseFloat(numero1);
    const n2 = parseFloat(numero2);

    // Validacion sencilla para evitar calcular con campos vacios o texto.
    if (Number.isNaN(n1) || Number.isNaN(n2)) {
      setResultado('Digite dos numeros validos');
      return;
    }

    if (operacion === 'dividir' && n2 === 0) {
      // Esta validacion evita el error matematico de dividir entre cero.
      setResultado('No se puede dividir entre cero');
      return;
    }

    // Segun el boton presionado, se ejecuta una operacion diferente.
    if (operacion === 'sumar') setResultado(String(n1 + n2));
    if (operacion === 'restar') setResultado(String(n1 - n2));
    if (operacion === 'multiplicar') setResultado(String(n1 * n2));
    if (operacion === 'dividir') setResultado(String(n1 / n2));
  };

  return (
    <SafeAreaView style={styles.safeArea}>
      <View style={styles.container}>
        <Text style={styles.title}>Calculadora basica</Text>

        {/* onChangeText actualiza el estado cada vez que el usuario escribe. */}
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
          {/* Cada boton manda el nombre de la operacion a la funcion calcular. */}
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

export default CalculatorScreen;
