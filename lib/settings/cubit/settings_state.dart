part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState({required this.temperatureUnits});

  final TemperatureUnit temperatureUnits;

  @override
  List<Object> get props => [temperatureUnits];
}
