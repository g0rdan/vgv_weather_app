import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vgv_weather_app/core/models/models.dart';

part 'temperature_switch_state.dart';

class TemperatureSwitchCubit extends Cubit<TemperatureSwitchState> {
  TemperatureSwitchCubit()
      : super(const TemperatureSwitchState(
          temperatureUnits: TemperatureUnit.fahrenheit,
        ));

  void toggle() {
    state.temperatureUnits == TemperatureUnit.fahrenheit
        ? emit(const TemperatureSwitchState(
            temperatureUnits: TemperatureUnit.celsius,
          ))
        : emit(const TemperatureSwitchState(
            temperatureUnits: TemperatureUnit.fahrenheit,
          ));
  }
}
