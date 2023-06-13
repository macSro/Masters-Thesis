import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file/my_button.dart';
import 'package:flutter_file/my_scaffold.dart';
import 'package:flutter_file/text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        cupertinoOverrideTheme: const CupertinoThemeData(
          primaryColor: CupertinoColors.systemBlue,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ImagePicker _imagePicker = ImagePicker();

  final List<XFile> _pickedImages = [];

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: 'Research scenario #3',
      child: Column(
        children: [
          MyButton(
            label: 'Save a 20MB text file',
            onPressed: () => _saveFile(context),
          ),
          MyButton(
            label: 'Pick images from the library',
            onPressed: () => _pickImages(),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: _pickedImages.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.file(
                    File(_pickedImages[index].path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _saveFile(context) async {
    final path = (await getApplicationDocumentsDirectory()).path;
    final file = File('$path/savedFile.txt');
    await file.writeAsString(longText);
    showCupertinoDialog(
      context: context,
      builder: (context) => Platform.isIOS
          ? CupertinoAlertDialog(
              title: const Text('File saved.'),
              actions: [
                CupertinoDialogAction(
                  child: const Text('Close'),
                  onPressed: () => Navigator.of(context).pop(),
                )
              ],
            )
          : AlertDialog(
              title: const Text('File saved.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Close'),
                )
              ],
            ),
    );
  }

  void _pickImages() async {
    final images = await _imagePicker.pickMultiImage();
    if (images.isNotEmpty) {
      _pickedImages.addAll(images);
      setState(() {});
    }
  }
}
