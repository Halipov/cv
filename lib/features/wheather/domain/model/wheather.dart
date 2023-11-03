import 'package:cv/features/wheather/domain/model/_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wheather.g.dart';

@JsonSerializable()
class Wheather {
  final Location location;
  final CurrentWheather current;
  final Forecast forecast;

  Wheather({
    required this.location,
    required this.current,
    required this.forecast,
  });
  factory Wheather.fromJson(Map<String, dynamic> json) =>
      _$WheatherFromJson(json);

  Map<String, dynamic> toJson() => _$WheatherToJson(this);
}
