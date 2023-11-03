import 'package:json_annotation/json_annotation.dart';

part 'astro_wheather.g.dart';

@JsonSerializable()
class AstroWheather {
  final DateTime sunrise;
  final DateTime sunset;
  final DateTime moonrise;
  final DateTime moonset;
  @JsonKey(name: 'moon_phase')
  final String moonPhase;
  @JsonKey(name: 'moon_illumination')
  final double moonIllumination;

  AstroWheather({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
  });

  factory AstroWheather.fromJson(Map<String, dynamic> json) =>
      _$AstroWheatherFromJson(json);

  Map<String, dynamic> toJson() => _$AstroWheatherToJson(this);
}
