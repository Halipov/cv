import 'package:cv/features/todo/domain/model/todo.dart';
import 'package:cv/features/todo/domain/persistence/device_storage/device_storage_service.dart';
import 'package:cv/features/todo/domain/persistence/device_storage/model/todo_dto.dart';
import 'package:cv/features/todo/domain/repository/persistence_repository.dart';
import 'package:cv/features/todo/enum/priority_enum.dart';

class DeviceStorageRepository implements IPersistenceTodoRepository {
  final DeviceStorageService _deviceStorageService;

  DeviceStorageRepository({required DeviceStorageService deviceStorageService})
      : _deviceStorageService = deviceStorageService;
  @override
  Future<void> deleteTodo(Todo todo) async {
    await _deviceStorageService.deleteTodo(todo.id);
  }

  @override
  Future<List<Todo>> fetchAllToDo() async {
    final list = await _deviceStorageService.fetchTodos();
    return list
        .map(
          (e) => Todo(
            id: e.id,
            name: e.name,
            description: e.description,
            priorityEnum: PriorityEnum.fromIndex(e.priorityId),
            isDone: e.isDone,
          ),
        )
        .toList();
  }

  @override
  Future<void> insertTodo(Todo todo) async {
    await _deviceStorageService.saveTodo(
      ToDoDto(
        id: todo.id,
        name: todo.name,
        description: todo.description,
        priorityId: todo.priorityEnum.toIndex(),
        isDone: todo.isDone,
      ),
    );
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    await _deviceStorageService.updateTodo(
      ToDoDto(
        id: todo.id,
        name: todo.name,
        description: todo.description,
        priorityId: todo.priorityEnum.toIndex(),
        isDone: todo.isDone,
      ),
    );
  }
}
