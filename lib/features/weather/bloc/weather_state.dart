part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  const WeatherLoaded({required this.weather});

  final Weather weather;

  @override
  List<Object> get props => [weather];
}
