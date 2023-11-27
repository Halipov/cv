import 'package:cv/features/todo/domain/persistence/sqflite/repository/sqflite_repository.dart';
import 'package:cv/features/todo/domain/persistence/sqflite/sqflite_db_provider.dart';
import 'package:cv/features/todo/domain/repository/persistence_repository.dart';

abstract interface class ITodoRepositoryStorage {
  IPersistenceTodoRepository get persistenceTodoRepository;
}

interface class TodoRepositoryStorage implements ITodoRepositoryStorage {
  final SqfliteService _sqfliteService;
  IPersistenceTodoRepository? _persistenceTodoRepository;

  TodoRepositoryStorage({required SqfliteService sqfliteService}) : _sqfliteService = sqfliteService;

  @override
  IPersistenceTodoRepository get persistenceTodoRepository => _persistenceTodoRepository ??= SqfliteRepository(
        service: _sqfliteService,
      );
}
