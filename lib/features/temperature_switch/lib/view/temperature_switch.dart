import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgv_weather_temperature_switch/cubit/temperature_switch_cubit.dart';
import 'package:vgv_core/models/export.dart';

class TemperatureSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        children: <Widget>[
          BlocBuilder<TemperatureSwitchCubit, TemperatureSwitchState>(builder: (
            context,
            state,
          ) {
            return ListTile(
              title: const Text('Metric system'),
              isThreeLine: true,
              subtitle: const Text(
                'Use metric system for the temperature.',
              ),
              trailing: Switch(
                value: _isMetric(state),
                onChanged: (_) =>
                    BlocProvider.of<TemperatureSwitchCubit>(context).toggle(),
              ),
            );
          }),
        ],
      ),
    );
  }

  bool _isMetric(TemperatureSwitchState state) {
    return state.temperatureUnits == TemperatureUnit.celsius;
  }
}
