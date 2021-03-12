import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgv_weather_app/core/models/models.dart';
import 'package:vgv_weather_app/core/views/widgets.dart';
import 'package:vgv_weather_app/settings/cubit/settings_cubit.dart';

class CombinedWeatherTemperature extends StatelessWidget {
  const CombinedWeatherTemperature({required this.weather});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: WeatherConditions(condition: weather.condition),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocBuilder<SettingsCubit, SettingsState>(
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
      ],
    );
  }
}
