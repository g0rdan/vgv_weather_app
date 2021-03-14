import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vgv_weather_city/bloc/city_selection_bloc.dart';

void main() {
  group('CitySelectionBloc', () {
    blocTest<CitySelectionBloc, CitySelectionState>(
      'should return New York',
      build: () => CitySelectionBloc(),
      act: (CitySelectionBloc bloc) async =>
          bloc.add(CitySelected(name: 'New York')),
      expect: () => <CitySelectionState>[CityNameSubmitted(name: 'New York')],
    );

    blocTest<CitySelectionBloc, CitySelectionState>(
      'should not return anything',
      build: () => CitySelectionBloc(),
      act: (CitySelectionBloc bloc) async => bloc.add(CitySelected(name: '')),
      expect: () => <CitySelectionState>[],
    );

    blocTest<CitySelectionBloc, CitySelectionState>(
      'should return New Y',
      build: () => CitySelectionBloc(),
      act: (CitySelectionBloc bloc) async =>
          bloc.add(CityChanged(text: 'New Y')),
      expect: () => <CitySelectionState>[CityNameChanged(name: 'New Y')],
    );

    blocTest<CitySelectionBloc, CitySelectionState>(
      'should return empty string',
      build: () => CitySelectionBloc(),
      act: (CitySelectionBloc bloc) async => bloc.add(CityChanged(text: '')),
      expect: () => <CitySelectionState>[CityNameChanged(name: '')],
    );
  });
}
