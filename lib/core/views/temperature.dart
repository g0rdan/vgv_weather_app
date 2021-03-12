import 'package:flutter/material.dart';
import 'package:vgv_weather_app/core/models/models.dart';

class Temperature extends StatelessWidget {
  const Temperature({
    required this.temperature,
    required this.low,
    required this.high,
    required this.unit,
  });

  final double temperature;
  final double low;
  final double high;
  final TemperatureUnit unit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Text(
            '${_formattedTemperature(temperature)}°',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        Column(
          children: [
            Text(
              'max: ${_formattedTemperature(high)}°',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w100,
                color: Colors.white,
              ),
            ),
            Text(
              'min: ${_formattedTemperature(low)}°',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w100,
                color: Colors.white,
              ),
            )
          ],
        )
      ],
    );
  }

  int _toFahrenheit(double celsius) => ((celsius * 9 / 5) + 32).round();

  int _formattedTemperature(double t) =>
      unit == TemperatureUnit.fahrenheit ? _toFahrenheit(t) : t.round();
}
