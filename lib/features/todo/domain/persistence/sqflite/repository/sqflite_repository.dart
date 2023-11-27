import 'package:cv/features/todo/domain/model/todo.dart';
import 'package:cv/features/todo/domain/persistence/sqflite/model/_model.dart';
import 'package:cv/features/todo/domain/persistence/sqflite/sqflite_db_provider.dart';
import 'package:cv/features/todo/domain/repository/persistence_repository.dart';
import 'package:cv/features/todo/enum/priority_enum.dart';

class SqfliteRepository implements IPersistenceTodoRepository {
  final SqfliteService _service;

  SqfliteRepository({required SqfliteService service}) : _service = service;
  @override
  Future<void> deleteTodo(Todo todo) async {
    try {
      await _service.deleteTodo(
        ToDoDto(
          id: todo.id,
          name: todo.name,
          description: todo.description,
          priorityId: todo.priorityEnum.toIndex(),
          isDone: todo.isDone ? 1 : 0,
        ),
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<Todo>> fetchAllToDo() async {
    try {
      final result = await _service.getAllClients();
      final entities = result
          .map(
            (e) => Todo(
              id: e.id,
              name: e.name,
              description: e.description,
              priorityEnum: PriorityEnum.fromIndex(e.priorityId),
              isDone: e.isDone == 0 ? false : true,
            ),
          )
          .toList();
      return entities;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> insertTodo(Todo todo) async {
    try {
      _service.insertToDo(
        ToDoDto(
          id: todo.id,
          name: todo.name,
          description: todo.description,
          priorityId: todo.priorityEnum.toIndex(),
          isDone: todo.isDone ? 1 : 0,
        ),
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    try {
      _service.updateToDo(
        ToDoDto(
          id: todo.id,
          name: todo.name,
          description: todo.description,
          priorityId: todo.priorityEnum.toIndex(),
          isDone: todo.isDone ? 1 : 0,
        ),
      );
    } catch (_) {
      rethrow;
    }
  }
}
