enum PriorityEnum {
  high,
  medium,
  low;

  @override
  String toString() => switch (this) {
        high => 'High',
        medium => 'Medium',
        low => 'Low',
      };

  static PriorityEnum fromIndex(int index) => switch (index) {
        2 => high,
        1 => medium,
        0 => low,
        _ => low,
      };

  int toIndex() => switch (this) {
        high => 2,
        medium => 1,
        low => 0,
      };
}
