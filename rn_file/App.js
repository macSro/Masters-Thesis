import React, { useState, useEffect } from 'react';
import { SafeAreaView, ScrollView, View, Text, TouchableOpacity, Image, Dimensions, Button } from 'react-native';
import * as ImagePicker from 'expo-image-picker';
import * as FileSystem from 'expo-file-system';

const App = () => {
  const [pickedImages, setPickedImages] = useState([]);
  const [imageSize, setImageSize] = useState(0);
  const screenWidth = Dimensions.get('window').width;
  const marginSize = 8;
  const numImagesPerRow = 2;

  useEffect(() => {
    calculateImageSize();
  }, [screenWidth]);

  const calculateImageSize = () => {
    const totalMarginSize = (numImagesPerRow + 2) * marginSize;
    const imageSize = (screenWidth - totalMarginSize) / numImagesPerRow;
    setImageSize(imageSize);
  };

  const saveFile = async () => {
    const path = FileSystem.documentDirectory + 'savedFile.txt';
    const longText = "Your long text here";

    try {
      await FileSystem.writeAsStringAsync(path, longText);
      console.log('File saved.');
    } catch (error) {
      console.log('Error saving file:', error);
    }
  };

  const pickImages = async () => {
    const { status } = await ImagePicker.requestMediaLibraryPermissionsAsync();
    if (status !== 'granted') {
      console.log('Permission denied for accessing media library.');
      return;
    }

    const options = {
      mediaTypes: ImagePicker.MediaTypeOptions.Images,
      allowsMultipleSelection: true,
    };

    const result = await ImagePicker.launchImageLibraryAsync(options);
    if (!result.canceled) {
      const images = result.assets;
      setPickedImages((prevImages) => [...prevImages, ...images]);
    }
  };

  return (
    <SafeAreaView>
      <Text style={{ fontSize: 32, fontWeight: 'bold', textAlign: 'center', marginVertical: 20 }}>Research scenario #3</Text>
      <View style={{ alignItems: 'center', marginBottom: 16 }}>
        <Button onPress={saveFile} title='Save a 20MB text file' />
        <Button onPress={pickImages} title='Pick images from the library' />
      </View>
      <ScrollView style={{ height: '100%' }}>
        <View>
          <View style={{ flexDirection: 'row', flexWrap: 'wrap', margin: marginSize }}>
            {pickedImages.map((image, index) => (
              <Image
                key={index}
                source={{ uri: image.uri }}
                style={{ width: imageSize, height: imageSize, margin: marginSize / 2 }}
              />
            ))}
          </View>
        </View>
      </ScrollView>
    </SafeAreaView>
  );
};

export default App;
