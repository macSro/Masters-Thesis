import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Research scenario #1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _filter = false;

  @override
  Widget build(BuildContext context) {
    final listGen = List.generate(10000, (index) => index);

    final list = _filter
        ? listGen.where((element) => element % 6 == 0).toList()
        : listGen;

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          children: [
            Switch(
              value: _filter,
              onChanged: (bool value) => setState(() {
                _filter = value;
              }),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text('List item #${list[index]}'),
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
