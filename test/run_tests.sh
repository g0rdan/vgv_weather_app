#!/bin/sh

echo '[Core tests]:'
flutter test lib/core/test/vgv_core_test.dart
echo '[City selection tests]:'
flutter test lib/features/city/test/vgv_weather_city_test.dart
echo '[Measurement system tests]:'
flutter test lib/features/measurement_system/test/vgv_weather_measurement_system_test.dart
echo '[Animated background tests]:'
flutter test lib/features/theme/test/vgv_theme_test.dart
echo '[Weather tests]:'
flutter test lib/features/weather/test/vgv_weather_test.dart