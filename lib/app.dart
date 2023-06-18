import 'package:flutter/material.dart';
import 'package:red_eyes_app/theme/theme.dart';
//views
import 'package:red_eyes_app/features/login/login.dart';
import 'package:red_eyes_app/features/home/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,
      routes: {
        "/login": (context) => const LoginScreen(),
        "/": (context) => const HomeScreen(),
      },
      initialRoute: "/",
    );
  }
}
