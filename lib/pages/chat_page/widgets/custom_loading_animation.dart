import 'package:flutter/material.dart';

class CustomLoadingAnimation extends StatefulWidget {
  const CustomLoadingAnimation({super.key});

  @override
  State<CustomLoadingAnimation> createState() => _CustomLoadingAnimationState();
}

class _CustomLoadingAnimationState extends State<CustomLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..repeat();
    _scaleAnimation = Tween<double>(begin: 1.5, end: 0.5).animate(_controller)
      ..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.send,
      size: 24 * _scaleAnimation.value,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
