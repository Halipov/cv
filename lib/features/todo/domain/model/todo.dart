import 'package:cv/features/todo/enum/priority_enum.dart';
import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final int id;
  final String name;
  final String description;
  final PriorityEnum priorityEnum;
  final bool isDone;

  const Todo({
    required this.id,
    required this.name,
    required this.description,
    required this.priorityEnum,
    required this.isDone,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        priorityEnum,
        isDone,
      ];

  Todo copyWith({
    int? id,
    String? name,
    String? description,
    PriorityEnum? priorityEnum,
    bool? isDone,
  }) {
    return Todo(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      priorityEnum: priorityEnum ?? this.priorityEnum,
      isDone: isDone ?? this.isDone,
    );
  }
}
