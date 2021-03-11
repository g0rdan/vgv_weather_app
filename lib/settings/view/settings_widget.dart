import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgv_weather_app/settings/cubit/settings_cubit.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: <Widget>[
          BlocBuilder<SettingsCubit, SettingsState>(builder: (context, state) {
            return ListTile(
              title: const Text('Temperature Units'),
              isThreeLine: true,
              subtitle: const Text(
                'Use metric measurements for temperature units.',
              ),
              trailing: Switch(
                value: state.temperatureUnits == TemperatureUnit.celsius,
                onChanged: (_) =>
                    BlocProvider.of<SettingsCubit>(context).toggle(),
              ),
            );
          }),
        ],
      ),
    );
  }
}
