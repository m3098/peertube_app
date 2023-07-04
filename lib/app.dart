import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:red_eyes_app/features/home/bloc/home_bloc.dart';

import 'package:red_eyes_app/router/router.dart';
import 'package:red_eyes_app/theme/theme.dart';
//views

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: MaterialApp.router(
        title: 'RED EYE APP',
        theme: AppTheme.darkTheme,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
