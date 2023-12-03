import 'package:cv/features/weather/domain/_domain.dart';
import 'package:cv/util/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  //final IThemeService _themeService;

  WeatherBloc({
    required IWeatherRepository weatherRepository,
  })  : _weatherRepository = weatherRepository,
        //     _themeService = themeService,
        super(WeatherLoading()) {
    on<FetchWeatherEvent>(_onFetchWeatherEvent);
  }
  final IWeatherRepository _weatherRepository;

  Future<void> _onFetchWeatherEvent(
    FetchWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());
    final weather = await _weatherRepository.fetchWeather(event.city.name, 7);
    // if (weather.current.isDay) {
    //   _themeService.updateThemeMode(ThemeMode.light);
    // } else {
    //   _themeService.updateThemeMode(ThemeMode.dark);
    // }
    talker.info('css');
    emit(WeatherLoaded(weather: weather));
  }
}
