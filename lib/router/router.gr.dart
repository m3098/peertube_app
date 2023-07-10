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
      final args = routeData.argsAs<VideoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VideoScreen(
          key: args.key,
          videoCardModel: args.videoCardModel,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchScreen(),
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
    required PeertubeVideoFullModel videoCardModel,
    List<PageRouteInfo>? children,
  }) : super(
          VideoRoute.name,
          args: VideoRouteArgs(
            key: key,
            videoCardModel: videoCardModel,
          ),
          initialChildren: children,
        );

  static const String name = 'VideoRoute';

  static const PageInfo<VideoRouteArgs> page = PageInfo<VideoRouteArgs>(name);
}

class VideoRouteArgs {
  const VideoRouteArgs({
    this.key,
    required this.videoCardModel,
  });

  final Key? key;

  final PeertubeVideoFullModel videoCardModel;

  @override
  String toString() {
    return 'VideoRouteArgs{key: $key, videoCardModel: $videoCardModel}';
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

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
