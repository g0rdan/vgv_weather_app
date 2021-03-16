import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vgv_weather_measurement_system/cubit/measurement_system_cubit.dart';
import 'package:vgv_weather_measurement_system/view/export.dart';

void main() {
  group('TemperatureSwitchState', () {
    late MeasurementSystemCubit cubit;

    setUp(() {
      cubit = MeasurementSystemCubit();
    });

    testWidgets('renders TemperatureSwitchState', (tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: cubit,
          child: MaterialApp(
            home: Scaffold(
              body: MeasurementSystemSwitch(),
            ),
          ),
        ),
      );
      expect(find.byType(MeasurementSystemSwitch), findsOneWidget);
    });

    testWidgets('find title', (tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: cubit,
          child: MaterialApp(
            home: Scaffold(
              body: MeasurementSystemSwitch(),
            ),
          ),
        ),
      );
      expect(find.textContaining('Metric system'), findsOneWidget);
    });

    testWidgets('find description', (tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: cubit,
          child: MaterialApp(
            home: Scaffold(
              body: MeasurementSystemSwitch(),
            ),
          ),
        ),
      );
      expect(
        find.textContaining('Use metric system for the temperature.'),
        findsOneWidget,
      );
    });

    testWidgets('find toggle', (tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: cubit,
          child: MaterialApp(
            home: Scaffold(
              body: MeasurementSystemSwitch(),
            ),
          ),
        ),
      );

      final toggle = find.byKey(const Key('temperature_switch'));
      await tester.tap(toggle);

      expect(find.byType(Switch), findsOneWidget);
    });
  });
}
