import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vgv_weather_app/core/models/weather.dart';
import 'package:vgv_weather_app/core/repositories/weather/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({required this.weatherRepository}) : super(WeatherInitial());

  final WeatherRepository weatherRepository;

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherRequested) {
      yield* _mapWeatherRequestedToState(event);
    } else if (event is WeatherRefreshRequested) {
      yield* _mapWeatherRefreshRequestedToState(event);
    }
  }

  Stream<WeatherState> _mapWeatherRequestedToState(
    WeatherRequested event,
  ) async* {
    yield WeatherLoadInProgress();
    try {
      final weather = await weatherRepository.getWeather(event.city);
      yield WeatherLoadSuccess(weather: weather);
    } on HttpException catch (e) {
      yield WeatherLoadFailure(message: e.message);
    } catch (_) {
      yield const WeatherLoadFailure(
        message: 'Something went wrong. Can\'t get data',
      );
    }
  }

  Stream<WeatherState> _mapWeatherRefreshRequestedToState(
    WeatherRefreshRequested event,
  ) async* {
    try {
      final weather = await weatherRepository.getWeather(event.city);
      yield WeatherLoadSuccess(weather: weather);
    } catch (_) {
      yield state;
    }
  }
}
