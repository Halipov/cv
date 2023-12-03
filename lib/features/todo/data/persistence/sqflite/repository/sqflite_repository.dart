import 'package:cv/features/todo/data/persistence/sqflite/model/_model.dart';
import 'package:cv/features/todo/data/persistence/sqflite/sqflite_service.dart';
import 'package:cv/features/todo/domain/model/todo.dart';
import 'package:cv/features/todo/domain/repository/todo_repository.dart';
import 'package:cv/features/todo/enum/priority_enum.dart';

class SqfliteRepository implements ITodoRepository {
  SqfliteRepository({
    required SqfliteService sqfliteService,
  }) : _service = sqfliteService;

  final SqfliteService _service;

  @override
  Future<void> deleteTodo(Todo todo) async {
    try {
      await _service.deleteTodo(
        ToDoDto(
          id: int.parse(todo.id),
          name: todo.name,
          description: todo.description,
          priorityId: todo.priorityEnum.toIndex(),
          isDone: todo.isDone ? 1 : 0,
        ),
      );
    } on () {
      rethrow;
    }
  }

  @override
  Future<List<Todo>> fetchAllToDo() async {
    try {
      final result = await _service.getAllTodos();
      final entities = result
          .map(
            (e) => Todo(
              id: e.id.toString(),
              name: e.name,
              description: e.description,
              priorityEnum: PriorityEnum.fromIndex(e.priorityId),
              isDone: e.isDone != 0,
            ),
          )
          .toList();
      return entities;
    } on () {
      rethrow;
    }
  }

  @override
  Future<void> insertTodo(Todo todo) async {
    try {
      await _service.insertToDo(
        ToDoDto(
          id: int.parse(todo.id),
          name: todo.name,
          description: todo.description,
          priorityId: todo.priorityEnum.toIndex(),
          isDone: todo.isDone ? 1 : 0,
        ),
      );
    } on () {
      rethrow;
    }
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    try {
      await _service.updateToDo(
        ToDoDto(
          id: int.parse(todo.id),
          name: todo.name,
          description: todo.description,
          priorityId: todo.priorityEnum.toIndex(),
          isDone: todo.isDone ? 1 : 0,
        ),
      );
    } on () {
      rethrow;
    }
  }
}
