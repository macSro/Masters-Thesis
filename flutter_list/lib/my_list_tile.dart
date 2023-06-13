import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({super.key, required this.title, required this.onTap});

  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoListTile(title: Text(title), onTap: onTap)
        : ListTile(title: Text(title), onTap: onTap);
  }
}
