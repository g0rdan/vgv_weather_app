import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgv_core/models/export.dart';
import 'package:vgv_weather/bloc/weather_bloc.dart';
import 'package:vgv_weather/repository/weather/export.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  group('WeatherBloc', () {
    late WeatherRepository weatherRepository;

    final testWeatherModel = Weather(
      condition: WeatherCondition.clear,
      created: 'created',
      formattedCondition: 'Clear',
      location: 'New York',
      locationId: 1,
      maxTemp: 20.0,
      minTemp: 20.0,
      temp: 20.0,
    );

    setUp(() {
      weatherRepository = MockWeatherRepository();
      when(() => weatherRepository.getWeather('New York'))
          .thenAnswer((invocation) async => testWeatherModel);
      when(() => weatherRepository.getWeather('incorrect request'))
          .thenThrow(Exception());
      when(() => weatherRepository.getWeather('incorrect http request'))
          .thenThrow(HttpException('http exception'));
    });

    blocTest<WeatherBloc, WeatherState>(
      'check initial state',
      build: () => WeatherBloc(weatherRepository: weatherRepository),
      expect: () => <WeatherState>[],
    );

    blocTest<WeatherBloc, WeatherState>(
      'check correct city request',
      build: () => WeatherBloc(weatherRepository: weatherRepository),
      act: (WeatherBloc bloc) async =>
          bloc.add(WeatherRequested(city: 'New York')),
      expect: () => <WeatherState>[
        WeatherLoadInProgress(),
        WeatherLoadSuccess(weather: testWeatherModel)
      ],
    );

    blocTest<WeatherBloc, WeatherState>(
      'check correct city refresh request',
      build: () => WeatherBloc(weatherRepository: weatherRepository),
      act: (WeatherBloc bloc) async =>
          bloc.add(WeatherRefreshRequested(city: 'New York')),
      expect: () =>
          <WeatherState>[WeatherLoadSuccess(weather: testWeatherModel)],
    );

    blocTest<WeatherBloc, WeatherState>(
      'check incorrect city request',
      build: () => WeatherBloc(weatherRepository: weatherRepository),
      act: (WeatherBloc bloc) async =>
          bloc.add(WeatherRequested(city: 'incorrect request')),
      expect: () => <WeatherState>[
        WeatherLoadInProgress(),
        WeatherLoadFailure(message: 'Something went wrong. Can\'t get data')
      ],
    );

    blocTest<WeatherBloc, WeatherState>(
      'check incorrect http city request',
      build: () => WeatherBloc(weatherRepository: weatherRepository),
      act: (WeatherBloc bloc) async =>
          bloc.add(WeatherRequested(city: 'incorrect http request')),
      expect: () => <WeatherState>[
        WeatherLoadInProgress(),
        WeatherLoadFailure(message: 'http exception')
      ],
    );

    blocTest<WeatherBloc, WeatherState>(
      'check incorrect city refresh request',
      build: () => WeatherBloc(weatherRepository: weatherRepository),
      act: (WeatherBloc bloc) {
        bloc.add(WeatherRefreshRequested(city: 'New York'));
        bloc.add(WeatherRefreshRequested(city: 'incorrect request'));
      },
      expect: () =>
          <WeatherState>[WeatherLoadSuccess(weather: testWeatherModel)],
    );
  });
}
