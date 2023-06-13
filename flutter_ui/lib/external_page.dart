import 'package:flutter/material.dart';
import 'package:flutter_ui/my_scaffold.dart';

class ExternalPage extends StatelessWidget {
  const ExternalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      title: 'External page',
      child: Center(
          child: Text(
        'External Page',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 32,
          color: Colors.black,
          inherit: false,
        ),
      )),
    );
  }
}
