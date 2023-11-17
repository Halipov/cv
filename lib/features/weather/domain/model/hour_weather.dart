import 'package:cv/features/weather/domain/model/_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'hour_weather.g.dart';

@JsonSerializable()
class HourWeather {
  @JsonKey(name: 'time')
  final DateTime time;
  @JsonKey(name: 'temp_c')
  final double temp;
  @JsonKey(name: 'is_day')
  final int isDay;
  @JsonKey(name: 'feelslike_c')
  final double feelsLike;
  @JsonKey(name: 'condition')
  final Condition condition;
  @JsonKey(name: 'wind_kph')
  final double windSpeed;
  @JsonKey(name: 'wind_dir')
  final String windDirection;
  @JsonKey(name: 'pressure_mb')
  final double pressure;
  @JsonKey(name: 'precip_mm')
  final double precipitation;
  @JsonKey(name: 'humidity')
  final double humidity;
  @JsonKey(name: 'cloud')
  final double cloud;
  @JsonKey(name: 'uv')
  final double uv;
  @JsonKey(name: 'will_it_rain')
  final int willItRain;
  @JsonKey(name: 'chance_of_rain')
  final int chanceOfRain;
  @JsonKey(name: 'will_it_snow')
  final int willItSnow;
  @JsonKey(name: 'chance_of_snow')
  final int chanceOfSnow;

  HourWeather({
    required this.time,
    required this.temp,
    required this.isDay,
    required this.feelsLike,
    required this.condition,
    required this.windSpeed,
    required this.windDirection,
    required this.pressure,
    required this.precipitation,
    required this.humidity,
    required this.cloud,
    required this.uv,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
  });

  factory HourWeather.fromJson(Map<String, dynamic> json) =>
      _$HourWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$HourWeatherToJson(this);
}
