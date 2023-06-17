import 'package:flutter/material.dart';

class AppProgressIndicatorWidget extends StatelessWidget {
  const AppProgressIndicatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.0,
      width: 24.0,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          Theme.of(context).primaryColor,
        ),
        strokeWidth: 2.0,
      ),
    );
  }
}
