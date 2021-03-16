part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadInProgress extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  const WeatherLoadSuccess({
    required this.weather,
    required this.updated,
  });

  final DateTime updated;
  final Weather weather;

  @override
  List<Object> get props => [weather, updated];
}

class WeatherLoadFailure extends WeatherState {
  const WeatherLoadFailure({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
