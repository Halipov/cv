import 'package:cv/features/todo/data/persistence/_persistence.dart';
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
