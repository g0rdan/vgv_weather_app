import 'package:flutter/material.dart';
import 'package:vgv_core/models/weather_condition.dart';

class WeatherConditions extends StatelessWidget {
  const WeatherConditions({required this.condition});

  final WeatherCondition condition;

  @override
  Widget build(BuildContext context) => _mapConditionToImage(condition);

  Image _mapConditionToImage(WeatherCondition condition) {
    AssetImage image;
    switch (condition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
      case WeatherCondition.unknown:
        image = const AssetImage(
          'assets/sun.gif',
          package: 'vgv_weather',
        );
        break;
      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
        image = const AssetImage(
          'assets/snow.gif',
          package: 'vgv_weather',
        );
        break;
      case WeatherCondition.heavyCloud:
        image = const AssetImage(
          'assets/cloud.gif',
          package: 'vgv_weather',
        );
        break;
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
        image = const AssetImage(
          'assets/rain.gif',
          package: 'vgv_weather',
        );
        break;
      case WeatherCondition.thunderstorm:
        image = const AssetImage(
          'assets/thunderstorm.gif',
          package: 'vgv_weather',
        );
        break;
    }
    return Image(image: image);
  }
}
