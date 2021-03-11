import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(const SettingsState(
          temperatureUnits: TemperatureUnit.fahrenheit,
        ));

  void toggle() => emit(
        state.temperatureUnits == TemperatureUnit.fahrenheit
            ? const SettingsState(
                temperatureUnits: TemperatureUnit.celsius,
              )
            : const SettingsState(
                temperatureUnits: TemperatureUnit.fahrenheit,
              ),
      );
}
