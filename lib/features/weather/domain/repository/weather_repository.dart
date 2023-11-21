import 'package:cv/features/weather/domain/model/_model.dart';
import 'package:cv/features/weather/domain/service/weather_service.dart';
import 'package:rxdart/rxdart.dart';

abstract interface class IWeatherRepository {
  Stream<List<City>> get result;
  Future<Weather> fetchWeather(String location, int days);
  void searchCity(String query);
}

class WeatherApiRepository extends IWeatherRepository {
  final IWeatherService _weatherApiService;

  final _searchTerms = BehaviorSubject<String>();
  Stream<List<City>> _results = Stream.fromIterable([]);

  @override
  void searchCity(String query) => _searchTerms.add(query);

  WeatherApiRepository({
    required IWeatherService weatherApiService,
  }) : _weatherApiService = weatherApiService {
    _results = _searchTerms
        .debounce(
      (_) => TimerStream(
        true,
        const Duration(milliseconds: 500),
      ),
    )
        .switchMap(
      (value) async* {
        if (value.isNotEmpty) {
          yield await weatherApiService.searchCity(value);
        }
      },
    );
  }

  @override
  Future<Weather> fetchWeather(String location, int days) async {
    try {
      final weather = await _weatherApiService.fetchWeather(location, days);
      return weather;
    } catch (_) {
      rethrow;
    }
  }

  void dispose() {
    _searchTerms.close();
  }

  @override
  Stream<List<City>> get result => _results;
}
