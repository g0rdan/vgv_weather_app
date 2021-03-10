import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vgv_weather_app/core/models/weather.dart';

class WeatherDataProvider {
  static const baseUrl = 'https://www.metaweather.com';
  final http.Client httpClient;

  const WeatherDataProvider({required this.httpClient});

  Future<int> getLocationId(String city) async {
    final locationUrl = Uri.parse('$baseUrl/api/location/search/?query=$city');
    final locationResponse = await httpClient.get(locationUrl);
    if (locationResponse.statusCode != 200) {
      throw Exception('error getting locationId for city');
    }

    final locationJson = jsonDecode(locationResponse.body) as List;
    return locationJson.first['woeid'];
  }

  Future<Weather> fetchWeather(int locationId) async {
    final weatherUrl = Uri.parse('$baseUrl/api/location/$locationId');
    final weatherResponse = await httpClient.get(weatherUrl);

    if (weatherResponse.statusCode != 200) {
      throw Exception('error getting weather for location');
    }

    final weatherJson = jsonDecode(weatherResponse.body);
    return Weather.fromJson(weatherJson);
  }
}
