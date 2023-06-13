import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/my_scaffold.dart';

import 'controls_page.dart';
import 'form_page.dart';

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
        cupertinoOverrideTheme: const CupertinoThemeData(
          primaryColor: CupertinoColors.systemBlue,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pageIndex = 0;

  final List<Widget> _pages = [
    const ControlsPage(),
    const FormPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MyTabScaffold(
      title: 'Research scenario #4',
      pageBuilder: (index) => Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: _pages.elementAt(index),
        ),
      ),
      navItems: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.check_circle_outline),
          label: 'Controls',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.text_format),
          label: 'Form',
        ),
      ],
      currentPageIndex: _pageIndex,
      onNavItemTap: (index) => setState(() {
        _pageIndex = index;
      }),
    );
  }
}
