// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_day_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDayWeather _$ForecastDayWeatherFromJson(Map<String, dynamic> json) =>
    ForecastDayWeather(
      date: DateTime.parse(json['date'] as String),
      day: DayWeather.fromJson(json['day'] as Map<String, dynamic>),
      astro: AstroWeather.fromJson(json['astro'] as Map<String, dynamic>),
      hour: HourWeather.fromJson(json['hour'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastDayWeatherToJson(ForecastDayWeather instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'day': instance.day,
      'astro': instance.astro,
      'hour': instance.hour,
    };
