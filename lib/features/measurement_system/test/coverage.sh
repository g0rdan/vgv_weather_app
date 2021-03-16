#!/bin/sh

echo '[Shows measurement system coverage]:'
flutter test --coverage test/vgv_weather_measurement_system_test.dart
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
