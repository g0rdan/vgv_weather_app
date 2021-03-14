import 'dart:async';

import 'package:vgv_core/models/export.dart';
import 'package:vgv_weather_app/features/weather/repository/weather/weather_data_provider.dart';

class WeatherRepository {
  const WeatherRepository({required this.weatherApiClient});

  final WeatherDataProvider weatherApiClient;

  Future<Weather> getWeather(String city) async {
    final locationId = await weatherApiClient.getLocationId(city);
    return weatherApiClient.fetchWeather(locationId);
  }
}
