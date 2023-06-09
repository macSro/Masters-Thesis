import React from "react";
import { Ionicons, MaterialIcons } from "@expo/vector-icons";

import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';

import ControlsPage from './controls_page';
import FormPage from './form_page';

const Tab = createBottomTabNavigator();

const HomePage = () => {
    return (
        <Tab.Navigator screenOptions={({ route }) => ({
            tabBarIcon: ({ color, size }) => {
                if (route.name === 'Controls') {
                    return <Ionicons name='checkmark-circle-outline' size={size} color={color} />
                }
                else if (route.name === 'Form') {
                    return <MaterialIcons name='text-format' size={size} color={color} />
                }
            },
            headerShown: false,
        })}>
            <Tab.Screen name="Controls" component={ControlsPage} />
            <Tab.Screen name="Form" component={FormPage} />
        </Tab.Navigator>
    );
}

export default HomePage;