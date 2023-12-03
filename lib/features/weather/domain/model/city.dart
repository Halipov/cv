import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  City({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
  });

  factory City.london() => City(
        name: 'London',
        region: 'City of London, Greater London',
        country: 'United Kingdom',
        lat: 51.52,
        lon: -0.11,
      );

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);

  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
}
