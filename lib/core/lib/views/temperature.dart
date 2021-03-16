import 'package:flutter/material.dart';
import 'package:vgv_core/models/export.dart';

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
  final MeasurementSystemEnum unit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Text(
            '${_formattedTemperature(temperature)}°',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
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
        ),
      ],
    );
  }

  int _toFahrenheit(double celsius) => ((celsius * 9 / 5) + 32).round();

  int _formattedTemperature(double t) =>
      unit == MeasurementSystemEnum.imperial ? _toFahrenheit(t) : t.round();
}
