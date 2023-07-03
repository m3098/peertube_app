import 'package:flutter/material.dart';
import 'package:red_eyes_app/features/video/view/video_screen.dart';
import 'package:red_eyes_app/router/router.dart';
import 'package:red_eyes_app/theme/theme.dart';
//views
import 'package:red_eyes_app/features/login/login.dart';
import 'package:red_eyes_app/features/home/home.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'RED EYE APP',
      theme: AppTheme.darkTheme,
      routerConfig: _appRouter.config(),
    );
  }
}
