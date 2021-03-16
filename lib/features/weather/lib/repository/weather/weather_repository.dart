import 'dart:async';

import 'package:vgv_core/models/export.dart';
import 'package:vgv_weather/repository/weather/export.dart';

class WeatherRepository {
  const WeatherRepository({required this.weatherApiClient});

  final WeatherDataProvider weatherApiClient;

  Future<Weather> getForecast(String city) async {
    final locationId = await weatherApiClient.getLocationId(city);
    return weatherApiClient.fetchWeather(locationId);
  }
}
