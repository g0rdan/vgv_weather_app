import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgv_weather_app/core/models/models.dart';
import 'package:vgv_weather_app/settings/cubit/settings_cubit.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        children: <Widget>[
          BlocBuilder<SettingsCubit, SettingsState>(builder: (context, state) {
            return ListTile(
              title: const Text('Temperature Units'),
              isThreeLine: true,
              subtitle: const Text(
                'Use metric measurements for temperature units.',
              ),
              trailing: Switch(
                value: _isMetric(state),
                onChanged: (_) =>
                    BlocProvider.of<SettingsCubit>(context).toggle(),
              ),
            );
          }),
        ],
      ),
    );
  }

  bool _isMetric(SettingsState state) {
    return state.temperatureUnits == TemperatureUnit.celsius;
  }
}
