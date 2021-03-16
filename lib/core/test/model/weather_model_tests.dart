import 'package:flutter_test/flutter_test.dart';

import 'package:vgv_core/models/export.dart';

void main() {
  group('Weather', () {
    test('Check json deserialization', () {
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
  });
}
