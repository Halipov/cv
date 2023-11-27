enum TimeTabEnum {
  recent,
  today,
  upcoming;

  @override
  String toString() => switch (this) {
        recent => 'Recent',
        today => 'Today',
        upcoming => 'Upcoming',
      };
}
