import 'package:equatable/equatable.dart';
import 'package:vgv_core/models/weather_condition.dart';

class Weather extends Equatable {
  const Weather({
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.windSpeed,
    required this.humidity,
    required this.condition,
    required this.formattedCondition,
    required this.locationId,
    required this.created,
    required this.location,
  });

  final double temp;
  final double minTemp;
  final double maxTemp;
  final double windSpeed;
  final int humidity;
  final WeatherCondition condition;
  final String formattedCondition;
  final int locationId;
  final String created;
  final String location;

  @override
  List<Object> get props => [
        temp,
        minTemp,
        maxTemp,
        windSpeed,
        humidity,
        condition,
        formattedCondition,
        locationId,
        created,
        location,
      ];

  static Weather fromJson(dynamic json) {
    final consolidatedWeather = json['consolidated_weather'][0];
    return Weather(
      temp: consolidatedWeather['the_temp'] as double,
      minTemp: consolidatedWeather['min_temp'] as double,
      maxTemp: consolidatedWeather['max_temp'] as double,
      windSpeed: consolidatedWeather['wind_speed'] as double,
      humidity: consolidatedWeather['humidity'] as int,
      condition: _mapStringToWeatherCondition(
          consolidatedWeather['weather_state_abbr']),
      formattedCondition: consolidatedWeather['weather_state_name'],
      locationId: json['woeid'] as int,
      created: consolidatedWeather['created'],
      location: json['title'],
    );
  }

  static WeatherCondition _mapStringToWeatherCondition(String input) {
    WeatherCondition state;
    switch (input) {
      case 'sn':
        state = WeatherCondition.snow;
        break;
      case 'sl':
        state = WeatherCondition.sleet;
        break;
      case 'h':
        state = WeatherCondition.hail;
        break;
      case 't':
        state = WeatherCondition.thunderstorm;
        break;
      case 'hr':
        state = WeatherCondition.heavyRain;
        break;
      case 'lr':
        state = WeatherCondition.lightRain;
        break;
      case 's':
        state = WeatherCondition.showers;
        break;
      case 'hc':
        state = WeatherCondition.heavyCloud;
        break;
      case 'lc':
        state = WeatherCondition.lightCloud;
        break;
      case 'c':
        state = WeatherCondition.clear;
        break;
      default:
        state = WeatherCondition.unknown;
    }
    return state;
  }
}
