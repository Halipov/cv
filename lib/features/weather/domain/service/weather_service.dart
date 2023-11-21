import 'package:cv/features/weather/domain/model/_model.dart';

abstract class IWeatherService {
  Future<Weather> fetchWeather(String location, int days, {String key});
  Future<List<City>> searchCity(String query, {String key});
}
