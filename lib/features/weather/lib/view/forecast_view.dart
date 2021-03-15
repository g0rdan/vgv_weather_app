import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vgv_core/models/export.dart';
import 'package:vgv_core/views/export.dart';
import 'package:vgv_weather/view/export.dart';

class ForecastView extends StatelessWidget {
  const ForecastView({
    required this.weather,
    Key? key,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Expanded(child: WeatherInfo(weather: weather)),
        ),
        Positioned(
          left: 16,
          bottom: 10,
          child: LastUpdated(),
        )
      ],
    );
  }
}
