import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(title),
            ),
            child: SafeArea(child: child),
          )
        : Scaffold(
            appBar: AppBar(title: Text(title)),
            body: SafeArea(child: child),
          );
  }
}
