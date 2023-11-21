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
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    WeatherRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const WeatherScreen()),
      );
    },
    TodayTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TodayPage(),
      );
    },
    TommorowTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TommorowPage(),
      );
    },
    ForecastTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForecastPage(),
      );
    },
  };
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
/// [WeatherScreen]
class WeatherRoute extends PageRouteInfo<void> {
  const WeatherRoute({List<PageRouteInfo>? children})
      : super(
          WeatherRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeatherRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TodayPage]
class TodayTab extends PageRouteInfo<void> {
  const TodayTab({List<PageRouteInfo>? children})
      : super(
          TodayTab.name,
          initialChildren: children,
        );

  static const String name = 'TodayTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TommorowPage]
class TommorowTab extends PageRouteInfo<void> {
  const TommorowTab({List<PageRouteInfo>? children})
      : super(
          TommorowTab.name,
          initialChildren: children,
        );

  static const String name = 'TommorowTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ForecastPage]
class ForecastTab extends PageRouteInfo<void> {
  const ForecastTab({List<PageRouteInfo>? children})
      : super(
          ForecastTab.name,
          initialChildren: children,
        );

  static const String name = 'ForecastTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}
