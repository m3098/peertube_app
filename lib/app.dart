import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:red_eyes_app/features/home/bloc/home_bloc.dart';
import 'package:red_eyes_app/features/search/bloc/search_bloc.dart';

import 'package:red_eyes_app/router/router.dart';
import 'package:red_eyes_app/theme/theme.dart';

import 'features/video/bloc/video_bloc.dart';
//views

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
        BlocProvider<VideoBloc>(create: (context) => VideoBloc()),
        BlocProvider<SearchBloc>(create: (context) => SearchBloc()),
      ],
      child: MaterialApp.router(
        title: 'RED EYE APP',
        theme: AppTheme.darkTheme,
        routerConfig:
            _appRouter.config(navigatorObservers: () => [HeroController()]),
      ),
    );
  }
}
