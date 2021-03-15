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
      // ignore: cascade_invocations
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
        equals(const ThemeState(
          color: Colors.lime,
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
        // ignore: cascade_invocations
        cubit.weatherChanged(WeatherCondition.thunderstorm);
      },
      expect: () => [
        equals(const ThemeState(
          color: Colors.lime,
          prevColor: Colors.amber,
        )),
        equals(const ThemeState(
          color: Colors.deepPurple,
          prevColor: Colors.lime,
        ))
      ],
    );
  });
}
