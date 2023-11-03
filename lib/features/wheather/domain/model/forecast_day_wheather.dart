import 'package:cv/features/wheather/domain/model/_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forecast_day_wheather.g.dart';

@JsonSerializable()
class ForecastDayWheather {
  final DateTime date;
  final DayWheather day;
  final AstroWheather astro;
  final HourWheather hour;

  ForecastDayWheather({
    required this.date,
    required this.day,
    required this.astro,
    required this.hour,
  });

  factory ForecastDayWheather.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayWheatherFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastDayWheatherToJson(this);
}
