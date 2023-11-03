import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  final String name;
  final String region;
  final String country;
  final DateTime localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.localtime,
  });
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}