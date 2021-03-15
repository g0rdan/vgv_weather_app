#!/bin/sh

echo '[Core tests]:'
flutter test lib/core/test/vgv_core_test.dart
echo '[City selection tests]:'
flutter test lib/features/city/test/vgv_weather_city_test.dart
echo '[Temperature switch tests]:'
flutter test lib/features/temperature_switch/test/vgv_weather_temperature_switch_test.dart
echo '[Animated background tests]:'
flutter test lib/features/theme/test/vgv_theme_test.dart
echo '[Weather tests]:'
flutter test lib/features/weather/test/vgv_weather_test.dart