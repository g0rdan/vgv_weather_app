import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgv_weather_app/core/models/models.dart';
import 'package:vgv_weather_app/features/temperature_switch/cubit/temperature_switch_cubit.dart';

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
              title: const Text('Temperature Units'),
              isThreeLine: true,
              subtitle: const Text(
                'Use metric measurements for temperature units.',
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
