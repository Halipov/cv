// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'astro_wheather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AstroWheather _$AstroWheatherFromJson(Map<String, dynamic> json) =>
    AstroWheather(
      sunrise: DateTime.parse(json['sunrise'] as String),
      sunset: DateTime.parse(json['sunset'] as String),
      moonrise: DateTime.parse(json['moonrise'] as String),
      moonset: DateTime.parse(json['moonset'] as String),
      moonPhase: json['moon_phase'] as String,
      moonIllumination: (json['moon_illumination'] as num).toDouble(),
    );

Map<String, dynamic> _$AstroWheatherToJson(AstroWheather instance) =>
    <String, dynamic>{
      'sunrise': instance.sunrise.toIso8601String(),
      'sunset': instance.sunset.toIso8601String(),
      'moonrise': instance.moonrise.toIso8601String(),
      'moonset': instance.moonset.toIso8601String(),
      'moon_phase': instance.moonPhase,
      'moon_illumination': instance.moonIllumination,
    };
