// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToDoDtoAdapter extends TypeAdapter<ToDoDto> {
  @override
  final int typeId = 1;

  @override
  ToDoDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToDoDto(
      name: fields[0] as String,
      description: fields[1] as String,
      priority: fields[2] as PriorityDto,
      isDone: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ToDoDto obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.priority)
      ..writeByte(3)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToDoDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
