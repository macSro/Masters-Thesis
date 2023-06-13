import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySwitch extends StatelessWidget {
  const MySwitch({super.key, required this.value, required this.onChanged});

  final bool value;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoSwitch(
            value: value,
            onChanged: onChanged,
          )
        : Switch(
            value: value,
            onChanged: onChanged,
          );
  }
}
