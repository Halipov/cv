import 'package:cv/features/wheather/domain/model/_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'current_wheather.g.dart';

@JsonSerializable()
class CurrentWheather {
  @JsonKey(name: 'last_updated')
  final DateTime lastUpdate;
  @JsonKey(name: 'temp_c')
  final double temp;
  @JsonKey(name: 'feelslike_c')
  final double feelsLike;
  final Condtition condition;
  @JsonKey(name: 'wind_kph')
  final double windSpeed;
  @JsonKey(name: 'wind_dir')
  final String windDirection;
  @JsonKey(name: 'pressure_mb')
  final double pressure;
  @JsonKey(name: 'precip_mm')
  final double precipitation;
  final double humidity;
  final double cloud;
  final double uv;

  CurrentWheather({
    required this.lastUpdate,
    required this.temp,
    required this.feelsLike,
    required this.condition,
    required this.windSpeed,
    required this.windDirection,
    required this.pressure,
    required this.precipitation,
    required this.humidity,
    required this.cloud,
    required this.uv,
  });
  factory CurrentWheather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWheatherFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWheatherToJson(this);
}
