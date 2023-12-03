import 'package:cv/features/common/widgets/di_scope/scope.dart';
import 'package:cv/features/weather/di/weather_service_storage.dart';
import 'package:flutter/material.dart';

class WeatherServiceScope extends Scope {
  const WeatherServiceScope({
    required this.create,
    required super.child,
    super.key,
  });
  static const DelegateAccess<_RepositoryScopeDelegate> _delegateOf =
      Scope.delegateOf<WeatherServiceScope, _RepositoryScopeDelegate>;

  final IWeatherServiceStorage Function(BuildContext context) create;

  static IWeatherServiceStorage of(BuildContext context) =>
      _delegateOf(context).storage;

  @override
  ScopeDelegate<WeatherServiceScope> createDelegate() =>
      _RepositoryScopeDelegate();
}

class _RepositoryScopeDelegate extends ScopeDelegate<WeatherServiceScope> {
  late final IWeatherServiceStorage storage = widget.create(context);
}
