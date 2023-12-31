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
    AuthRoute.name: (routeData) {
      final args =
          routeData.argsAs<AuthRouteArgs>(orElse: () => const AuthRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AuthScreen(key: args.key),
      );
    },
    CreateTaskRoute.name: (routeData) {
      final args = routeData.argsAs<CreateTaskRouteArgs>(
          orElse: () => const CreateTaskRouteArgs());
      return AutoRoutePage<Todo>(
        routeData: routeData,
        child: CreateTaskScreen(key: args.key),
      );
    },
    TodoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const TodoScreen()),
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
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AuthRoute.name,
          args: AuthRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<AuthRouteArgs> page = PageInfo<AuthRouteArgs>(name);
}

class AuthRouteArgs {
  const AuthRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key}';
  }
}

/// generated route for
/// [CreateTaskScreen]
class CreateTaskRoute extends PageRouteInfo<CreateTaskRouteArgs> {
  CreateTaskRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CreateTaskRoute.name,
          args: CreateTaskRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CreateTaskRoute';

  static const PageInfo<CreateTaskRouteArgs> page =
      PageInfo<CreateTaskRouteArgs>(name);
}

class CreateTaskRouteArgs {
  const CreateTaskRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CreateTaskRouteArgs{key: $key}';
  }
}

/// generated route for
/// [TodoScreen]
class TodoRoute extends PageRouteInfo<void> {
  const TodoRoute({List<PageRouteInfo>? children})
      : super(
          TodoRoute.name,
          initialChildren: children,
        );

  static const String name = 'TodoRoute';

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
