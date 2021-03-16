import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgv_core/models/export.dart';
import 'package:vgv_theme/cubit/theme_cubit.dart';
import 'package:vgv_theme/repository/theme_repository.dart';
import 'package:vgv_weather/bloc/weather_bloc.dart';
import 'package:vgv_weather/repository/weather/export.dart';
import 'package:vgv_weather/view/export.dart';
import 'package:vgv_weather_city/bloc/city_selection_bloc.dart';
import 'package:vgv_weather_measurement_system/cubit/measurement_system_cubit.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

class MockThemeRepository extends Mock implements ThemeRepository {}

void main() {
  Widget _getShell(
    WeatherRepository weatherRepository,
    ThemeRepository themeRepository,
  ) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => WeatherBloc(
              weatherRepository: weatherRepository,
            ),
          ),
          BlocProvider(
            create: (context) => ThemeCubit(
              themeRepository: themeRepository,
              initialState: const ThemeState(
                color: Colors.lightBlue,
                prevColor: Colors.lightBlue,
              ),
            ),
          ),
          BlocProvider(
            create: (context) => MeasurementSystemCubit(),
          ),
          BlocProvider(
            create: (context) => CitySelectionBloc(),
          ),
        ],
        child: WeatherPage(),
      ),
    );
  }

  group('General', () {
    late WeatherRepository weatherRepository;
    late ThemeRepository themeRepository;

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
      themeRepository = MockThemeRepository();

      when(() => weatherRepository.getForecast('New York'))
          .thenAnswer((invocation) async => testWeatherModel);
      when(() => weatherRepository.getForecast('incorrect request'))
          .thenThrow(Exception());
      when(() => weatherRepository.getForecast('incorrect http request'))
          .thenThrow(const HttpException('http exception'));
      when(() => themeRepository.prevColor).thenReturn(Colors.amber);
    });

    testWidgets('render weather page', (tester) async {
      await tester.pumpWidget(_getShell(weatherRepository, themeRepository));
      expect(find.text('Please Select Location'), findsOneWidget);
    });

    testWidgets('find rigth weather title', (tester) async {
      await tester.pumpWidget(_getShell(weatherRepository, themeRepository));
      final textField = find.byKey(const Key('text_form_field'));
      await tester.tap(textField);
      await tester.enterText(textField, 'New York');

      final searchButton = find.byKey(const Key('search_button'));
      await tester.tap(searchButton);

      expect(find.text('City'), findsOneWidget);
    });
  });
}
