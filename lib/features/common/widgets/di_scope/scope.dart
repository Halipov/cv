import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

typedef DelegateAccess<D extends ScopeDelegate> = D Function(
  BuildContext, {
  bool listen,
});

abstract class Scope extends StatefulWidget {
  const Scope({super.key, required Widget child}) : _child = child;
  final Widget _child;

  static D delegateOf<S extends Scope, D extends ScopeDelegate<S>>(
    BuildContext context, {
    bool listen = false,
  }) {
    final scope = listen
        ? context.dependOnInheritedWidgetOfExactType<_InheritedScope<S>>()
        : context
            .getElementForInheritedWidgetOfExactType<_InheritedScope<S>>()
            ?.widget as _InheritedScope<S>?;
    assert(
      scope != null,
      'Unable to locate $D of $S. Either it was not declared as an ancestor '
      'of the widget that has tried to access it, or BuildContext does not '
      'contain its instance.',
    );

    // ignore: avoid-non-null-assertion
    return scope!.delegate as D;
  }

  ScopeDelegate<Scope> createDelegate();

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => createDelegate();
}

abstract class ScopeDelegate<S extends Scope> extends State<S> {
  List<Object?> get keys => const [];

  S get scope => widget;

  Widget buildScoping(BuildContext context, Widget child) => child;

  @override
  Widget build(BuildContext context) => _InheritedScope<S>(
        delegate: this,
        child: buildScoping(context, widget._child),
      );
}

class _InheritedScope<S extends Scope> extends InheritedWidget {
  _InheritedScope({
    super.key,
    required this.delegate,
    required super.child,
  }) : keys = delegate.keys;
  final List<Object?> keys;
  final ScopeDelegate<Scope> delegate;

  @override
  bool updateShouldNotify(
    _InheritedScope<S> oldWidget,
  ) =>
      !const DeepCollectionEquality().equals(
        keys,
        oldWidget.keys,
      );
}
