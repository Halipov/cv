import 'package:cv/features/weather/domain/model/_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'day_weather.g.dart';

@JsonSerializable()
class DayWeather extends Equatable {
  const DayWeather({
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
    required this.avgTemp,
    required this.maxWind,
    required this.totalPrecip,
    required this.totalSnow,
    required this.avgVis,
    required this.avgHumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.uv,
  });

  factory DayWeather.fromJson(Map<String, dynamic> json) =>
      _$DayWeatherFromJson(json);

  @JsonKey(name: 'maxtemp_c')
  final double maxTemp;
  @JsonKey(name: 'mintemp_c')
  final double minTemp;
  final Condition condition;
  @JsonKey(name: 'avgtemp_c')
  final double avgTemp;
  @JsonKey(name: 'maxwind_kph')
  final double maxWind;
  @JsonKey(name: 'totalprecip_mm')
  final double totalPrecip;
  @JsonKey(name: 'totalsnow_cm')
  final double totalSnow;
  @JsonKey(name: 'avgvis_km')
  final double avgVis;
  @JsonKey(name: 'avghumidity')
  final double avgHumidity;
  @JsonKey(name: 'daily_will_it_rain')
  final int dailyWillItRain;
  @JsonKey(name: 'daily_chance_of_rain')
  final int dailyChanceOfRain;
  @JsonKey(name: 'daily_will_it_snow')
  final int dailyWillItSnow;
  @JsonKey(name: 'daily_chance_of_snow')
  final int dailyChanceOfSnow;
  @JsonKey(name: 'uv')
  final double uv;

  Map<String, dynamic> toJson() => _$DayWeatherToJson(this);

  @override
  List<Object?> get props => [
        maxTemp,
        minTemp,
        condition,
        avgTemp,
        maxWind,
        totalPrecip,
        totalSnow,
        avgVis,
        avgHumidity,
        dailyWillItRain,
        dailyChanceOfRain,
        dailyWillItSnow,
        dailyChanceOfSnow,
        uv,
      ];
}
