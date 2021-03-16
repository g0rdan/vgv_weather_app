import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgv_core/models/export.dart';
import 'package:vgv_weather_measurement_system/cubit/measurement_system_cubit.dart';

class MeasurementSystemSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        children: <Widget>[
          BlocBuilder<MeasurementSystemCubit, MeasurementSystemState>(builder: (
            context,
            state,
          ) {
            return ListTile(
              title: const Text(
                'Metric system',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                ),
              ),
              isThreeLine: true,
              subtitle: const Text(
                'Use metric system for the temperature.',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                ),
              ),
              trailing: Switch(
                key: const Key('temperature_switch'),
                value: _isMetric(state),
                onChanged: (_) =>
                    BlocProvider.of<MeasurementSystemCubit>(context).toggle(),
              ),
            );
          }),
        ],
      ),
    );
  }

  bool _isMetric(MeasurementSystemState state) {
    return state.temperatureUnits == MeasurementSystemEnum.metric;
  }
}
