import 'package:cv/features/todo/data/persistence/hive/model/_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  late Box<ToDoDto> _todoBox;
  Future<void> init() async {
    await Hive.initFlutter();
    Hive
      ..registerAdapter(ToDoDtoAdapter())
      ..registerAdapter(PriorityDtoAdapter());
    _todoBox = await Hive.openBox<ToDoDto>('todoBox');
  }

  List<ToDoDto> getAllTodos() => _todoBox.values.toList();

  Future<void> insertToDo(ToDoDto todo, int index) async {
    await _todoBox.add(todo);
  }

  Future<void> updateToDo(ToDoDto todo, int index) async {
    await _todoBox.put(index, todo);
  }

  Future<void> deleteToDo(int index) async {
    final todo = _todoBox.values.firstWhere((element) => element.key == index);
    await todo.delete();
  }
}
