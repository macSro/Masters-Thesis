import React, { useState } from 'react';
import { View, Text, Switch, FlatList, StyleSheet, SafeAreaView } from 'react-native';
import { StatusBar } from 'expo-status-bar';

const MyApp = () => {
  const [filter, setFilter] = useState(false);
  const listGen = Array.from({ length: 10000 }, (_, index) => index);
  const list = filter ? listGen.filter((element) => element % 6 === 0) : listGen;

  return (
    <SafeAreaView style={styles.container}>
      <StatusBar></StatusBar>
      <Text style={styles.title}>Research scenario #1</Text>
      <View style={styles.switchContainer}>
        <Switch value={filter} onValueChange={setFilter} />
      </View>
      <FlatList
        data={list}
        keyExtractor={(item) => item.toString()}
        renderItem={({ item }) => (
          <View style={styles.card}>
            <Text>List item #{item}</Text>
          </View>
        )}
      />
    </SafeAreaView>
  );
};

const MyHomePage = () => {
  return <MyApp />;
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  title: {
    fontSize: 18,
    fontWeight: 'bold',
    textAlign: 'center',
    marginVertical: 10,
  },
  switchContainer: {
    alignItems: 'center',
  },
  card: {
    backgroundColor: '#fff',
    padding: 10,
    marginVertical: 5,
    elevation: 3,
  },
});

export default MyHomePage;
