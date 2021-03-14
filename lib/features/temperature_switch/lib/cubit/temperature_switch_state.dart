part of 'temperature_switch_cubit.dart';

class TemperatureSwitchState extends Equatable {
  const TemperatureSwitchState({required this.temperatureUnits});

  final TemperatureUnit temperatureUnits;

  @override
  List<Object> get props => [temperatureUnits];
}
