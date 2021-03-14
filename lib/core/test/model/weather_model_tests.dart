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
              'weather_state_abbr': 'sn',
              'weather_state_name': 'Snow',
              'min_temp': 20.0,
              'the_temp': 20.0,
              'max_temp': 20.0,
              'created': 'created',
            }
          ]
        }),
        const Weather(
          condition: WeatherCondition.snow,
          created: 'created',
          formattedCondition: 'Snow',
          location: 'title',
          locationId: 123,
          maxTemp: 20.0,
          minTemp: 20.0,
          temp: 20.0,
        ),
      );
    });
  });
}
