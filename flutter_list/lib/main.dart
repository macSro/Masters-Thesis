import 'package:flutter/material.dart';
import 'package:flutter_list/my_list_tile.dart';
import 'package:flutter_list/my_scaffold.dart';
import 'package:flutter_list/my_switch.dart';

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
  bool _filter = false;

  @override
  Widget build(BuildContext context) {
    final listGen = List.generate(10000, (index) => index);

    final list = _filter
        ? listGen.where((element) => element % 6 == 0).toList()
        : listGen;

    return MyScaffold(
      title: 'Research scenario #1',
      child: Center(
        child: Column(
          children: [
            MySwitch(
              value: _filter,
              onChanged: (value) => setState(() {
                _filter = value;
              }),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) => MyListTile(
                  title: 'List item #${list[index]}',
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
