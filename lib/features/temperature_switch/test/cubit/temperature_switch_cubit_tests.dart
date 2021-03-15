import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:vgv_core/models/export.dart';
import 'package:vgv_weather_temperature_switch/cubit/temperature_switch_cubit.dart';

void main() {
  group('TemperatureSwitchCubit', () {
    test('initial state is fahrenheit', () {
      expect(
          TemperatureSwitchCubit().state,
          equals(
            const TemperatureSwitchState(
              temperatureUnits: TemperatureUnit.fahrenheit,
            ),
          ));
    });

    blocTest<TemperatureSwitchCubit, TemperatureSwitchState>(
      'emits celsius state after toggle() calling',
      build: () => TemperatureSwitchCubit(),
      act: (cubit) => cubit.toggle(),
      expect: () => [
        equals(const TemperatureSwitchState(
          temperatureUnits: TemperatureUnit.celsius,
        ))
      ],
    );

    blocTest<TemperatureSwitchCubit, TemperatureSwitchState>(
      'emits fahrenheit state back after double toggle() calling',
      build: () => TemperatureSwitchCubit(),
      act: (cubit) {
        cubit.toggle();
        // ignore: cascade_invocations
        cubit.toggle();
      },
      expect: () => [
        equals(const TemperatureSwitchState(
          temperatureUnits: TemperatureUnit.celsius,
        )),
        equals(const TemperatureSwitchState(
          temperatureUnits: TemperatureUnit.fahrenheit,
        ))
      ],
    );
  });
}
