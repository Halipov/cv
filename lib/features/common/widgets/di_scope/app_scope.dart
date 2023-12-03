import 'package:cv/features/app/di/app_storage.dart';
import 'package:flutter/material.dart';

import 'scope.dart';

class AppScope extends Scope {
  const AppScope({
    required this.create,
    required super.child,
    super.key,
  });

  static const DelegateAccess<_RepositoryScopeDelegate> _delegateOf =
      Scope.delegateOf<AppScope, _RepositoryScopeDelegate>;

  final IAppStorage Function(BuildContext context) create;

  static IAppStorage of(BuildContext context) => _delegateOf(context).storage;

  @override
  ScopeDelegate<AppScope> createDelegate() => _RepositoryScopeDelegate();
}

class _RepositoryScopeDelegate extends ScopeDelegate<AppScope> {
  late final IAppStorage storage = widget.create(context);
}
