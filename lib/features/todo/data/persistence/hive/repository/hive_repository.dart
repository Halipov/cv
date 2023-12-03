import 'package:cv/features/todo/data/persistence/hive/hive_service.dart';
import 'package:cv/features/todo/data/persistence/hive/model/_model.dart';
import 'package:cv/features/todo/domain/model/_model.dart';
import 'package:cv/features/todo/domain/repository/todo_repository.dart';
import 'package:cv/features/todo/enum/priority_enum.dart';

class HiveRepository implements ITodoRepository {
  HiveRepository({
    required HiveService hiveService,
  }) : _hiveService = hiveService;

  final HiveService _hiveService;

  @override
  Future<void> insertTodo(Todo todo) async {
    await _hiveService.insertToDo(
      ToDoDto(
        name: todo.name,
        description: todo.description,
        priority: PriorityDto.fromIndex(
          todo.priorityEnum.toIndex(),
        ),
        isDone: todo.isDone,
      ),
      int.parse(todo.id),
    );
  }

  @override
  Future<List<Todo>> fetchAllToDo() async => _hiveService
      .getAllTodos()
      .map(
        (e) => Todo(
          id: e.key.toString(),
          name: e.name,
          description: e.description,
          priorityEnum: PriorityEnum.fromIndex(
            e.priority.toIndex(),
          ),
          isDone: e.isDone,
        ),
      )
      .toList();

  @override
  Future<void> updateTodo(Todo todo) async {
    await _hiveService.updateToDo(
      ToDoDto(
        name: todo.name,
        description: todo.description,
        priority: PriorityDto.fromIndex(
          todo.priorityEnum.toIndex(),
        ),
        isDone: todo.isDone,
      ),
      int.parse(todo.id),
    );
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    await _hiveService.deleteToDo(int.parse(todo.id));
  }
}
