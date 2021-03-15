import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vgv_weather_city/bloc/city_selection_bloc.dart';
import 'package:vgv_weather_city/view/export.dart';

void main() {
  group('City selection', () {
    testWidgets('render city selection', (tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: CitySelectionBloc(),
          child: MaterialApp(
            home: Scaffold(
              body: CitySelection(),
            ),
          ),
        ),
      );
      expect(find.byType(TextFormField), findsOneWidget);
    });

    testWidgets('check if shows city name', (tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: CitySelectionBloc(),
          child: MaterialApp(
            home: Scaffold(
              body: CitySelection(),
            ),
          ),
        ),
      );
      expect(find.text('New York'), findsOneWidget);
    });

    testWidgets('check tap on find', (tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: CitySelectionBloc(),
          child: MaterialApp(
            home: Scaffold(
              body: CitySelection(),
            ),
          ),
        ),
      );

      final textField = find.byKey(const Key('text_form_field'));
      await tester.tap(textField);
      await tester.enterText(textField, 'Hello!');

      final searchButton = find.byKey(const Key('search_button'));
      await tester.tap(searchButton);

      expect(find.text('Hello!'), findsOneWidget);
    });
  });
}
