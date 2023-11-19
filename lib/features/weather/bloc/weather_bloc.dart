import 'package:cv/features/weather/domain/_domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final IWeatherRepository _weatherRepository;

  WeatherBloc({required IWeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository,
        super(WeatherLoading()) {
    on<FetchWeatherEvent>(_onFetchWeatherEvent);
  }

  Future<void> _onFetchWeatherEvent(
    FetchWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());
    final weather = await _weatherRepository.fetchWeather('Minsk', 7);
    emit(WeatherLoaded(weather: weather));
  }
}
