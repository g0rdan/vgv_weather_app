import 'package:flutter/material.dart';
import 'package:vgv_core/models/weather_condition.dart';

class WeatherConditions extends StatelessWidget {
  const WeatherConditions({required this.condition});

  final WeatherCondition condition;

  @override
  Widget build(BuildContext context) => _mapConditionToImage(condition);

  Image _mapConditionToImage(WeatherCondition condition) {
    Image image;
    switch (condition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
      case WeatherCondition.unknown:
        image = Image.asset('assets/sun.gif');
        break;
      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
        image = Image.asset('assets/snow.gif');
        break;
      case WeatherCondition.heavyCloud:
        image = Image.asset('assets/cloud.gif');
        break;
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
        image = Image.asset('assets/rain.gif');
        break;
      case WeatherCondition.thunderstorm:
        image = Image.asset('assets/thunderstorm.gif');
        break;
    }
    return image;
  }
}
