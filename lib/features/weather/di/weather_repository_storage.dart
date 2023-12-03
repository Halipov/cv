import 'package:cv/features/weather/domain/_domain.dart';

abstract interface class IWeatherRepositoryStorage {
  IWeatherRepository get weatherRepository;
}

class WeatherRepositoryStorage implements IWeatherRepositoryStorage {
  WeatherRepositoryStorage({required IWeatherService weatherService})
      : _weatherService = weatherService;

  final IWeatherService _weatherService;

  WeatherApiRepository? _weatherApiRepository;

  @override
  IWeatherRepository get weatherRepository =>
      _weatherApiRepository ??= WeatherApiRepository(
        weatherApiService: _weatherService,
      );
}
