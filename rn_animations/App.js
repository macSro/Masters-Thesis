import React, { useState, useEffect } from 'react';
import { View, Text, StyleSheet, SafeAreaView, Animated, Easing, ScrollView } from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { StatusBar } from 'expo-status-bar';


const RotatingLogo = ({ duration, inverse, reverse }) => {
  const [animation] = useState(new Animated.Value(0));

  useEffect(() => {
    const animationConfig = {
      toValue: 1,
      duration: duration,
      easing: Easing.linear,
      useNativeDriver: true,
    };

    const reverseAnimationConfig = {
      toValue: 0,
      duration: duration,
      easing: Easing.linear,
      useNativeDriver: true,
    };

    const startAnimation = () => {
      Animated.timing(animation, animationConfig).start(() => {
        if (inverse) {
          Animated.timing(animation, reverseAnimationConfig).start(startAnimation);
        } else {
          animation.setValue(0); // Reset the animation to its initial value
          startAnimation();
        }
      });
    };

    startAnimation();

    return () => {
      animation.stopAnimation();
      animation.removeAllListeners();
    };
  }, []);

  const rotateInterpolation = animation.interpolate({
    inputRange: [0, 1],
    outputRange: [reverse ? '360deg' : '0deg', reverse ? '0deg' : '360deg'],
  });

  return (
    <View style={styles.logoContainer}>
      <Animated.View style={{ transform: [{ rotate: rotateInterpolation }] }}>
        <Ionicons name="rocket" size={50} color="black" />
      </Animated.View>
    </View>
  );
};

const GrowingLogo = ({ size, duration, reverse }) => {
  const [animation] = useState(new Animated.Value(0));

  useEffect(() => {
    const startAnimation = () => {
      Animated.timing(animation, {
        toValue: 1,
        duration: duration,
        easing: Easing.inOut(Easing.ease),
        useNativeDriver: false,
      }).start(() => {
        if (reverse) {
          // If reverse is true, reverse the animation back to 0
          Animated.timing(animation, {
            toValue: 0,
            duration: duration,
            easing: Easing.inOut(Easing.ease),
            useNativeDriver: false,
          }).start(startAnimation);
        } else {
          // If reverse is false, restart the animation from 0
          animation.setValue(0);
          startAnimation();
        }
      });
    };

    startAnimation();

    return () => {
      animation.stopAnimation();
      animation.removeAllListeners();
    };
  }, []);

  const scale = animation.interpolate({
    inputRange: [0, 1],
    outputRange: [0, size / 50],
    extrapolate: 'clamp',
  });

  return (
    <View style={styles.logoContainer}>
      <Animated.View style={{ transform: [{ scale }] }}>
        <Ionicons name="rocket" size={50} color="black" />
      </Animated.View>
    </View>
  );
};

const MyHomePage = () => {
  return (
    <SafeAreaView style={styles.container}>
      <StatusBar hidden={true}></StatusBar>
      <ScrollView contentContainerStyle={styles.scrollViewContent}>
        <Text style={styles.title}>Research scenario #2</Text>

        <View style={styles.row}>
          <RotatingLogo duration={1000} />
          <RotatingLogo duration={1000} />
          <RotatingLogo duration={1000} />
          <RotatingLogo duration={1000} />
        </View>

        <View style={styles.row}>
          <RotatingLogo duration={200} inverse={true} />
          <RotatingLogo duration={200} inverse={true} />
          <RotatingLogo duration={200} inverse={true} />
          <RotatingLogo duration={200} inverse={true} />
        </View>

        <View style={styles.row}>
          <RotatingLogo duration={300} />
          <RotatingLogo duration={600} />
          <RotatingLogo duration={900} />
          <RotatingLogo duration={1200} />
        </View>

        <View style={styles.row}>
          <RotatingLogo duration={500} inverse={true} reverse={true} />
          <RotatingLogo duration={500} inverse={true} reverse={true} />
          <RotatingLogo duration={500} inverse={true} reverse={true} />
          <RotatingLogo duration={500} inverse={true} reverse={true} />
        </View>

        <View style={styles.row}>
          <RotatingLogo duration={500} reverse={true} />
          <RotatingLogo duration={250} reverse={true} />
          <RotatingLogo duration={1000} reverse={true} />
          <RotatingLogo duration={750} reverse={true} />
        </View>

        <View style={[styles.row, { height: 130 }]}>
          <GrowingLogo size={150} duration={1000} />
          <GrowingLogo size={90} duration={700} />
          <GrowingLogo size={130} duration={400} />
        </View>

        <View style={[styles.row, { height: 160 }]}>
          <GrowingLogo size={180} duration={250} reverse={true} />
          <GrowingLogo size={60} duration={550} reverse={true} />
          <GrowingLogo size={100} duration={850} reverse={true} />
        </View>
      </ScrollView>
    </SafeAreaView>
  );
};


const styles = StyleSheet.create({
  container: {
    flex: 1
  },
  logoContainer: {
    alignItems: 'center',
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    textAlign: 'center',
    marginVertical: 16,
  },
  row: {
    flexDirection: 'row',
    justifyContent: 'space-evenly',
    alignItems: 'center',
    marginVertical: 10,
  },
  logoContainer: {
    margin: 5,
  },
});

export default MyHomePage;