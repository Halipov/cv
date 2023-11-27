import 'package:cv/features/todo/enum/priority_enum.dart';

class Todo {
  final int id;
  final String name;
  final String description;
  final PriorityEnum priorityEnum;
  final bool isDone;

  Todo({
    required this.id,
    required this.name,
    required this.description,
    required this.priorityEnum,
    required this.isDone,
  });
}
