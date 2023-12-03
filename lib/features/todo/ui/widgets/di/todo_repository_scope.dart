import 'package:cv/features/common/widgets/di_scope/scope.dart';
import 'package:cv/features/todo/di/todo_repository_storage.dart';
import 'package:flutter/material.dart';

class ToDoRepositoryScope extends Scope {
  const ToDoRepositoryScope({
    required this.create,
    required super.child,
    super.key,
  });
  static const DelegateAccess<_RepositoryScopeDelegate> _delegateOf =
      Scope.delegateOf<ToDoRepositoryScope, _RepositoryScopeDelegate>;

  final ITodoRepositoryStorage Function(BuildContext context) create;

  static ITodoRepositoryStorage of(BuildContext context) =>
      _delegateOf(context).storage;

  @override
  ScopeDelegate<ToDoRepositoryScope> createDelegate() =>
      _RepositoryScopeDelegate();
}

class _RepositoryScopeDelegate extends ScopeDelegate<ToDoRepositoryScope> {
  late final ITodoRepositoryStorage storage = widget.create(context);
}
