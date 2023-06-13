import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCheckbox extends StatelessWidget {
  const MyCheckbox({super.key, required this.value, required this.onChanged});

  final bool? value;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoCheckbox(
            value: value,
            onChanged: onChanged,
          )
        : Checkbox(
            value: value,
            onChanged: onChanged,
          );
  }
}
