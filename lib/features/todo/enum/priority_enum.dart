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

  static PriorityEnum fromIndex(int index) {
    switch (index) {
      case 2:
        return high;
      case 1:
        return medium;
      case 0:
        return low;
      default:
        return low;
    }
  }

  int toIndex() => switch (this) {
        high => 2,
        medium => 1,
        low => 0,
      };
}
