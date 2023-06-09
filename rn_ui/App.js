import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';

import HomePage from './pages/home_page';
import ExternalPage from './pages/external_page';

const Stack = createNativeStackNavigator();

const MyApp = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName='Home'>
        <Stack.Screen options={{ headerShown: false }} name='Home' component={HomePage} />
        <Stack.Screen name='External' component={ExternalPage} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}

export default MyApp;