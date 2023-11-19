// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cv/features/weather/service/weather_api_service.dart';
import 'package:cv/features/weather/service/weather_service.dart';
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
