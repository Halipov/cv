import 'dart:async';

import 'package:cv/features/app/di/app_storage.dart';
import 'package:cv/util/logger.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';

import 'features/app/app.dart';

/// App launch.
Future<void> run() async {
  _initLogger();
  _runApp();
}

void _runApp() {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      final scope = AppStorage();
      await scope.initTheme();
      await scope.initDatabase();
      Bloc.observer = TalkerBlocObserver(
        talker: talker,
      );
      runApp(
        App(
          appScope: scope,
        ),
      );
    },
    (exception, stack) => talker.handle(exception, stack),
  );
}

void _initLogger() {
  talker.debug('Talker started');
  FlutterError.onError = (details) => talker.handle(details.exception, details.stack);
}
