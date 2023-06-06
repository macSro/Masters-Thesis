import 'package:flutter/material.dart';
import 'package:flutter_ui/external_page.dart';

class ControlsPage extends StatefulWidget {
  const ControlsPage({super.key});

  @override
  State<ControlsPage> createState() => _ControlsPageState();
}

class _ControlsPageState extends State<ControlsPage> {
  bool _switch1Value = false;
  bool _switch2Value = false;
  bool? _checkbox1Value;
  bool? _checkbox2Value;
  bool? _checkbox3Value;
  bool? _checkbox4Value;
  int _segmentedButtonValue = 0;
  double _sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FilledButton(
            child: const Text('Navigate to a different page'),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ExternalPage(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Switch'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Switch(
                value: _switch1Value,
                onChanged: (value) => setState(() {
                  _switch1Value = value;
                }),
              ),
              const SizedBox(width: 16),
              Switch(
                value: _switch2Value,
                onChanged: (value) => setState(() {
                  _switch2Value = value;
                }),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Checkbox'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                tristate: true,
                value: _checkbox1Value,
                onChanged: (value) => setState(() {
                  _checkbox1Value = value;
                }),
              ),
              Checkbox(
                tristate: true,
                value: _checkbox2Value,
                onChanged: (value) => setState(() {
                  _checkbox2Value = value;
                }),
              ),
              Checkbox(
                tristate: true,
                value: _checkbox3Value,
                onChanged: (value) => setState(() {
                  _checkbox3Value = value;
                }),
              ),
              Checkbox(
                tristate: true,
                value: _checkbox4Value,
                onChanged: (value) => setState(() {
                  _checkbox4Value = value;
                }),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Segmented button'),
          const SizedBox(height: 8),
          SegmentedButton(
            segments: const [
              ButtonSegment(value: 0, label: Text('Option 1')),
              ButtonSegment(value: 1, label: Text('Option 2')),
            ],
            showSelectedIcon: true,
            selected: {_segmentedButtonValue},
            onSelectionChanged: (selection) => setState(() {
              _segmentedButtonValue = selection.first;
            }),
          ),
          const SizedBox(height: 16),
          const Text('Slider'),
          Slider(
            value: _sliderValue,
            onChanged: (value) => setState(() {
              _sliderValue = value;
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Popup menu'),
              PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(child: Text('Option 1')),
                  const PopupMenuItem(child: Text('Option 2')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
