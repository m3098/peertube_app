import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AnimLoadingWidget extends StatefulWidget {
  const AnimLoadingWidget({super.key});

  @override
  _AnimLoadingWidgetState createState() => _AnimLoadingWidgetState();
}

class _AnimLoadingWidgetState extends State<AnimLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = IntTween(begin: 0, end: 3).animate(_controller)
      ..addListener(() => setState(() {}));

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _generateText() => 'wait' + '.' * _animation.value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 30,
          child: RiveAnimation.asset(
            "assets/animations/wait.riv",
            fit: BoxFit.contain,
          ),
        ),
        Text(
          _generateText(),
          style: const TextStyle(
              color: Colors.red, fontWeight: FontWeight.w500, letterSpacing: 2),
        ),
      ],
    );
  }
}
