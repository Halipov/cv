// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToDoDto _$ToDoDtoFromJson(Map<String, dynamic> json) => ToDoDto(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      priorityId: json['priorityId'] as int? ?? 0,
      isDone: json['isDone'] as bool? ?? false,
    );

Map<String, dynamic> _$ToDoDtoToJson(ToDoDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'priorityId': instance.priorityId,
      'isDone': instance.isDone,
    };
