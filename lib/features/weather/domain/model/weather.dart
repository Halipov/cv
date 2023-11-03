import 'package:cv/features/weather/domain/model/_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  final Location location;
  final CurrentWeather current;
  final Forecast forecast;

  Weather({
    required this.location,
    required this.current,
    required this.forecast,
  });
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
