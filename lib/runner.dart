import 'dart:async';

import 'package:cv/features/app/di/app_storage.dart';
import 'package:cv/firebase_options.dart';
import 'package:cv/util/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';

import 'features/app/app.dart';

/// App launch.
Future<void> run() async {
  _initLogger();

  await _runApp();
}

Future<void> _runApp() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      await _initFirebase();
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
    talker.handle,
  );
}

void _initLogger() {
  talker.debug('Talker started');
  FlutterError.onError = (details) => talker.handle(
        details.exception,
        details.stack,
      );
}

Future<void> _initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.authStateChanges().listen((user) {
    if (user == null) {
      talker.info('User is currently signed out!');
    } else {
      talker.info('User is signed in!');
    }
  });
  // final analytics = FirebaseAnalytics.instance;
  // final firebaseMessaging = FirebaseInAppMessaging.instance;
  // await firebaseMessaging.setAutomaticDataCollectionEnabled(true);
}
