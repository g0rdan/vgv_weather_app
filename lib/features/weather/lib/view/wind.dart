import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vgv_core/models/export.dart';

class WindView extends StatelessWidget {
  const WindView({
    required this.weather,
    Key? key,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10.0,
        children: [
          Image.asset(
            'assets/wind.png',
            width: 30,
            color: Colors.white,
          ),
          Text(
            '${weather.windSpeed.toStringAsFixed(2)} m/s',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
