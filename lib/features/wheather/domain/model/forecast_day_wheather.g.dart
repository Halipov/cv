// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_day_wheather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDayWheather _$ForecastDayWheatherFromJson(Map<String, dynamic> json) =>
    ForecastDayWheather(
      date: DateTime.parse(json['date'] as String),
      day: DayWheather.fromJson(json['day'] as Map<String, dynamic>),
      astro: AstroWheather.fromJson(json['astro'] as Map<String, dynamic>),
      hour: HourWheather.fromJson(json['hour'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastDayWheatherToJson(
        ForecastDayWheather instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'day': instance.day,
      'astro': instance.astro,
      'hour': instance.hour,
    };
