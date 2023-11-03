// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wheather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wheather _$WheatherFromJson(Map<String, dynamic> json) => Wheather(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      current:
          CurrentWheather.fromJson(json['current'] as Map<String, dynamic>),
      forecast: Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WheatherToJson(Wheather instance) => <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
      'forecast': instance.forecast,
    };
