import 'package:auto_route/auto_route.dart';
import 'package:cv/features/home/home_screen.dart';
import 'package:cv/features/weather/ui/pages/_pages.dart';
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
        AutoRoute(path: '/weather', page: WeatherRoute.page, children: [
          AutoRoute(
            path: 'forecastTab',
            page: ForecastTab.page,
          ),
          AutoRoute(
            path: 'todayTab',
            page: TodayTab.page,
          ),
          AutoRoute(
            path: 'tommorowTab',
            page: TommorowTab.page,
          ),
        ])
      ];

  AppRouter._();

  factory AppRouter.instance() => _router;
}
