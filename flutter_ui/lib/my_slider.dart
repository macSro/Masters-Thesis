import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySlider extends StatelessWidget {
  const MySlider({super.key, required this.value, required this.onChanged});

  final double value;
  final void Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoSlider(
            value: value,
            onChanged: onChanged,
          )
        : Slider(
            value: value,
            onChanged: onChanged,
          );
  }
}
