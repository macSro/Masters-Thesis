import React from "react";
import { SafeAreaView, Text } from "react-native";

const ExternalPage = () => {
    return (
        <SafeAreaView style={{ justifyContent: 'center', alignItems: 'center', flex: 1 }}>
            <Text style={{ fontSize: 24 }}>ExternalPage</Text>
        </SafeAreaView>
    );
}

export default ExternalPage;