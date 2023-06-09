import React, { useState } from "react";
import { SafeAreaView, View, Text } from "react-native";
import { TextInput } from '@react-native-material/core';
import DropDownPicker from "react-native-dropdown-picker";

const FormPage = () => {
    const [open, setOpen] = useState(false);
    const [value, setValue] = useState('empty');
    const [items, setItems] = useState([
        { label: '', value: 'empty' },
        { label: 'Option 1', value: 'option1' },
        { label: 'Option 2', value: 'option2' },
        { label: 'Option 3', value: 'option3' }
    ]);

    return (
        <SafeAreaView>
            <View style={{ alignItems: 'center' }}>
                <Text style={{ fontSize: 32, fontWeight: 'bold', marginBottom: 16 }}>Research scenario #4</Text>
            </View>

            <TextField label='Text field 1 (Regular)' />
            <TextField label='Text field 2 (Multiline)' multiline={true} numberOfLines={3} />
            <TextField label='Text field 3 (Password)' secure={true} />
            <TextField label='Text field 4 (Phone)' inputMode='tel' />
            <TextField label='Text field 5 (E-mail)' inputMode='email' />
            <View style={{ alignItems: 'center' }}>
                <DropDownPicker
                    style={{ width: 200 }}
                    containerStyle={{ width: 200 }}
                    open={open}
                    value={value}
                    items={items}
                    setOpen={setOpen}
                    setValue={setValue}
                    setItems={setItems}
                />
            </View>

        </SafeAreaView>
    );
}

const TextField = ({ label, inputMode, multiline, secure }) => {
    const [text, setText] = useState('');

    return (
        <TextInput
            style={{ marginHorizontal: 16, marginVertical: 8 }}
            variant="outlined"
            label={label}
            inputMode={inputMode}
            multiline={multiline}
            secureTextEntry={secure}
            value={text}
            onChangeText={setText} />
    );
}

export default FormPage;