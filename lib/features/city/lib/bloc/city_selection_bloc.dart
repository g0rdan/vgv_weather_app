import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'city_selection_event.dart';
part 'city_selection_state.dart';

class CitySelectionBloc extends Bloc<CitySelectionEvent, CitySelectionState> {
  CitySelectionBloc() : super(CitySelectionInitial());

  @override
  Stream<CitySelectionState> mapEventToState(
    CitySelectionEvent event,
  ) async* {
    if (event is CitySelected) {
      if (event.name.isNotEmpty) {
        yield CityNameSubmitted(name: event.name);
      }
    }
    if (event is CityChanged) {
      yield CityNameChanged(name: event.text);
    }
  }
}
