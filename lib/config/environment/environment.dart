import 'package:cv/config/app_config.dart';
import 'package:cv/config/environment/build_type.dart';
import 'package:flutter/material.dart';

/// Environment configuration.
class Environment implements Listenable {
  static Environment? _instance;
  final BuildType _currentBuildType;

  AppConfig get config => _config.value;
  set config(AppConfig c) => _config.value = c;
  ValueNotifier<AppConfig> _config;

  bool get isDebug => _currentBuildType == BuildType.debug;
  bool get isRelease => _currentBuildType == BuildType.release;

  BuildType get buildType => _currentBuildType;

  Environment._(this._currentBuildType, AppConfig config)
      : _config = ValueNotifier<AppConfig>(config);

  factory Environment.instance() => _instance!;

  @override
  void addListener(VoidCallback listener) {
    _config.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _config.removeListener(listener);
  }

  static void init({
    required BuildType buildType,
    required AppConfig config,
  }) {
    _instance ??= Environment._(buildType, config);
  }
}
