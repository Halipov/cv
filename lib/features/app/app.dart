import 'package:cv/assets/themes/theme_data.dart';
import 'package:cv/features/app/di/app_storage.dart';
import 'package:cv/features/common/theme_service.dart';
import 'package:cv/features/common/widgets/di_scope/app_scope.dart';
import 'package:cv/util/logger.dart';
import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';

class App extends StatefulWidget {
  final AppStorage appScope;

  const App({
    super.key,
    required this.appScope,
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late IAppStorage _scope;
  late IThemeService _themeService;

  @override
  void initState() {
    _scope = widget.appScope..applicationRebuilder = _rebuildApplication;
    _themeService = _scope.themeService;

    super.initState();
  }

  void _rebuildApplication() {
    setState(() {
      _scope = widget.appScope..applicationRebuilder = _rebuildApplication;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScope(
      create: (context) => _scope,
      child: AnimatedBuilder(
        animation: _themeService,
        builder: (context, child) => MaterialApp.router(
          /// Theme
          theme: AppThemeData.lightTheme,
          darkTheme: AppThemeData.darkTheme,

          /// Localization.
          locale: _localizations.first,
          supportedLocales: _localizations,

          ///Navigation.
          routeInformationParser: _scope.router.defaultRouteParser(),
          routerDelegate: _scope.router.delegate(
            navigatorObservers: () => [
              TalkerRouteObserver(talker),
            ],
          ),
        ),
      ),
    );
  }
}

const _localizations = [
  Locale('en', 'EN'),
];
