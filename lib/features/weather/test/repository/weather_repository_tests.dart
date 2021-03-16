import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgv_core/exceptions/weather_exception.dart';
import 'package:vgv_core/models/export.dart';
import 'package:vgv_weather/repository/weather/export.dart';

class MockWeatherDataProvider extends Mock implements WeatherDataProvider {}

void main() {
  group('WeatherRepository tests', () {
    late WeatherDataProvider dataProvider;

    final succesfullWeather = const Weather(
      temp: 20.0,
      maxTemp: 20.0,
      minTemp: 20.0,
      windSpeed: 5.2,
      humidity: 90,
      condition: WeatherCondition.clear,
      created: 'created',
      formattedCondition: 'Clear',
      location: 'New York',
      locationId: 1,
    );

    setUp(() {
      dataProvider = MockWeatherDataProvider();
      when(() => dataProvider.getLocationId('New York'))
          .thenAnswer((invocation) async => 42);
      when(() => dataProvider.getLocationId(''))
          .thenThrow(const WeatherException('WeatherException'));
      when(() => dataProvider.fetchWeather(42))
          .thenAnswer((invocation) async => succesfullWeather);
      when(() => dataProvider.fetchWeather(0))
          .thenThrow(const WeatherException('WeatherException'));
    });

    test(
      'check correct answer',
      () async {
        final weatherRepo = WeatherRepository(weatherApiClient: dataProvider);
        final result = await weatherRepo.getWeather('New York');
        expect(result, succesfullWeather);
      },
    );

    test(
      'check incorrect answer',
      () async {
        final weatherRepo = WeatherRepository(weatherApiClient: dataProvider);
        try {
          await weatherRepo.getWeather('');
          fail('exception not thrown');
        } catch (e) {
          expect(e, isInstanceOf<WeatherException>());
        }
      },
    );
  });
}
