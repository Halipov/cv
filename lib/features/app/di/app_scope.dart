import 'package:cv/config/environment/environment.dart';
import 'package:cv/features/common/theme_service.dart';
import 'package:cv/features/navigation/router.dart';
import 'package:cv/persistence/storage/theme_storage/theme_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

abstract class IAppScope {
  Dio get dio;
  VoidCallback get applicationRebuilder;
  AppRouter get router;
  IThemeService get themeService;
  Future<void> initTheme();
}

class AppScope implements IAppScope {
  static const _themeByDefault = ThemeMode.system;

  late final Dio _dio;
  late final AppRouter _router;
  late final IThemeService _themeService;

  @override
  late VoidCallback applicationRebuilder;

  @override
  Dio get dio => _dio;

  @override
  AppRouter get router => _router;

  @override
  IThemeService get themeService => _themeService;

  late IThemeModeStorage _themeModeStorage;

  AppScope() {
    final additionalInterceptors = <Interceptor>[];
    _dio = _initDio(additionalInterceptors);
    _router = AppRouter.instance();
    _themeModeStorage = ThemeModeStorageImpl();
  }

  @override
  Future<void> initTheme() async {
    final theme =
        await ThemeModeStorageImpl().getThemeMode() ?? _themeByDefault;
    _themeService = ThemeServiceImpl(theme);
    _themeService.addListener(_onThemeModeChanged);
  }

  Dio _initDio(Iterable<Interceptor> additionalInterceptors) {
    const timeout = Duration(seconds: 30);

    final dio = Dio();

    dio.options
      ..baseUrl = Environment.instance().config.url
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;
    dio.interceptors.addAll(additionalInterceptors);

    if (Environment.instance().isDebug) {
      dio.interceptors.add(
        TalkerDioLogger(
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printResponseHeaders: true,
            printResponseMessage: true,
          ),
        ),
      );
    }

    return dio;
  }

  Future<void> _onThemeModeChanged() async {
    await _themeModeStorage.saveThemeMode(mode: _themeService.currentThemeMode);
  }
}
