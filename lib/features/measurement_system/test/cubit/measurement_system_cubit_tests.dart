import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:vgv_core/models/export.dart';
import 'package:vgv_weather_measurement_system/cubit/measurement_system_cubit.dart';

void main() {
  group('TemperatureSwitchCubit', () {
    test('initial state is fahrenheit', () {
      expect(
          MeasurementSystemCubit().state,
          equals(
            const MeasurementSystemState(
              temperatureUnits: MeasurementSystemEnum.imperial,
            ),
          ));
    });

    blocTest<MeasurementSystemCubit, MeasurementSystemState>(
      'emits celsius state after toggle() calling',
      build: () => MeasurementSystemCubit(),
      act: (cubit) => cubit.toggle(),
      expect: () => [
        equals(const MeasurementSystemState(
          temperatureUnits: MeasurementSystemEnum.metric,
        ))
      ],
    );

    blocTest<MeasurementSystemCubit, MeasurementSystemState>(
      'emits fahrenheit state back after double toggle() calling',
      build: () => MeasurementSystemCubit(),
      act: (cubit) {
        cubit.toggle();
        // ignore: cascade_invocations
        cubit.toggle();
      },
      expect: () => [
        equals(const MeasurementSystemState(
          temperatureUnits: MeasurementSystemEnum.metric,
        )),
        equals(const MeasurementSystemState(
          temperatureUnits: MeasurementSystemEnum.imperial,
        ))
      ],
    );
  });
}
