import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:vgv_weather_app/core/models/weather.dart';
import 'package:vgv_weather_app/features/theme/repository/theme_repository.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({
    required this.themeRepository,
    required ThemeState initialState,
  }) : super(initialState);

  final ThemeRepository themeRepository;

  void weatherChanged(WeatherCondition condition) {
    switch (condition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        _emitCondition(Colors.yellow);
        break;
      case WeatherCondition.heavyCloud:
        _emitCondition(Colors.grey);
        break;
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
        _emitCondition(Colors.indigo);
        break;
      case WeatherCondition.thunderstorm:
        _emitCondition(Colors.deepPurple);
        break;
      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
      case WeatherCondition.unknown:
        _emitCondition(Colors.lightBlue);
        break;
    }
  }

  void _emitCondition(MaterialColor color) {
    emit(ThemeState(
      color: color,
      prevColor: themeRepository.prevColor,
    ));
    themeRepository.prevColor = color;
  }
}
