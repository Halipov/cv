import 'package:cv/features/weather/domain/model/_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'weather_service.g.dart';

@RestApi(baseUrl: 'http://api.weatherapi.com/v1')
abstract class WeatherApiService {
  factory WeatherApiService(Dio dio, {String baseUrl}) = _WeatherApiService;

  @GET('/forecast.json')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<Weather> fetchWeather(
    @Query('q') String location,
    @Query('days') int days, {
    @Query('key') String key = 'f8b4cb851e6e4d3095c155416232610',
  });
}
