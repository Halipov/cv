import 'package:cv/features/todo/domain/persistence/hive/hive_service.dart';
import 'package:cv/features/todo/domain/persistence/hive/repository/hive_repository.dart';
import 'package:cv/features/todo/domain/persistence/sqflite/repository/sqflite_repository.dart';
import 'package:cv/features/todo/domain/persistence/sqflite/sqflite_service.dart';
import 'package:cv/features/todo/domain/repository/persistence_repository.dart';

abstract interface class ITodoRepositoryStorage {
  IPersistenceTodoRepository get hiveRepository;
  IPersistenceTodoRepository get sqliteRepository;
}

interface class TodoRepositoryStorage implements ITodoRepositoryStorage {
  final SqfliteService _sqfliteService;
  final HiveService _hiveService;
  IPersistenceTodoRepository? _persistenceTodoRepository;

  TodoRepositoryStorage({
    required SqfliteService sqfliteService,
    required HiveService hiveService,
  })  : _sqfliteService = sqfliteService,
        _hiveService = hiveService;

  @override
  IPersistenceTodoRepository get hiveRepository => _persistenceTodoRepository ??= HiveRepository(
        hiveService: _hiveService,
      );
  @override
  IPersistenceTodoRepository get sqliteRepository => _persistenceTodoRepository ??= SqfliteRepository(
        sqfliteService: _sqfliteService,
      );
}
