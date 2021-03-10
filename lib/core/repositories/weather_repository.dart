import 'dart:async';

import 'package:vgv_weather_app/core/models/weather.dart';
import 'package:vgv_weather_app/core/repositories/repositories.dart';

class WeatherRepository {
  final WeatherDataProvider weatherApiClient;

  const WeatherRepository({required this.weatherApiClient});

  Future<Weather> getWeather(String city) async {
    final locationId = await weatherApiClient.getLocationId(city);
    return weatherApiClient.fetchWeather(locationId);
  }
}
