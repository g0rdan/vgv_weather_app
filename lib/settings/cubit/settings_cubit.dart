import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vgv_weather_app/core/models/models.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(
            const SettingsState(temperatureUnits: TemperatureUnit.fahrenheit));

  void toggle() {
    state.temperatureUnits == TemperatureUnit.fahrenheit
        ? emit(const SettingsState(
            temperatureUnits: TemperatureUnit.celsius,
          ))
        : emit(const SettingsState(
            temperatureUnits: TemperatureUnit.fahrenheit,
          ));
  }
}
