// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    VideoRoute.name: (routeData) {
      final args = routeData.argsAs<VideoRouteArgs>(
          orElse: () => const VideoRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VideoScreen(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomeScreen(),
      );
    },
  };
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VideoScreen]
class VideoRoute extends PageRouteInfo<VideoRouteArgs> {
  VideoRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          VideoRoute.name,
          args: VideoRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'VideoRoute';

  static const PageInfo<VideoRouteArgs> page = PageInfo<VideoRouteArgs>(name);
}

class VideoRouteArgs {
  const VideoRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'VideoRouteArgs{key: $key}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
