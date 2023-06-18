import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/build_text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: _LoginWidget(),
      ),
    );
  }
}

class _LoginWidget extends StatelessWidget {
  const _LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Expanded(child: _HeaderWidget()),
        SizedBox(height: 25),
        Expanded(child: _LoginFormInputWidget()),
      ],
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 50,
        ),
        _EyeAnim(),
        SizedBox(height: 25),
        _HeaderText(
          strRed: "YOUR ",
          strWhite: "PLATFORM",
        ),
        _HeaderText(
          strRed: "YOUR ",
          strWhite: "RULES",
        ),
      ],
    );
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText({
    super.key,
    required this.strRed,
    required this.strWhite,
  });

  final String strRed;
  final String strWhite;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$strRed',
            style: const TextStyle(
                color: Colors.red, fontWeight: FontWeight.w200, fontSize: 24),
          ),
          TextSpan(
            text: '$strWhite',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w200, fontSize: 24),
          ),
        ],
      ),
    );
  }
}

class _EyeAnim extends StatelessWidget {
  const _EyeAnim({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100.0,
      width: 200,
      child: RiveAnimation.asset(
        "assets/animations/eye.riv",
        fit: BoxFit.cover,
      ),
    );
  }
}

class _LoginFormInputWidget extends StatelessWidget {
  _LoginFormInputWidget({super.key});
  final _hostController = TextEditingController();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _loggingIn = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildTextFieldWidget(
          controller: _hostController,
          hintText: 'Host',
          obscureText: false,
        ),
        const SizedBox(height: 10),
        BuildTextFieldWidget(
          controller: _loginController,
          hintText: 'Login',
          obscureText: false,
        ),
        const SizedBox(height: 10),
        BuildTextFieldWidget(
          controller: _passwordController,
          hintText: 'Password',
          obscureText: true,
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () async {
                const url = "https://joinpeertube.org/";
                if (await canLaunch(url)) {
                  await launch(url);
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
            SizedBox(width: 20),
            TextButton(
              onPressed: () {
                // действие по нажатию кнопки Sign in
              },
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: Text('Sign in',
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).scaffoldBackgroundColor)),
            ),
          ],
        )
      ],
    );
  }
}
