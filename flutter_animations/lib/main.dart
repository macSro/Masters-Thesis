import 'package:flutter/material.dart';
import 'package:flutter_animations/growing_logo.dart';
import 'package:flutter_animations/my_scaffold.dart';
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
      home: const MyHomePage(title: 'Research scenario #2'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: title,
      child: ListView(
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
              RotatingLogo(duration: Duration(milliseconds: 300)),
              RotatingLogo(duration: Duration(milliseconds: 600)),
              RotatingLogo(duration: Duration(milliseconds: 900)),
              RotatingLogo(duration: Duration(milliseconds: 1200)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RotatingLogo(
                duration: Duration(milliseconds: 500),
                inverse: true,
                reverse: true,
              ),
              RotatingLogo(
                duration: Duration(milliseconds: 500),
                inverse: true,
                reverse: true,
              ),
              RotatingLogo(
                duration: Duration(milliseconds: 500),
                inverse: true,
                reverse: true,
              ),
              RotatingLogo(
                duration: Duration(milliseconds: 500),
                inverse: true,
                reverse: true,
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
          SizedBox(
            height: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
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
          ),
          SizedBox(
            height: 190,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GrowingLogo(
                  size: 180,
                  duration: Duration(milliseconds: 250),
                  reverse: true,
                ),
                GrowingLogo(
                  size: 60,
                  duration: Duration(milliseconds: 550),
                  reverse: true,
                ),
                GrowingLogo(
                  size: 100,
                  duration: Duration(milliseconds: 850),
                  reverse: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
