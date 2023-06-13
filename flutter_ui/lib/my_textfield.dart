import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.label,
    this.keyboardType,
    this.obscureText,
    this.multiline,
  });

  final String label;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? multiline;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextField(
            placeholder: label,
            keyboardType: keyboardType,
            obscureText: obscureText ?? false,
            maxLines: multiline ?? false ? 5 : 1,
            minLines: 1,
          )
        : TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: Text(label),
            ),
            keyboardType: keyboardType,
            obscureText: obscureText ?? false,
            maxLines: multiline ?? false ? 5 : 1,
            minLines: 1,
          );
  }
}
