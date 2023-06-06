import 'package:flutter/material.dart';

class GrowingLogo extends StatefulWidget {
  const GrowingLogo(
      {super.key,
      required this.size,
      required this.duration,
      this.reverse = false});

  final double size;
  final Duration duration;
  final bool reverse;

  @override
  State<GrowingLogo> createState() => _GrowingLogoState();
}

class _GrowingLogoState extends State<GrowingLogo>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: widget.size).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: widget.reverse);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: animation.value,
      width: animation.value,
      child: const FlutterLogo(),
    );
  }
}
