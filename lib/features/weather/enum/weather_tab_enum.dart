enum WeatherTabEnum {
  today,
  tommorow,
  forecast;

  @override
  String toString() => switch (this) {
        today => 'Today',
        tommorow => 'Tommorow',
        forecast => 'Forecast',
      };
}
