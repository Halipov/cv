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
      hour: (json['hour'] as List<dynamic>)
          .map((e) => HourWeather.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastDayWeatherToJson(ForecastDayWeather instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'day': instance.day,
      'astro': instance.astro,
      'hour': instance.hour,
    };
