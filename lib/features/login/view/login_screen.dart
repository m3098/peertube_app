import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:red_eyes_app/features/login/widgets/widgets.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: ListView(
        children: const [
          SizedBox(height: 50),
          SizedBox(
            height: 100.0,
            width: 200,
            child: RiveAnimation.asset(
              "assets/animations/eye.riv",
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 25),
          LoginTitle(),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 25,
          ),
          LoginForm(),
          SizedBox(
            height: 23,
          ),
          LoginButtons()
        ],
      ),
    );
  }
}
