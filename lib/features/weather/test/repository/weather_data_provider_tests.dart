import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgv_core/exceptions/weather_exception.dart';
// import 'package:vgv_core/models/export.dart';
import 'package:vgv_weather/repository/weather/export.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  group('WeatherDataProvide tests', () {
    late Client httpClient;

    final locationEndpoint =
        'https://www.metaweather.com/api/location/search/?query=Chicago';
    final weatherEndpoint = 'https://www.metaweather.com/api/location/2379574';
    final incorectLocationEndpoint =
        'https://www.metaweather.com/api/location/search/?query=';
    final incorectWeatherEndpoint =
        'https://www.metaweather.com/api/location/0';

    setUp(() {
      httpClient = MockHttpClient();

      when(() => httpClient.get(Uri.parse(locationEndpoint)))
          .thenAnswer((invocation) async => Response(
                // ignore: lines_longer_than_80_chars
                '[{"title":"New York","location_type":"City","woeid":2379574,"latt_long":"41.884151,-87.632408"}]',
                200,
              ));
      when(() => httpClient.get(Uri.parse(weatherEndpoint)))
          .thenAnswer((invocation) async => Response(
                '{"consolidated_weather":[{"id":4582386592382976,"weather_state_name":"Heavy Cloud","weather_state_abbr":"hc","wind_direction_compass":"NE","created":"2021-03-14T21:24:20.578011Z","applicable_date":"2021-03-14","min_temp":2.395,"max_temp":7.5649999999999995,"the_temp":6.22,"wind_speed":10.503004429576606,"wind_direction":43.0,"air_pressure":1029.5,"humidity":54,"visibility":14.374179790026247,"predictability":71},{"id":4509468114026496,"weather_state_name":"Snow","weather_state_abbr":"sn","wind_direction_compass":"E","created":"2021-03-14T21:24:23.578353Z","applicable_date":"2021-03-15","min_temp":-1.705,"max_temp":2.74,"the_temp":0.19,"wind_speed":11.756327805731859,"wind_direction":98.0,"air_pressure":1022.5,"humidity":63,"visibility":7.435638371908057,"predictability":90},{"id":6429879324114944,"weather_state_name":"Light Rain","weather_state_abbr":"lr","wind_direction_compass":"NNE","created":"2021-03-14T21:24:26.654391Z","applicable_date":"2021-03-16","min_temp":0.255,"max_temp":3.035,"the_temp":3.505,"wind_speed":5.4712631786208545,"wind_direction":17.5,"air_pressure":1014.5,"humidity":86,"visibility":8.609408554044382,"predictability":75},{"id":6322548175273984,"weather_state_name":"Showers","weather_state_abbr":"s","wind_direction_compass":"NE","created":"2021-03-14T21:24:29.666056Z","applicable_date":"2021-03-17","min_temp":0.69,"max_temp":3.6,"the_temp":5.32,"wind_speed":6.305277643007503,"wind_direction":45.666636577940416,"air_pressure":1018.0,"humidity":68,"visibility":11.82127624671916,"predictability":73},{"id":5448680623570944,"weather_state_name":"Light Rain","weather_state_abbr":"lr","wind_direction_compass":"NE","created":"2021-03-14T21:24:33.073302Z","applicable_date":"2021-03-18","min_temp":1.69,"max_temp":5.175,"the_temp":5.53,"wind_speed":15.618806385954029,"wind_direction":36.99714451257869,"air_pressure":1015.5,"humidity":69,"visibility":7.575757575757575,"predictability":75},{"id":4649735907442688,"weather_state_name":"Heavy Cloud","weather_state_abbr":"hc","wind_direction_compass":"NE","created":"2021-03-14T21:24:35.796503Z","applicable_date":"2021-03-19","min_temp":-0.165,"max_temp":4.33,"the_temp":2.83,"wind_speed":10.309113576712003,"wind_direction":41.49999999999999,"air_pressure":1029.0,"humidity":46,"visibility":9.999726596675416,"predictability":71}],"time":"2021-03-14T17:33:13.799290-05:00","sun_rise":"2021-03-14T07:03:32.624432-05:00","sun_set":"2021-03-14T18:56:20.160889-05:00","timezone_name":"LMT","parent":{"title":"Illinois","location_type":"Region / State / Province","woeid":2347572,"latt_long":""},"sources":[{"title":"BBC","slug":"bbc","url":"http://www.bbc.co.uk/weather/","crawl_rate":360},{"title":"Forecast.io","slug":"forecast-io","url":"http://forecast.io/","crawl_rate":480},{"title":"HAMweather","slug":"hamweather","url":"http://www.hamweather.com/","crawl_rate":360},{"title":"Met Office","slug":"met-office","url":"http://www.metoffice.gov.uk/","crawl_rate":180},{"title":"OpenWeatherMap","slug":"openweathermap","url":"http://openweathermap.org/","crawl_rate":360},{"title":"Weather Underground","slug":"wunderground","url":"https://www.wunderground.com/?apiref=fc30dc3cd224e19b","crawl_rate":720},{"title":"World Weather Online","slug":"world-weather-online","url":"http://www.worldweatheronline.com/","crawl_rate":360}],"title":"Chicago","location_type":"City","woeid":2379574,"latt_long":"41.884151,-87.632408","timezone":"US/Central"}',
                200,
              ));
      when(() => httpClient.get(Uri.parse(incorectLocationEndpoint)))
          .thenAnswer((invocation) async => Response('', 500));
      when(() => httpClient.get(Uri.parse(incorectWeatherEndpoint)))
          .thenAnswer((invocation) async => Response('', 500));
    });

    test(
      'check correct getLocationId()',
      () async {
        final weatherDataProvider = WeatherDataProvider(httpClient: httpClient);
        final result = await weatherDataProvider.getLocationId('Chicago');
        expect(result, 2379574);
      },
    );

    test(
      'check correct fetchWeather()',
      () async {
        final weatherDataProvider = WeatherDataProvider(httpClient: httpClient);
        final result = await weatherDataProvider.fetchWeather(2379574);
        expect(result.temp, 6.22);
      },
    );

    test(
      'check incorrect getLocationId()',
      () async {
        final weatherDataProvider = WeatherDataProvider(httpClient: httpClient);
        try {
          await weatherDataProvider.getLocationId('');
          fail('exception not thrown');
        } catch (e) {
          expect(e, isInstanceOf<WeatherException>());
        }
      },
    );

    test(
      'check incorrect fetchWeather()',
      () async {
        final weatherDataProvider = WeatherDataProvider(httpClient: httpClient);
        try {
          await weatherDataProvider.fetchWeather(0);
          fail('exception not thrown');
        } catch (e) {
          expect(e, isInstanceOf<WeatherException>());
        }
      },
    );
  });
}
