import 'package:flutter_test/flutter_test.dart';
import 'package:vgv_core/models/export.dart';
import 'package:vgv_core/models/weather_condition.dart';
import 'package:vgv_core/views/export.dart';
import '../helpers/helpers.dart';

void main() {
  group('LastUpdated', () {
    testWidgets('renders LastUpdated', (tester) async {
      await tester.pumpApp(LastUpdated());
      expect(find.byType(LastUpdated), findsOneWidget);
    });

    testWidgets('Shows rigth text in LastUpdated', (tester) async {
      await tester.pumpApp(LastUpdated());
      expect(find.textContaining('Updated:'), findsOneWidget);
    });
  });

  group('Weather Condition', () {
    // testWidgets('renders WeatherConditions', (tester) async {
    //   final condition = WeatherCondition.clear;
    //   await tester.pumpApp(WeatherConditions(condition: condition));
    //   expect(tester.takeException(), isInstanceOf<Exception>());

    // expect(find.byType(WeatherConditions), findsOneWidget);
    // });

    // testWidgets('Shows rigth text in LastUpdated', (tester) async {
    //   await tester.pumpApp(LastUpdated());
    //   expect(find.textContaining('Updated:'), findsOneWidget);
    // });
  });

  group('Location', () {
    testWidgets('renders Location', (tester) async {
      await tester.pumpApp(const Location(location: ''));
      expect(find.byType(Location), findsOneWidget);
    });

    testWidgets('Shows rigth text in Location', (tester) async {
      final location = 'New York';
      await tester.pumpApp(Location(location: location));
      expect(find.textContaining(location), findsOneWidget);
    });
  });

  group('Temperature', () {
    testWidgets('renders Temperature', (tester) async {
      await tester.pumpApp(const Temperature(
        high: 0.0,
        low: 0.0,
        temperature: 0.0,
        unit: MeasurementSystemEnum.metric,
      ));
      expect(find.byType(Temperature), findsOneWidget);
    });

    testWidgets('Shows rigth temperature data', (tester) async {
      await tester.pumpApp(const Temperature(
        high: 20.0,
        low: 20.0,
        temperature: 20.0,
        unit: MeasurementSystemEnum.metric,
      ));
      expect(find.textContaining('min: 20'), findsOneWidget);
      expect(find.textContaining('max: 20'), findsOneWidget);
    });

    testWidgets('Check temperature units', (tester) async {
      await tester.pumpApp(const Temperature(
        high: 20.0,
        low: 20.0,
        temperature: 20.0,
        unit: MeasurementSystemEnum.imperial,
      ));
      expect(find.textContaining('min: 68'), findsOneWidget);
      expect(find.textContaining('max: 68'), findsOneWidget);
    });
  });
}
