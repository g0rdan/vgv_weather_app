import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgv_core/models/export.dart';
import 'package:vgv_weather_measurement_system/cubit/measurement_system_cubit.dart';

class WindView extends StatelessWidget {
  const WindView({
    required this.weather,
    Key? key,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<MeasurementSystemCubit, MeasurementSystemState>(
        builder: (context, state) {
          return Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10.0,
            children: [
              Image.asset(
                'assets/wind.png',
                width: 30,
                color: Colors.white,
              ),
              Text(
                _convertSpeed(
                  weather.windSpeed,
                  state.temperatureUnits,
                ),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  String _convertSpeed(double speed, MeasurementSystemEnum unit) {
    final isFahrenheit = unit == MeasurementSystemEnum.imperial;
    final convertedSpeed = isFahrenheit ? speed * 2.236936 : speed;
    final measureUnit = isFahrenheit ? 'mph' : 'm/s';
    return '${convertedSpeed.toStringAsFixed(2)} $measureUnit';
  }
}
