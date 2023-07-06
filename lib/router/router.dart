import 'package:auto_route/auto_route.dart';
import '../features/features.dart';
part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: "/"),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: VideoRoute.page),
      ];
}
