// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      name: json['name'] as String,
      region: json['region'] as String,
      country: json['country'] as String,
      localtime:
          const LocalTimeConverter().fromJson(json['localtime'] as String),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'localtime': const LocalTimeConverter().toJson(instance.localtime),
    };
