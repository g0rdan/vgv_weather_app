import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vgv_core/models/export.dart';

part 'measurement_system_state.dart';

class MeasurementSystemCubit extends Cubit<MeasurementSystemState> {
  MeasurementSystemCubit()
      : super(const MeasurementSystemState(
          temperatureUnits: MeasurementSystemEnum.imperial,
        ));

  void toggle() {
    state.temperatureUnits == MeasurementSystemEnum.imperial
        ? emit(const MeasurementSystemState(
            temperatureUnits: MeasurementSystemEnum.metric,
          ))
        : emit(const MeasurementSystemState(
            temperatureUnits: MeasurementSystemEnum.imperial,
          ));
  }
}
