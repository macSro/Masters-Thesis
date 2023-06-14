import React, { useState } from 'react';
import { View, Text, Switch, Button, SafeAreaView, StyleSheet, Platform } from 'react-native';
import CheckBox from 'expo-checkbox';
import SegmentedControl from '@react-native-segmented-control/segmented-control';
import Slider from '@react-native-community/slider';
import { StatusBar } from 'expo-status-bar';

const ControlsPage = ({ navigation }) => {
    const [segmentedButtonValue, setSegmentedButtonValue] = useState(0);
    const [sliderValue, setSliderValue] = useState(0);

    return (
        <SafeAreaView style={{ flex: 1, margin: 16 }}>
            <StatusBar hidden={true}></StatusBar>
            <View style={{ alignItems: 'center' }}>
                <Text style={{ fontSize: 24, fontWeight: 'bold', marginBottom: 16 }}>Research scenario #4</Text>

                <Button
                    title="Navigate to a different page"
                    onPress={() => { navigation.navigate('External'); }}
                />

                <Text style={styles.title}>Switch</Text>
                <MySwitch />
                <MySwitch />

                <Text style={styles.title}>Checkbox</Text>
                <View style={{ flexDirection: 'row' }}>
                    <Checkbox />
                    <Checkbox />
                    <Checkbox />
                    <Checkbox />
                </View>

                <Text style={styles.title}>Segmented button</Text>
                <View style={{ width: '100%' }}>
                    <SegmentedControl
                        values={['Option 1', 'Option 2']}
                        selectedIndex={segmentedButtonValue}
                        onChange={(event) => setSegmentedButtonValue(event.nativeEvent.selectedSegmentIndex)}
                    />
                </View>

                <Text style={styles.title}>Slider</Text>
                <View style={{ width: '100%' }}>
                    <Slider value={sliderValue} onValueChange={setSliderValue} />
                </View>
            </View>
        </SafeAreaView>
    );
}

const MySwitch = () => {
    const [toggled, setToggled] = useState(false);

    return (
        <Switch style={{ margin: Platform.OS === 'android' ? -8 : 8 }} value={toggled} onValueChange={setToggled} />
    );
}

const Checkbox = () => {
    const [selected, setSelected] = useState(false);

    return (
        <CheckBox style={styles.item} value={selected} onValueChange={setSelected} />
    );
}

const styles = StyleSheet.create({
    title: {
        marginTop: 16,
        marginBottom: 8,
    },
    item: {
        margin: 8
    }
})

export default ControlsPage;