import 'package:flutter/material.dart';
import 'package:red_eyes_app/screens/home_screen.dart';
import 'package:red_eyes_app/screens/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.black, // Тут указываем нужный цвет фона по умолчанию
          ),
          primaryColor: Colors.red,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black),
      routes: {
        "/": (context) => const LoginScreen(),
        "/home": (context) => const HomeScreen(),
      },
      initialRoute: "/",
    );
  }
}
