import 'package:flutter/material.dart';

class RotatingLogo extends StatefulWidget {
  const RotatingLogo({
    super.key,
    required this.duration,
    this.inverse = false,
    this.reverse = false,
  });

  final Duration duration;
  final bool inverse;
  final bool reverse;

  @override
  State<RotatingLogo> createState() => _RotatingLogoState();
}

class _RotatingLogoState extends State<RotatingLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: widget.reverse);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween<double>(
        begin: widget.inverse ? 1 : 0,
        end: widget.inverse ? 0 : 1,
      ).animate(controller),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 50,
        width: 50,
        child: const FlutterLogo(),
      ),
    );
  }
}
