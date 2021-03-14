import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:vgv_weather_city/bloc/city_selection_bloc.dart';
import 'package:vgv_weather_city/view/export.dart';

class MockCitySelectionBloc
    extends MockBloc<CitySelectionEvent, CitySelectionState>
    implements CitySelectionBloc {}

void main() {
  group('City selection', () {
    late CitySelectionBloc bloc;

    setUp(() {
      bloc = MockCitySelectionBloc();
    });

    testWidgets('render city selection', (tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: bloc,
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
      whenListen(
        bloc,
        Stream.fromIterable([CityNameSubmitted(name: 'New York')]),
        initialState: CitySelectionInitial(),
      );
      await tester.pumpWidget(
        BlocProvider.value(
          value: bloc,
          child: MaterialApp(
            home: Scaffold(
              body: CitySelection(),
            ),
          ),
        ),
      );
      expect(find.text('New York'), findsOneWidget);
    });
  });
}
