part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class WeatherRequested extends WeatherEvent {
  const WeatherRequested({required this.city});

  final String city;

  @override
  List<Object> get props => [city];
}

class WeatherRefreshRequested extends WeatherEvent {
  const WeatherRefreshRequested({required this.city});

  final String city;

  @override
  List<Object> get props => [city];
}
