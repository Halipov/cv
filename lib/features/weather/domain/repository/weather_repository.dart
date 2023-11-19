import 'package:cv/features/weather/domain/model/_model.dart';
import 'package:cv/features/weather/domain/service/weather_service.dart';

abstract interface class IWeatherRepository {
  Future<Weather> fetchWeather(String location, int days);
}

class WeatherApiRepository extends IWeatherRepository {
  final IWeatherService _weatherApiService;

  WeatherApiRepository({required IWeatherService weatherApiService}) : _weatherApiService = weatherApiService;
  @override
  Future<Weather> fetchWeather(String location, int days) async {
    try {
      final weather = await _weatherApiService.fetchWeather(location, days);
      return weather;
    } catch (_) {
      rethrow;
    }
  }
}
