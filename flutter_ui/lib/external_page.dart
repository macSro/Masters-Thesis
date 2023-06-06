import 'package:flutter/material.dart';

class ExternalPage extends StatelessWidget {
  const ExternalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('External page'),
      ),
      body: const Placeholder(),
    );
  }
}
