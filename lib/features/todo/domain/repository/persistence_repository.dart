import 'package:cv/features/todo/domain/model/_model.dart';

abstract interface class IPersistenceTodoRepository {
  Future<List<Todo>> fetchAllToDo();
  Future<void> insertTodo(Todo todo);
  Future<void> updateTodo(Todo todo);
  Future<void> deleteTodo(Todo todo);
}
