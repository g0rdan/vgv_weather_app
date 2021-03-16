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

    final testWeatherModel = const Weather(
      temp: 20.0,
      maxTemp: 20.0,
      minTemp: 20.0,
      windSpeed: 5.2,
      humidity: 90,
      condition: WeatherCondition.clear,
      created: 'created',
      formattedCondition: 'Clear',
      location: 'New York',
      locationId: 1,
    );

    setUp(() {
      weatherRepository = MockWeatherRepository();
      when(() => weatherRepository.getForecast('New York'))
          .thenAnswer((invocation) async => testWeatherModel);
      when(() => weatherRepository.getForecast('incorrect request'))
          .thenThrow(Exception());
      when(() => weatherRepository.getForecast('incorrect http request'))
          .thenThrow(const HttpException('http exception'));
    });

    blocTest<WeatherBloc, WeatherState>(
      'check initial state',
      build: () => WeatherBloc(weatherRepository: weatherRepository),
      expect: () => <WeatherState>[],
    );

    blocTest<WeatherBloc, WeatherState>(
      'check correct city request',
      build: () => WeatherBloc(weatherRepository: weatherRepository),
      act: (WeatherBloc bloc) async => bloc.add(WeatherRequested(
        city: 'New York',
        requestTime: DateTime(2021),
      )),
      expect: () => <WeatherState>[
        WeatherLoadInProgress(),
        WeatherLoadSuccess(
          weather: testWeatherModel,
          updated: DateTime(2021),
        ),
      ],
    );

    blocTest<WeatherBloc, WeatherState>(
      'check correct city refresh request',
      build: () => WeatherBloc(weatherRepository: weatherRepository),
      act: (WeatherBloc bloc) async => bloc.add(WeatherRefreshRequested(
        city: 'New York',
        requestTime: DateTime(2021),
      )),
      expect: () => <WeatherState>[
        WeatherLoadSuccess(
          weather: testWeatherModel,
          updated: DateTime(2021),
        )
      ],
    );

    blocTest<WeatherBloc, WeatherState>(
      'check incorrect city request',
      build: () => WeatherBloc(weatherRepository: weatherRepository),
      act: (WeatherBloc bloc) async => bloc.add(WeatherRequested(
        city: 'incorrect request',
        requestTime: DateTime(2021),
      )),
      expect: () => <WeatherState>[
        WeatherLoadInProgress(),
        const WeatherLoadFailure(
          message: 'Something went wrong. Can\'t get data',
        )
      ],
    );

    blocTest<WeatherBloc, WeatherState>(
      'check incorrect http city request',
      build: () => WeatherBloc(weatherRepository: weatherRepository),
      act: (WeatherBloc bloc) async => bloc.add(WeatherRequested(
        city: 'incorrect http request',
        requestTime: DateTime(2021),
      )),
      expect: () => <WeatherState>[
        WeatherLoadInProgress(),
        const WeatherLoadFailure(message: 'http exception')
      ],
    );

    blocTest<WeatherBloc, WeatherState>(
      'check incorrect city refresh request',
      build: () => WeatherBloc(weatherRepository: weatherRepository),
      act: (WeatherBloc bloc) {
        bloc.add(WeatherRefreshRequested(
          city: 'New York',
          requestTime: DateTime(2021),
        ));
        // ignore: cascade_invocations
        bloc.add(WeatherRefreshRequested(
          city: 'incorrect request',
          requestTime: DateTime(2021),
        ));
      },
      expect: () => <WeatherState>[
        WeatherLoadSuccess(
          weather: testWeatherModel,
          updated: DateTime(2021),
        )
      ],
    );
  });

  group('WeatherEvent', () {
    test('check props of WeatherRequested', () {
      final event = WeatherRequested(
        city: 'New York',
        requestTime: DateTime(2021),
      );
      expect(event.props.length, 2);
    });

    test('check props of WeatherRefreshRequested', () {
      final event = WeatherRefreshRequested(
        city: 'New York',
        requestTime: DateTime(2021),
      );
      expect(event.props.length, 2);
    });
  });
}
