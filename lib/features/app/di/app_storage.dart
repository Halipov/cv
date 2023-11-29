import 'package:cv/config/environment/environment.dart';
import 'package:cv/features/common/theme_service.dart';
import 'package:cv/features/navigation/router.dart';
import 'package:cv/features/todo/data/persistence/_persistence.dart';
import 'package:cv/features/todo/data/persistence/device_storage/enum/storage_type.dart';
import 'package:cv/persistence/storage/theme_storage/theme_storage.dart';
import 'package:cv/util/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

abstract class IAppStorage {
  Dio get dio;
  VoidCallback get applicationRebuilder;
  AppRouter get router;
  IThemeService get themeService;
  SqfliteService get sqfliteService;
  HiveService get hiveService;
  DeviceStorageService get deviceStorageService;
  Future<void> initTheme();
  Future<void> initDatabase();
}

class AppStorage implements IAppStorage {
  static const _themeByDefault = ThemeMode.system;

  late final Dio _dio;
  late final AppRouter _router;
  late final IThemeService _themeService;
  late final SqfliteService _sqfliteService;
  late final HiveService _hiveService;
  late final DeviceStorageService _deviceStorageService;

  @override
  late VoidCallback applicationRebuilder;

  @override
  Dio get dio => _dio;

  @override
  AppRouter get router => _router;

  @override
  IThemeService get themeService => _themeService;

  late IThemeModeStorage _themeModeStorage;

  AppStorage() {
    final additionalInterceptors = <Interceptor>[];
    _dio = _initDio(additionalInterceptors);
    _router = AppRouter.instance();
    _themeModeStorage = ThemeModeStorageImpl();
  }

  @override
  Future<void> initTheme() async {
    final theme = await ThemeModeStorageImpl().getThemeMode() ?? _themeByDefault;
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
          talker: talker,
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printResponseHeaders: true,
            printResponseMessage: false,
            printResponseData: false,
          ),
        ),
      );
    }

    return dio;
  }

  Future<void> _onThemeModeChanged() async {
    await _themeModeStorage.saveThemeMode(mode: _themeService.currentThemeMode);
  }

  @override
  SqfliteService get sqfliteService => _sqfliteService;

  @override
  Future<void> initDatabase() async {
    _sqfliteService = SqfliteService();
    _hiveService = HiveService();
    _deviceStorageService = DeviceStorageService(
      storageType: IosStorageType(
        iosStorageTypeEnum: IosStorageTypeEnum.applicationDocumentsDirectory,
      ),
    );
    await _sqfliteService.init();
    await _hiveService.init();
    await _deviceStorageService.init();
  }

  @override
  HiveService get hiveService => _hiveService;

  @override
  DeviceStorageService get deviceStorageService => _deviceStorageService;
}
