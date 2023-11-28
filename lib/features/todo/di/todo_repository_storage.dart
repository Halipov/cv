import 'package:cv/features/todo/domain/persistence/device_storage/device_storage_service.dart';
import 'package:cv/features/todo/domain/persistence/device_storage/repository/device_storage_repository.dart';
import 'package:cv/features/todo/domain/persistence/hive/hive_service.dart';
import 'package:cv/features/todo/domain/persistence/hive/repository/hive_repository.dart';
import 'package:cv/features/todo/domain/persistence/sqflite/repository/sqflite_repository.dart';
import 'package:cv/features/todo/domain/persistence/sqflite/sqflite_service.dart';
import 'package:cv/features/todo/domain/repository/persistence_repository.dart';

abstract interface class ITodoRepositoryStorage {
  IPersistenceTodoRepository get hiveRepository;
  IPersistenceTodoRepository get sqliteRepository;
  IPersistenceTodoRepository get deviceStorageRepository;
}

interface class TodoRepositoryStorage implements ITodoRepositoryStorage {
  final SqfliteService _sqfliteService;
  final HiveService _hiveService;
  final DeviceStorageService _deviceStorageService;
  IPersistenceTodoRepository? _persistenceTodoRepository;

  TodoRepositoryStorage({
    required SqfliteService sqfliteService,
    required HiveService hiveService,
    required DeviceStorageService deviceStorageService,
  })  : _sqfliteService = sqfliteService,
        _deviceStorageService = deviceStorageService,
        _hiveService = hiveService;

  @override
  IPersistenceTodoRepository get hiveRepository => _persistenceTodoRepository ??= HiveRepository(
        hiveService: _hiveService,
      );
  @override
  IPersistenceTodoRepository get sqliteRepository => _persistenceTodoRepository ??= SqfliteRepository(
        sqfliteService: _sqfliteService,
      );

  @override
  IPersistenceTodoRepository get deviceStorageRepository => _persistenceTodoRepository ??= DeviceStorageRepository(
        deviceStorageService: _deviceStorageService,
      );
}
