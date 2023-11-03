// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_wheather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayWheather _$DayWheatherFromJson(Map<String, dynamic> json) => DayWheather(
      maxTemp: (json['maxtemp_c'] as num).toDouble(),
      minTemp: (json['mintemp_c'] as num).toDouble(),
      condtition:
          Condtition.fromJson(json['condtition'] as Map<String, dynamic>),
      avgTemp: (json['avgtemp_c'] as num).toDouble(),
      maxWind: (json['maxwind_kph'] as num).toDouble(),
      totalPrecip: (json['totalprecip_mm'] as num).toDouble(),
      totalSnow: (json['totalsnow_cm'] as num).toDouble(),
      avgVis: (json['avgvis_km'] as num).toDouble(),
      avgHumidity: (json['avghumidity'] as num).toDouble(),
      dailyWillItRain: json['daily_will_it_rain'] as int,
      dailyChanceOfRain: json['daily_chance_of_rain'] as int,
      dailyWillItSnow: json['daily_will_it_snow'] as int,
      dailyChanceOfSnow: json['daily_chance_of_snow'] as int,
      uv: (json['uv'] as num).toDouble(),
    );

Map<String, dynamic> _$DayWheatherToJson(DayWheather instance) =>
    <String, dynamic>{
      'maxtemp_c': instance.maxTemp,
      'mintemp_c': instance.minTemp,
      'condtition': instance.condtition,
      'avgtemp_c': instance.avgTemp,
      'maxwind_kph': instance.maxWind,
      'totalprecip_mm': instance.totalPrecip,
      'totalsnow_cm': instance.totalSnow,
      'avgvis_km': instance.avgVis,
      'avghumidity': instance.avgHumidity,
      'daily_will_it_rain': instance.dailyWillItRain,
      'daily_chance_of_rain': instance.dailyChanceOfRain,
      'daily_will_it_snow': instance.dailyWillItSnow,
      'daily_chance_of_snow': instance.dailyChanceOfSnow,
      'uv': instance.uv,
    };
