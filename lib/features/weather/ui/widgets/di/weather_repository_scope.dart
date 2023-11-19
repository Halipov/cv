import 'package:cv/features/common/widgets/di_scope/scope.dart';
import 'package:cv/features/weather/di/weather_repository_storage.dart';
import 'package:flutter/material.dart';

class WeatherRepositoryScope extends Scope {
  static const DelegateAccess<_RepositoryScopeDelegate> _delegateOf =
      Scope.delegateOf<WeatherRepositoryScope, _RepositoryScopeDelegate>;

  final IWeatherRepositoryStorage Function(BuildContext context) create;

  const WeatherRepositoryScope({
    required this.create,
    required Widget child,
    Key? key,
  }) : super(child: child, key: key);

  static IWeatherRepositoryStorage of(BuildContext context) => _delegateOf(context).storage;

  @override
  ScopeDelegate<WeatherRepositoryScope> createDelegate() => _RepositoryScopeDelegate();
}

class _RepositoryScopeDelegate extends ScopeDelegate<WeatherRepositoryScope> {
  late final IWeatherRepositoryStorage storage = widget.create(context);
}
