import 'package:json_annotation/json_annotation.dart';

part 'astro_weather.g.dart';

@JsonSerializable()
class AstroWeather {
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  @JsonKey(name: 'moon_phase')
  final String moonPhase;
  @JsonKey(name: 'moon_illumination')
  final double moonIllumination;

  AstroWeather({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
  });

  factory AstroWeather.fromJson(Map<String, dynamic> json) =>
      _$AstroWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$AstroWeatherToJson(this);
}
