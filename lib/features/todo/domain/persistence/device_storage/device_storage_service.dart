import 'dart:convert';
import 'dart:io';

import 'package:cv/features/todo/domain/persistence/device_storage/enum/storage_type.dart';
import 'package:cv/features/todo/domain/persistence/device_storage/model/todo_dto.dart';

class DeviceStorageService {
  final StorageType _storageType;
  late File _file;

  DeviceStorageService({required StorageType storageType}) : _storageType = storageType;

  Future<void> init() async {
    final directory = await _storageType.getDirectory();
    if (directory != null) {
      _file = File('${directory.path}/todo.json');
    } else {
      throw Exception('Directory not found');
    }
  }

  Future<void> saveTodos(List<ToDoDto> todos) async {
    final encoded = json.encode(todos.map((e) => e.toJson()).toList());
    await _file.writeAsString(encoded);
  }

  Future<void> saveTodo(ToDoDto todo) async {
    final List<ToDoDto> currentTodos = await fetchTodos();
    currentTodos.add(
      todo.copyWith(
        id: currentTodos.length + 1,
      ),
    );
    await saveTodos(currentTodos);
  }

  Future<List<ToDoDto>> fetchTodos() async {
    try {
      final exists = await _file.exists();
      if (exists) {
        final content = await _file.readAsString();
        final taskItems = json.decode(content) as List<dynamic>;
        final resultList = taskItems.map((task) => ToDoDto.fromJson(task));
        return resultList.toList();
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateTodo(ToDoDto todo) async {
    final currentTodos = await fetchTodos();
    final index = currentTodos.indexWhere((e) => e.id == todo.id);
    if (index != -1) {
      currentTodos[index] = todo;
      await saveTodos(currentTodos);
    }
  }

  Future<void> deleteTodo(int id) async {
    final todos = await fetchTodos();
    todos.removeWhere((todo) => todo.id == id);
    await saveTodos(todos);
  }
}
