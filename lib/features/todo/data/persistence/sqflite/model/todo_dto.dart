import 'package:json_annotation/json_annotation.dart';

part 'todo_dto.g.dart';

@JsonSerializable()
class ToDoDto {
  ToDoDto({
    required this.id,
    required this.name,
    required this.description,
    this.priorityId = 0,
    this.isDone = 0,
  });

  factory ToDoDto.fromJson(Map<String, dynamic> json) =>
      _$ToDoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ToDoDtoToJson(this);

  @JsonKey(includeToJson: false)
  final int id;
  final String name;
  final String description;
  @JsonKey(defaultValue: 0)
  final int priorityId;
  @JsonKey(defaultValue: 0)
  final int isDone;
}
