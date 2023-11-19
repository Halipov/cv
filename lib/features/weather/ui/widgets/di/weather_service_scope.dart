import 'package:cv/features/common/widgets/di_scope/scope.dart';
import 'package:cv/features/weather/di/weather_service_storage.dart';
import 'package:flutter/material.dart';

class WeatherServiceScope extends Scope {
  static const DelegateAccess<_RepositoryScopeDelegate> _delegateOf =
      Scope.delegateOf<WeatherServiceScope, _RepositoryScopeDelegate>;

  final IWeatherServiceStorage Function(BuildContext context) create;

  const WeatherServiceScope({
    required this.create,
    required Widget child,
    Key? key,
  }) : super(child: child, key: key);

  static IWeatherServiceStorage of(BuildContext context) => _delegateOf(context).storage;

  @override
  ScopeDelegate<WeatherServiceScope> createDelegate() => _RepositoryScopeDelegate();
}

class _RepositoryScopeDelegate extends ScopeDelegate<WeatherServiceScope> {
  late final IWeatherServiceStorage storage = widget.create(context);
}
