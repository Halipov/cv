// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    CurrentWeather(
      lastUpdate: DateTime.parse(json['last_updated'] as String),
      temp: (json['temp_c'] as num).toDouble(),
      feelsLike: (json['feelslike_c'] as num).toDouble(),
      condition: Condtition.fromJson(json['condition'] as Map<String, dynamic>),
      windSpeed: (json['wind_kph'] as num).toDouble(),
      windDirection: json['wind_dir'] as String,
      pressure: (json['pressure_mb'] as num).toDouble(),
      precipitation: (json['precip_mm'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      cloud: (json['cloud'] as num).toDouble(),
      uv: (json['uv'] as num).toDouble(),
    );

Map<String, dynamic> _$CurrentWeatherToJson(CurrentWeather instance) =>
    <String, dynamic>{
      'last_updated': instance.lastUpdate.toIso8601String(),
      'temp_c': instance.temp,
      'feelslike_c': instance.feelsLike,
      'condition': instance.condition,
      'wind_kph': instance.windSpeed,
      'wind_dir': instance.windDirection,
      'pressure_mb': instance.pressure,
      'precip_mm': instance.precipitation,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'uv': instance.uv,
    };
