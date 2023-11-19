import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'astro_weather.g.dart';

@JsonSerializable()
class AstroWeather extends Equatable {
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  @JsonKey(name: 'moon_phase')
  final String moonPhase;
  @JsonKey(name: 'moon_illumination')
  final double moonIllumination;

  const AstroWeather({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
  });

  factory AstroWeather.fromJson(Map<String, dynamic> json) => _$AstroWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$AstroWeatherToJson(this);

  @override
  List<Object?> get props => [
        sunrise,
        sunset,
        moonrise,
        moonset,
        moonPhase,
        moonIllumination,
      ];
}
