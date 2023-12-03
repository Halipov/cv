import 'package:cv/features/weather/domain/model/_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forecast_day_weather.g.dart';

@JsonSerializable()
class ForecastDayWeather extends Equatable {
  const ForecastDayWeather({
    required this.date,
    required this.day,
    required this.astro,
    required this.hour,
  });

  factory ForecastDayWeather.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayWeatherFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastDayWeatherToJson(this);

  final DateTime date;
  final DayWeather day;
  final AstroWeather astro;
  final List<HourWeather> hour;

  @override
  List<Object?> get props => [date, day, astro, hour];
}
