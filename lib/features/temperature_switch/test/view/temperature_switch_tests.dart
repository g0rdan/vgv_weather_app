import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgv_core/models/export.dart';
import 'package:vgv_weather_temperature_switch/cubit/temperature_switch_cubit.dart';
import 'package:vgv_weather_temperature_switch/view/export.dart';

class MockTemperatureSwitchCubit extends MockCubit<TemperatureSwitchState>
    implements TemperatureSwitchCubit {}

void main() {
  group('TemperatureSwitchState', () {
    late TemperatureSwitchCubit cubit;

    setUp(() {
      cubit = MockTemperatureSwitchCubit();
      when(cubit).calls(#state).thenReturn(
          TemperatureSwitchState(temperatureUnits: TemperatureUnit.celsius));
    });

    testWidgets('renders TemperatureSwitchState', (tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: cubit,
          child: MaterialApp(
            home: Scaffold(
              body: TemperatureSwitch(),
            ),
          ),
        ),
      );
      expect(find.byType(TemperatureSwitch), findsOneWidget);
    });

    testWidgets('find title', (tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: cubit,
          child: MaterialApp(
            home: Scaffold(
              body: TemperatureSwitch(),
            ),
          ),
        ),
      );
      expect(find.textContaining('Temperature Units'), findsOneWidget);
    });

    testWidgets('find description', (tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: cubit,
          child: MaterialApp(
            home: Scaffold(
              body: TemperatureSwitch(),
            ),
          ),
        ),
      );
      expect(
        find.textContaining('Use metric measurements for temperature units.'),
        findsOneWidget,
      );
    });

    testWidgets('find toggle', (tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: cubit,
          child: MaterialApp(
            home: Scaffold(
              body: TemperatureSwitch(),
            ),
          ),
        ),
      );
      expect(find.byType(Switch), findsOneWidget);
    });
  });
}