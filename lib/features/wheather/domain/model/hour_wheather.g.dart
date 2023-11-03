// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hour_wheather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourWheather _$HourWheatherFromJson(Map<String, dynamic> json) => HourWheather(
      time: DateTime.parse(json['time'] as String),
      temp: (json['temp_c'] as num).toDouble(),
      isDay: json['is_day'] as int,
      feelsLike: (json['feelslike_c'] as num).toDouble(),
      condtition:
          Condtition.fromJson(json['condtition'] as Map<String, dynamic>),
      windSpeed: (json['wind_kph'] as num).toDouble(),
      windDirection: json['wind_dir'] as String,
      pressure: (json['pressure_mb'] as num).toDouble(),
      precipitation: (json['precip_mm'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      cloud: (json['cloud'] as num).toDouble(),
      uv: (json['uv'] as num).toDouble(),
      willItRain: json['will_it_rain'] as int,
      chanceOfRain: json['chance_of_rain'] as int,
      willItSnow: json['will_it_snow'] as int,
      chanceOfSnow: json['chance_of_snow'] as int,
    );

Map<String, dynamic> _$HourWheatherToJson(HourWheather instance) =>
    <String, dynamic>{
      'time': instance.time.toIso8601String(),
      'temp_c': instance.temp,
      'is_day': instance.isDay,
      'feelslike_c': instance.feelsLike,
      'condtition': instance.condtition,
      'wind_kph': instance.windSpeed,
      'wind_dir': instance.windDirection,
      'pressure_mb': instance.pressure,
      'precip_mm': instance.precipitation,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'uv': instance.uv,
      'will_it_rain': instance.willItRain,
      'chance_of_rain': instance.chanceOfRain,
      'will_it_snow': instance.willItSnow,
      'chance_of_snow': instance.chanceOfSnow,
    };
