import 'package:flutter_test/flutter_test.dart';

import 'package:vgv_core/models/export.dart';

void main() {
  group('Weather', () {
    test('Check Snow deserialization', () {
      expect(
        Weather.fromJson({
          'woeid': 123,
          'title': 'title',
          'consolidated_weather': [
            {
              'min_temp': 20.0,
              'the_temp': 20.0,
              'max_temp': 20.0,
              'wind_speed': 5.2,
              'humidity': 90,
              'weather_state_abbr': 'sn',
              'weather_state_name': 'Snow',
              'created': 'created',
            }
          ]
        }),
        const Weather(
          temp: 20.0,
          maxTemp: 20.0,
          minTemp: 20.0,
          windSpeed: 5.2,
          humidity: 90,
          condition: WeatherCondition.snow,
          created: 'created',
          formattedCondition: 'Snow',
          location: 'title',
          locationId: 123,
        ),
      );
    });

    test('Check Sleet deserialization', () {
      expect(
        Weather.fromJson({
          'woeid': 123,
          'title': 'title',
          'consolidated_weather': [
            {
              'min_temp': 20.0,
              'the_temp': 20.0,
              'max_temp': 20.0,
              'wind_speed': 5.2,
              'humidity': 90,
              'weather_state_abbr': 'sl',
              'weather_state_name': 'Sleet',
              'created': 'created',
            }
          ]
        }),
        const Weather(
          temp: 20.0,
          maxTemp: 20.0,
          minTemp: 20.0,
          windSpeed: 5.2,
          humidity: 90,
          condition: WeatherCondition.sleet,
          created: 'created',
          formattedCondition: 'Sleet',
          location: 'title',
          locationId: 123,
        ),
      );
    });

    test('Check hail deserialization', () {
      expect(
        Weather.fromJson({
          'woeid': 123,
          'title': 'title',
          'consolidated_weather': [
            {
              'min_temp': 20.0,
              'the_temp': 20.0,
              'max_temp': 20.0,
              'wind_speed': 5.2,
              'humidity': 90,
              'weather_state_abbr': 'h',
              'weather_state_name': 'Hail',
              'created': 'created',
            }
          ]
        }),
        const Weather(
          temp: 20.0,
          maxTemp: 20.0,
          minTemp: 20.0,
          windSpeed: 5.2,
          humidity: 90,
          condition: WeatherCondition.hail,
          created: 'created',
          formattedCondition: 'Hail',
          location: 'title',
          locationId: 123,
        ),
      );
    });

    test('Check thunderstorm deserialization', () {
      expect(
        Weather.fromJson({
          'woeid': 123,
          'title': 'title',
          'consolidated_weather': [
            {
              'min_temp': 20.0,
              'the_temp': 20.0,
              'max_temp': 20.0,
              'wind_speed': 5.2,
              'humidity': 90,
              'weather_state_abbr': 't',
              'weather_state_name': 'Thunderstorm',
              'created': 'created',
            }
          ]
        }),
        const Weather(
          temp: 20.0,
          maxTemp: 20.0,
          minTemp: 20.0,
          windSpeed: 5.2,
          humidity: 90,
          condition: WeatherCondition.thunderstorm,
          created: 'created',
          formattedCondition: 'Thunderstorm',
          location: 'title',
          locationId: 123,
        ),
      );
    });

    test('Check heavyRain deserialization', () {
      expect(
        Weather.fromJson({
          'woeid': 123,
          'title': 'title',
          'consolidated_weather': [
            {
              'min_temp': 20.0,
              'the_temp': 20.0,
              'max_temp': 20.0,
              'wind_speed': 5.2,
              'humidity': 90,
              'weather_state_abbr': 'hr',
              'weather_state_name': 'Heavy Rain',
              'created': 'created',
            }
          ]
        }),
        const Weather(
          temp: 20.0,
          maxTemp: 20.0,
          minTemp: 20.0,
          windSpeed: 5.2,
          humidity: 90,
          condition: WeatherCondition.heavyRain,
          created: 'created',
          formattedCondition: 'Heavy Rain',
          location: 'title',
          locationId: 123,
        ),
      );
    });

    test('Check lightRain deserialization', () {
      expect(
        Weather.fromJson({
          'woeid': 123,
          'title': 'title',
          'consolidated_weather': [
            {
              'min_temp': 20.0,
              'the_temp': 20.0,
              'max_temp': 20.0,
              'wind_speed': 5.2,
              'humidity': 90,
              'weather_state_abbr': 'lr',
              'weather_state_name': 'Light Rain',
              'created': 'created',
            }
          ]
        }),
        const Weather(
          temp: 20.0,
          maxTemp: 20.0,
          minTemp: 20.0,
          windSpeed: 5.2,
          humidity: 90,
          condition: WeatherCondition.lightRain,
          created: 'created',
          formattedCondition: 'Light Rain',
          location: 'title',
          locationId: 123,
        ),
      );
    });

    test('Check showers deserialization', () {
      expect(
        Weather.fromJson({
          'woeid': 123,
          'title': 'title',
          'consolidated_weather': [
            {
              'min_temp': 20.0,
              'the_temp': 20.0,
              'max_temp': 20.0,
              'wind_speed': 5.2,
              'humidity': 90,
              'weather_state_abbr': 's',
              'weather_state_name': 'Showers',
              'created': 'created',
            }
          ]
        }),
        const Weather(
          temp: 20.0,
          maxTemp: 20.0,
          minTemp: 20.0,
          windSpeed: 5.2,
          humidity: 90,
          condition: WeatherCondition.showers,
          created: 'created',
          formattedCondition: 'Showers',
          location: 'title',
          locationId: 123,
        ),
      );
    });

    test('Check heavyCloud deserialization', () {
      expect(
        Weather.fromJson({
          'woeid': 123,
          'title': 'title',
          'consolidated_weather': [
            {
              'min_temp': 20.0,
              'the_temp': 20.0,
              'max_temp': 20.0,
              'wind_speed': 5.2,
              'humidity': 90,
              'weather_state_abbr': 'hc',
              'weather_state_name': 'Heavy Cloud',
              'created': 'created',
            }
          ]
        }),
        const Weather(
          temp: 20.0,
          maxTemp: 20.0,
          minTemp: 20.0,
          windSpeed: 5.2,
          humidity: 90,
          condition: WeatherCondition.heavyCloud,
          created: 'created',
          formattedCondition: 'Heavy Cloud',
          location: 'title',
          locationId: 123,
        ),
      );
    });

    test('Check lightCloud deserialization', () {
      expect(
        Weather.fromJson({
          'woeid': 123,
          'title': 'title',
          'consolidated_weather': [
            {
              'min_temp': 20.0,
              'the_temp': 20.0,
              'max_temp': 20.0,
              'wind_speed': 5.2,
              'humidity': 90,
              'weather_state_abbr': 'lc',
              'weather_state_name': 'Light Cloud',
              'created': 'created',
            }
          ]
        }),
        const Weather(
          temp: 20.0,
          maxTemp: 20.0,
          minTemp: 20.0,
          windSpeed: 5.2,
          humidity: 90,
          condition: WeatherCondition.lightCloud,
          created: 'created',
          formattedCondition: 'Light Cloud',
          location: 'title',
          locationId: 123,
        ),
      );
    });

    test('Check Clear deserialization', () {
      expect(
        Weather.fromJson({
          'woeid': 123,
          'title': 'title',
          'consolidated_weather': [
            {
              'min_temp': 20.0,
              'the_temp': 20.0,
              'max_temp': 20.0,
              'wind_speed': 5.2,
              'humidity': 90,
              'weather_state_abbr': 'c',
              'weather_state_name': 'Clear',
              'created': 'created',
            }
          ]
        }),
        const Weather(
          temp: 20.0,
          maxTemp: 20.0,
          minTemp: 20.0,
          windSpeed: 5.2,
          humidity: 90,
          condition: WeatherCondition.clear,
          created: 'created',
          formattedCondition: 'Clear',
          location: 'title',
          locationId: 123,
        ),
      );
    });

    test('Check Unknown deserialization', () {
      expect(
        Weather.fromJson({
          'woeid': 123,
          'title': 'title',
          'consolidated_weather': [
            {
              'min_temp': 20.0,
              'the_temp': 20.0,
              'max_temp': 20.0,
              'wind_speed': 5.2,
              'humidity': 90,
              'weather_state_abbr': 'sdgrcgctgrtfh',
              'weather_state_name': 'Unknown',
              'created': 'created',
            }
          ]
        }),
        const Weather(
          temp: 20.0,
          maxTemp: 20.0,
          minTemp: 20.0,
          windSpeed: 5.2,
          humidity: 90,
          condition: WeatherCondition.unknown,
          created: 'created',
          formattedCondition: 'Unknown',
          location: 'title',
          locationId: 123,
        ),
      );
    });
  });
}
