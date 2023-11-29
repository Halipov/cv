// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'priority_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PriorityDtoAdapter extends TypeAdapter<PriorityDto> {
  @override
  final int typeId = 2;

  @override
  PriorityDto read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 2:
        return PriorityDto.high;
      case 1:
        return PriorityDto.medium;
      case 0:
        return PriorityDto.low;
      default:
        return PriorityDto.low;
    }
  }

  @override
  void write(BinaryWriter writer, PriorityDto obj) {
    switch (obj) {
      case PriorityDto.high:
        writer.writeByte(2);
        break;
      case PriorityDto.medium:
        writer.writeByte(1);
        break;
      case PriorityDto.low:
        writer.writeByte(0);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriorityDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
