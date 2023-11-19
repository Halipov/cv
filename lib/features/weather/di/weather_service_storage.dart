import 'package:cv/features/weather/domain/_domain.dart';
import 'package:dio/dio.dart';

abstract interface class IWeatherServiceStorage {
  IWeatherService get weatherService;
}

class WeatherServiceStorage implements IWeatherServiceStorage {
  final Dio _dio;
  IWeatherService? _weatherService;

  WeatherServiceStorage({
    required Dio dio,
  }) : _dio = dio;

  @override
  IWeatherService get weatherService => _weatherService ??= WeatherApiService(_dio);
}
