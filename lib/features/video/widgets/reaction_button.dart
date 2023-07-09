import 'package:flutter/material.dart';

class ReactionButton extends StatelessWidget {
  const ReactionButton({
    super.key,
    required this.text,
    required this.isActive,
    required this.onPressed,
    required this.iconData,
  });
  final String text;
  final bool isActive;
  final Function onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => onPressed(),
        child: Row(
          children: [
            Icon(
              iconData,
              color: isActive ? Colors.red : Colors.white,
            ),
            const SizedBox(width: 5),
            Text(text, style: Theme.of(context).textTheme.bodyLarge)
          ],
        ));
  }
}
