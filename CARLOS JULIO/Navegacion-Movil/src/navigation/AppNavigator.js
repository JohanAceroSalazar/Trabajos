import React from 'react';
import { Platform, StatusBar } from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { createDrawerNavigator } from '@react-navigation/drawer';
import HomeScreen from '../screens/HomeScreen';
import CalculatorScreen from '../screens/CalculatorScreen';
import LoadingListScreen from '../screens/LoadingListScreen';
import ProfileScreen from '../screens/ProfileScreen';
import DetailScreen from '../screens/DetailScreen';
import SettingsScreen from '../screens/SettingsScreen';

const Stack = createNativeStackNavigator();
const Tab = createBottomTabNavigator();
const Drawer = createDrawerNavigator();

function HomeStack() {
  // Stack permite ir de una pantalla a otra y volver atras.
  // Aqui se usa para pasar de Inicio a Detalle.
  return (
    <Stack.Navigator>
      <Stack.Screen name="Home" component={HomeScreen} options={{ title: 'Inicio' }} />
      <Stack.Screen name="Detalle" component={DetailScreen} />
    </Stack.Navigator>
  );
}

function BottomMenu() {
  // Bottom Tabs es el menu de abajo para cambiar entre secciones principales.
  return (
    <Tab.Navigator
      screenOptions={{
        tabBarActiveTintColor: '#2f7d63',
        tabBarInactiveTintColor: '#6f7f79',
        tabBarLabelStyle: {
          fontSize: 13,
          fontWeight: '700',
          paddingBottom: Platform.OS === 'ios' ? 4 : 6,
        },
        tabBarStyle: {
          backgroundColor: '#ffffff',
          borderTopColor: '#d9e4df',
          borderTopWidth: 1,
          height: Platform.OS === 'ios' ? 76 : 64,
          paddingTop: 8,
          paddingBottom: Platform.OS === 'ios' ? 18 : 8,
        },
        tabBarIconStyle: {
          display: 'none',
        },
      }}
    >
      <Tab.Screen name="Inicio" component={HomeStack} options={{ headerShown: false }} />
      <Tab.Screen name="Calculadora" component={CalculatorScreen} />
      <Tab.Screen name="Lista" component={LoadingListScreen} />
    </Tab.Navigator>
  );
}

function AppNavigator() {
  return (
    // NavigationContainer envuelve toda la navegacion de la app.
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

export default AppNavigator;
