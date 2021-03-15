part of 'city_selection_bloc.dart';

abstract class CitySelectionEvent extends Equatable {
  const CitySelectionEvent();
}

class CitySelected extends CitySelectionEvent {
  CitySelected({required this.name});

  final String name;

  @override
  List<Object> get props => [name];
}

class CityChanged extends CitySelectionEvent {
  CityChanged({required this.text});

  final String text;

  @override
  List<Object> get props => [text];
}
