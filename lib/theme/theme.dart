import 'package:flutter/material.dart';

class AppTheme {
  static final darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.red,
      scaffoldBackgroundColor: Colors.black,
      cardColor: Colors.black,
      dividerColor: Colors.red,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300,
          fontSize: 20.0,
          letterSpacing: 0.15,
        ),
        titleMedium: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300,
          fontSize: 16.0,
          letterSpacing: 0.15,
        ),
        titleSmall: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300,
          fontSize: 20.0,
        ),
        bodyLarge: TextStyle(
          color: Color(0xDEFFFFFF),
          fontWeight: FontWeight.w200,
          fontSize: 14.0,
          letterSpacing: 0.5,
        ),
        bodyMedium: TextStyle(
          color: Color(0x99FFFFFF),
          fontWeight: FontWeight.w200,
          fontSize: 14.0,
          letterSpacing: 0.25,
        ),
        bodySmall: TextStyle(
          color: Color(0x61FFFFFF),
          fontWeight: FontWeight.w200,
          fontSize: 12.0,
          letterSpacing: 0.4,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.red),
        helperStyle: TextStyle(color: Colors.red),
        prefixIconColor: Colors.red,
        suffixIconColor: Colors.red,
        errorStyle: TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
        alignLabelWithHint: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Colors.white),
        ),
        labelStyle: TextStyle(color: Colors.red),
      ),
      textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.red),
      appBarTheme: const AppBarTheme());
}
