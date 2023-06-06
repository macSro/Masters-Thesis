import 'package:flutter/material.dart';
import 'package:flutter_animations/growing_logo.dart';
import 'package:flutter_animations/rotating_logo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Research scenario 2'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: ListView(
        children: const [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RotatingLogo(duration: Duration(seconds: 1)),
              RotatingLogo(duration: Duration(seconds: 1)),
              RotatingLogo(duration: Duration(seconds: 1)),
              RotatingLogo(duration: Duration(seconds: 1)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RotatingLogo(
                duration: Duration(milliseconds: 200),
                inverse: true,
              ),
              RotatingLogo(
                duration: Duration(milliseconds: 200),
                inverse: true,
              ),
              RotatingLogo(
                duration: Duration(milliseconds: 200),
                inverse: true,
              ),
              RotatingLogo(
                duration: Duration(milliseconds: 200),
                inverse: true,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RotatingLogo(duration: Duration(milliseconds: 500)),
              RotatingLogo(duration: Duration(milliseconds: 500)),
              RotatingLogo(duration: Duration(milliseconds: 500)),
              RotatingLogo(duration: Duration(milliseconds: 500)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RotatingLogo(
                duration: Duration(milliseconds: 500),
                inverse: true,
              ),
              RotatingLogo(
                duration: Duration(milliseconds: 500),
                inverse: true,
              ),
              RotatingLogo(
                duration: Duration(milliseconds: 500),
                inverse: true,
              ),
              RotatingLogo(
                duration: Duration(milliseconds: 500),
                inverse: true,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RotatingLogo(
                duration: Duration(milliseconds: 500),
                reverse: true,
              ),
              RotatingLogo(
                duration: Duration(milliseconds: 250),
                reverse: true,
              ),
              RotatingLogo(
                duration: Duration(milliseconds: 1000),
                reverse: true,
              ),
              RotatingLogo(
                duration: Duration(milliseconds: 750),
                reverse: true,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GrowingLogo(
                size: 150,
                duration: Duration(milliseconds: 1000),
              ),
              GrowingLogo(
                size: 90,
                duration: Duration(milliseconds: 700),
              ),
              GrowingLogo(
                size: 130,
                duration: Duration(milliseconds: 400),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GrowingLogo(
                size: 180,
                duration: Duration(milliseconds: 250),
              ),
              GrowingLogo(
                size: 100,
                duration: Duration(milliseconds: 550),
              ),
              GrowingLogo(
                size: 60,
                duration: Duration(milliseconds: 850),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
