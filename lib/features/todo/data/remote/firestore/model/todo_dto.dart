// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'todo_dto.g.dart';

@JsonSerializable()
class ToDoDto {
  @JsonKey(includeToJson: false, includeFromJson: false)
  final String id;
  final String name;
  final String description;
  @JsonKey(defaultValue: 0)
  final int priorityId;
  @JsonKey(defaultValue: false)
  final bool isDone;

  ToDoDto({
    this.id = '',
    required this.name,
    required this.description,
    this.priorityId = 0,
    this.isDone = false,
  });

  factory ToDoDto.fromJson(Map<String, dynamic> json) => _$ToDoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ToDoDtoToJson(this);

  ToDoDto copyWith({
    String? id,
    String? name,
    String? description,
    int? priorityId,
    bool? isDone,
  }) {
    return ToDoDto(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      priorityId: priorityId ?? this.priorityId,
      isDone: isDone ?? this.isDone,
    );
  }
}
