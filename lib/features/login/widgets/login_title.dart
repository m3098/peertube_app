import 'package:flutter/material.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "YOUR",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.apply(color: Theme.of(context).primaryColor)),
          TextSpan(
              text: " PLATFORM", style: Theme.of(context).textTheme.titleLarge),
        ])),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "YOUR",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.apply(color: Theme.of(context).primaryColor)),
          TextSpan(
              text: " RULES", style: Theme.of(context).textTheme.titleLarge),
        ])),
      ],
    );
  }
}
