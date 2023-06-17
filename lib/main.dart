import 'package:flutter/material.dart';

import 'layouts/auth_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color.fromARGB(
              255, 255, 0, 0), // устанавливаем красный цвет для основного цвета
          secondaryHeaderColor:
              Colors.black, // устанавливаем черный цвет для акцентного цвета
          scaffoldBackgroundColor:
              Colors.black, // устанавливаем черный цвет для фона Scaffold
          brightness: Brightness.dark, // задаем темный режим
        ),
        home: const AuthLayout());
  }
}
