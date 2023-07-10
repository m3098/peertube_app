import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../features/features.dart';
import '../repositories/peertube/model/peertube_video_full_model.dart';
part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: "/", initial: true),
        AutoRoute(page: SearchRoute.page, path: "/search"),
        AutoRoute(page: LoginRoute.page, path: "/login"),
        AutoRoute(page: VideoRoute.page, path: "/video"),
      ];
}
