import 'package:cv/features/weather/domain/model/_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  final List<ForecastDayWeather> forecastday;

  Forecast({
    required this.forecastday,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
