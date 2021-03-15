import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgv_core/models/export.dart';
import 'package:vgv_core/views/export.dart';
import 'package:vgv_weather_temperature_switch/cubit/temperature_switch_cubit.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({required this.weather});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Text(
            weather.formattedCondition,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w200,
              color: Colors.white,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: WeatherConditions(condition: weather.condition),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              // ignore: lines_longer_than_80_chars
              child:
                  BlocBuilder<TemperatureSwitchCubit, TemperatureSwitchState>(
                builder: (context, state) {
                  return Temperature(
                    temperature: weather.temp,
                    high: weather.maxTemp,
                    low: weather.minTemp,
                    unit: state.temperatureUnits,
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}