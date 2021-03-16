part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherRequested extends WeatherEvent {
  const WeatherRequested({
    required this.city,
    required this.requestTime,
  });

  final String city;
  final DateTime requestTime;

  @override
  List<Object> get props => [city, requestTime];
}

class WeatherRefreshRequested extends WeatherEvent {
  const WeatherRefreshRequested({
    required this.city,
    required this.requestTime,
  });

  final String city;
  final DateTime requestTime;

  @override
  List<Object> get props => [city, requestTime];
}
