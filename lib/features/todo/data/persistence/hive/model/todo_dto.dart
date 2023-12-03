import 'package:cv/features/todo/data/persistence/hive/model/_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'todo_dto.g.dart';

@HiveType(typeId: 1)
class ToDoDto extends HiveObject {
  ToDoDto({
    required this.name,
    required this.description,
    this.priority = PriorityDto.low,
    this.isDone = false,
  });

  @HiveField(0)
  final String name;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final PriorityDto priority;
  @HiveField(3)
  final bool isDone;
}
