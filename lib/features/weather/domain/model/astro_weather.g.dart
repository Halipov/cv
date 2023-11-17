// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'astro_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AstroWeather _$AstroWeatherFromJson(Map<String, dynamic> json) => AstroWeather(
      sunrise: json['sunrise'] as String,
      sunset: json['sunset'] as String,
      moonrise: json['moonrise'] as String,
      moonset: json['moonset'] as String,
      moonPhase: json['moon_phase'] as String,
      moonIllumination: (json['moon_illumination'] as num).toDouble(),
    );

Map<String, dynamic> _$AstroWeatherToJson(AstroWeather instance) =>
    <String, dynamic>{
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'moonrise': instance.moonrise,
      'moonset': instance.moonset,
      'moon_phase': instance.moonPhase,
      'moon_illumination': instance.moonIllumination,
    };
