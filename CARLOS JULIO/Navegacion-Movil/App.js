import 'react-native-gesture-handler';

import React from 'react';
import AppNavigator from './src/navigation/AppNavigator';

export default function App() {
  // App.js queda pequeno porque la navegacion y las pantallas estan separadas en src.
  return <AppNavigator />;
}
