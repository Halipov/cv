import 'package:cv/assets/themes/theme_data.dart';
import 'package:cv/features/navigation/router.dart';
import 'package:cv/util/logger.dart';
import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      /// Theme
      theme: AppThemeData.lightTheme,
      darkTheme: AppThemeData.darkTheme,

      /// Localization.
      locale: _localizations.first,
      supportedLocales: _localizations,

      ///Navigation.
      routeInformationParser: AppRouter.instance().defaultRouteParser(),
      routerDelegate: AppRouter.instance().delegate(
        navigatorObservers: () => [
          TalkerRouteObserver(talker),
        ],
      ),
    );
  }
}

const _localizations = [
  Locale('en', 'EN'),
];
