import 'package:auto_route/auto_route.dart';
import 'package:cv/features/home/screens/home_screen.dart';
import 'package:cv/features/weather/ui/weather_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'ScreenWidget|Screen,Route',
)
class AppRouter extends _$AppRouter {
  static final AppRouter _router = AppRouter._();

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          path: '/home',
          page: HomeRoute.page,
        ),
        AutoRoute(
          path: '/weather',
          page: WeatherRoute.page,
        )
      ];

  AppRouter._();

  factory AppRouter.instance() => _router;
}
