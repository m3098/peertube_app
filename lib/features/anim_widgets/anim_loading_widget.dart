import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AnimLoadingWidget extends StatelessWidget {
  const AnimLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 30,
          child: RiveAnimation.asset(
            "assets/animations/wait.riv",
            fit: BoxFit.contain,
          ),
        ),
        Text(
          "wait...",
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.w500, letterSpacing: 2),
        ),
      ],
    );
  }
}
