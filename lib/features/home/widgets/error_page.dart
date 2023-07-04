import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rive/rive.dart';

import '../bloc/home_bloc.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.callback, required this.errorText});
  final Function callback;
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(
            height: 250,
            child: RiveAnimation.asset("assets/animations/doomer.riv")),
        Text(
          "Oops! $errorText",
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 25),
        TextButton(
          onPressed: () => callback(),
          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
              side: BorderSide(color: Theme.of(context).primaryColor),
            ),
          ),
          child: Text('RE-TRY!',
              style: TextStyle(
                  fontSize: 16, color: Theme.of(context).primaryColor)),
        )
      ]),
    );
  }
}
