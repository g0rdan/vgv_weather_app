part of 'measurement_system_cubit.dart';

class MeasurementSystemState extends Equatable {
  const MeasurementSystemState({required this.temperatureUnits});

  final MeasurementSystemEnum temperatureUnits;

  @override
  List<Object> get props => [temperatureUnits];
}
