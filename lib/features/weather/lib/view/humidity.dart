import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vgv_core/models/export.dart';

class Humidity extends StatelessWidget {
  const Humidity({
    required this.weather,
    Key? key,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 5.0,
        children: [
          const Image(
            image: AssetImage(
              'assets/humidity.png',
              package: 'vgv_weather',
            ),
            width: 30,
            color: Colors.white,
          ),
          Text(
            '${weather.humidity} %',
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
