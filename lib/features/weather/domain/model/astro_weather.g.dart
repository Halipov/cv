// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'astro_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AstroWeather _$AstroWeatherFromJson(Map<String, dynamic> json) => AstroWeather(
      sunrise: DateTime.parse(json['sunrise'] as String),
      sunset: DateTime.parse(json['sunset'] as String),
      moonrise: DateTime.parse(json['moonrise'] as String),
      moonset: DateTime.parse(json['moonset'] as String),
      moonPhase: json['moon_phase'] as String,
      moonIllumination: (json['moon_illumination'] as num).toDouble(),
    );

Map<String, dynamic> _$AstroWeatherToJson(AstroWeather instance) =>
    <String, dynamic>{
      'sunrise': instance.sunrise.toIso8601String(),
      'sunset': instance.sunset.toIso8601String(),
      'moonrise': instance.moonrise.toIso8601String(),
      'moonset': instance.moonset.toIso8601String(),
      'moon_phase': instance.moonPhase,
      'moon_illumination': instance.moonIllumination,
    };
