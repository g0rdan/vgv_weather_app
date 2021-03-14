import 'package:flutter/widgets.dart';
import 'package:vgv_core/models/export.dart';
import 'package:vgv_core/views/export.dart';
import 'package:vgv_weather_app/features/weather/view/export.dart';

class ForecastView extends StatelessWidget {
  const ForecastView({
    required this.weather,
    Key? key,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Center(
              child: Location(location: weather.location),
            ),
          ),
          Center(
            child: LastUpdated(dateTime: weather.lastUpdated),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Center(
              child: WeatherInfo(weather: weather),
            ),
          ),
        ],
      ),
    );
  }
}
