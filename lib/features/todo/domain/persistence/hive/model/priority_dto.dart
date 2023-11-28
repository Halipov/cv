import 'package:hive_flutter/hive_flutter.dart';

part 'priority_dto.g.dart';

@HiveType(typeId: 2)
enum PriorityDto {
  @HiveField(2)
  high,
  @HiveField(1)
  medium,
  @HiveField(0, defaultValue: true)
  low;

  int toIndex() => switch (this) {
        high => 2,
        medium => 1,
        low => 0,
      };
  static PriorityDto fromIndex(int index) => switch (index) {
        2 => high,
        1 => medium,
        0 => low,
        _ => low,
      };
}
