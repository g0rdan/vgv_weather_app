part of 'city_selection_bloc.dart';

abstract class CitySelectionState extends Equatable {
  const CitySelectionState();
}

class CitySelectionInitial extends CitySelectionState {
  @override
  List<Object> get props => [];
}

class CityNameChanged extends CitySelectionState {
  CityNameChanged({required this.name});

  final String name;

  @override
  List<Object> get props => [name];
}

class CityNameSubmitted extends CitySelectionState {
  CityNameSubmitted({required this.name});

  final String name;

  @override
  List<Object> get props => [name];
}
