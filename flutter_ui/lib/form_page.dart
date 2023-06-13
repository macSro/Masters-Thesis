import 'package:flutter/material.dart';
import 'package:flutter_ui/my_textfield.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: const [
          MyTextField(label: 'Text field 1 (Regular)'),
          SizedBox(height: 16),
          MyTextField(
            label: 'Text field 2 (Multiline)',
            keyboardType: TextInputType.multiline,
            multiline: true,
          ),
          SizedBox(height: 16),
          MyTextField(
            label: 'Text field 3 (Password)',
            obscureText: true,
          ),
          SizedBox(height: 16),
          MyTextField(
            keyboardType: TextInputType.phone,
            label: 'Text field 4 (Phone)',
          ),
          SizedBox(height: 16),
          MyTextField(
            keyboardType: TextInputType.emailAddress,
            label: 'Text field 5 (E-mail)',
          ),
          SizedBox(height: 16),
          Center(
            child: Material(
              child: DropdownMenu(
                width: 210,
                label: Text('Dropdown field'),
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: 0, label: ''),
                  DropdownMenuEntry(value: 1, label: 'Option 1'),
                  DropdownMenuEntry(value: 2, label: 'Option 2'),
                  DropdownMenuEntry(value: 3, label: 'Option 3'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
