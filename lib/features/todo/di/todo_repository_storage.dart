import 'package:cv/features/todo/data/persistence/_persistence.dart';
import 'package:cv/features/todo/data/remote/firestore/repository/firestore_repository.dart';
import 'package:cv/features/todo/domain/repository/todo_repository.dart';

abstract interface class ITodoRepositoryStorage {
  ITodoRepository get hiveRepository;
  ITodoRepository get sqliteRepository;
  ITodoRepository get deviceStorageRepository;
  ITodoRepository get firestoreTodoRepository;
}

interface class TodoRepositoryStorage implements ITodoRepositoryStorage {
  final SqfliteService _sqfliteService;
  final HiveService _hiveService;
  final DeviceStorageService _deviceStorageService;
  ITodoRepository? _persistenceTodoRepository;

  TodoRepositoryStorage({
    required SqfliteService sqfliteService,
    required HiveService hiveService,
    required DeviceStorageService deviceStorageService,
  })  : _sqfliteService = sqfliteService,
        _deviceStorageService = deviceStorageService,
        _hiveService = hiveService;

  @override
  ITodoRepository get hiveRepository => _persistenceTodoRepository ??= HiveRepository(
        hiveService: _hiveService,
      );
  @override
  ITodoRepository get sqliteRepository => _persistenceTodoRepository ??= SqfliteRepository(
        sqfliteService: _sqfliteService,
      );

  @override
  ITodoRepository get deviceStorageRepository => _persistenceTodoRepository ??= DeviceStorageRepository(
        deviceStorageService: _deviceStorageService,
      );

  @override
  ITodoRepository get firestoreTodoRepository => _persistenceTodoRepository ??= FirestoreTodoRepository();
}
