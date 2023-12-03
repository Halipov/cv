import 'package:cv/features/todo/data/persistence/_persistence.dart';
import 'package:cv/features/todo/data/remote/firestore/repository/firestore_repository.dart';
import 'package:cv/features/todo/domain/repository/todo_repository.dart';

abstract interface class ITodoRepositoryStorage {
  ITodoRepository get hiveRepository;
  ITodoRepository get sqliteRepository;
  ITodoRepository get deviceRepository;
  ITodoRepository get firestoreTodoRepository;
}

interface class TodoRepositoryStorage implements ITodoRepositoryStorage {
  TodoRepositoryStorage({
    required SqfliteService sqfliteService,
    required HiveService hiveService,
    required DeviceStorageService deviceStorageService,
  })  : _sqfliteService = sqfliteService,
        _deviceStorageService = deviceStorageService,
        _hiveService = hiveService;
  final SqfliteService _sqfliteService;
  final HiveService _hiveService;
  final DeviceStorageService _deviceStorageService;
  ITodoRepository? _todoRepository;

  @override
  ITodoRepository get hiveRepository => _todoRepository ??= HiveRepository(
        hiveService: _hiveService,
      );
  @override
  ITodoRepository get sqliteRepository => _todoRepository ??= SqfliteRepository(
        sqfliteService: _sqfliteService,
      );

  @override
  ITodoRepository get deviceRepository =>
      _todoRepository ??= DeviceStorageRepository(
        deviceService: _deviceStorageService,
      );

  @override
  ITodoRepository get firestoreTodoRepository =>
      _todoRepository ??= FirestoreTodoRepository();
}
