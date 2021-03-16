import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vgv_core/models/export.dart';
import 'package:vgv_weather/repository/weather/export.dart';

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
      final weather = await weatherRepository.getForecast(event.city);
      yield WeatherLoadSuccess(weather: weather, updated: event.requestTime);
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
      final weather = await weatherRepository.getForecast(event.city);
      yield WeatherLoadSuccess(weather: weather, updated: event.requestTime);
    } catch (_) {
      yield state;
    }
  }
}
