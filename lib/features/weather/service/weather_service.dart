import 'package:cv/features/weather/domain/model/_model.dart';

abstract interface class IWeatherService {
  Future<Weather> fetchWeather();
}
