import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vgv_core/models/weather_condition.dart';
import 'package:vgv_theme/cubit/theme_cubit.dart';
import 'package:vgv_theme/repository/theme_repository.dart';

void main() {
  group('ThemeCubit', () {
    late ThemeRepository themeRepository;
    late ThemeCubit cubit;

    setUp(() {
      themeRepository = ThemeRepository();
      themeRepository.prevColor = Colors.amber;
      cubit = ThemeCubit(
        themeRepository: themeRepository,
        initialState: ThemeState(
          color: Colors.blue,
          prevColor: themeRepository.prevColor,
        ),
      );
    });

    test('check initial state', () {
      expect(
          cubit.state,
          equals(
            const ThemeState(
              color: Colors.blue,
              prevColor: Colors.amber,
            ),
          ));
    });

    blocTest<ThemeCubit, ThemeState>(
      'check emiting of the state',
      build: () => cubit,
      act: (cubit) => cubit.weatherChanged(WeatherCondition.clear),
      expect: () => [
        equals(ThemeState(
          color: Colors.yellow,
          prevColor: Colors.amber,
        ))
      ],
    );

    blocTest<ThemeCubit, ThemeState>(
      'check sequence of states',
      build: () => ThemeCubit(
        themeRepository: themeRepository,
        initialState: ThemeState(
          color: Colors.blue,
          prevColor: themeRepository.prevColor,
        ),
      ),
      act: (cubit) {
        cubit.weatherChanged(WeatherCondition.clear);
        cubit.weatherChanged(WeatherCondition.thunderstorm);
      },
      expect: () => [
        equals(ThemeState(
          color: Colors.yellow,
          prevColor: Colors.amber,
        )),
        equals(ThemeState(
          color: Colors.deepPurple,
          prevColor: Colors.yellow,
        ))
      ],
    );
  });
}
