import 'package:cv/features/weather/domain/model/_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather extends Equatable {
  final Location location;
  final CurrentWeather current;
  final Forecast forecast;

  const Weather({
    required this.location,
    required this.current,
    required this.forecast,
  });
  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @override
  List<Object?> get props => [location, current, forecast];
}
