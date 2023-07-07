import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/anim_loading_widget.dart';

class LoginButtons extends StatefulWidget {
  const LoginButtons({super.key});

  @override
  State<LoginButtons> createState() => _LoginButtonsState();
}

class _LoginButtonsState extends State<LoginButtons> {
  bool _isLoading = false;

  void _startLoading() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 10)).then((_) {
      setState(() {
        _isLoading = false;
        Navigator.pop(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: AnimLoadingWidget())
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () async {
                  const url = "https://joinpeertube.org/";
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
                child: Text('Sign up',
                    style: TextStyle(
                        fontSize: 16, color: Theme.of(context).primaryColor)),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () async {
                  _startLoading();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: Text('Sign in',
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).scaffoldBackgroundColor)),
              ),
            ],
          );
  }
}
