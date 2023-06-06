import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: const [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Text field 1 (Regular)'),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 5,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Text field 2 (Multiline)'),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Text field 3 (Password)'),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Text field 4 (Phone)'),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Text field 5 (E-mail)'),
            ),
          ),
          SizedBox(height: 16),
          Center(
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
        ],
      ),
    );
  }
}
