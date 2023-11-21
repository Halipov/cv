import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location extends Equatable {
  final String name;
  final String region;
  final String country;
  @LocalTimeConverter()
  final DateTime localtime;

  const Location({
    required this.name,
    required this.region,
    required this.country,
    required this.localtime,
  });
  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  @override
  List<Object?> get props => [name, region, country, localtime];
}

class LocalTimeConverter implements JsonConverter<DateTime, String> {
  const LocalTimeConverter();

  @override
  DateTime fromJson(String json) => DateFormat('yyyy-mm-dd HH:MM').parse(json);

  @override
  String toJson(DateTime object) => object.toString();
}
