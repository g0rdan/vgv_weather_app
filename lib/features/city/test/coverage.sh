#!/bin/sh

echo '[Shows city coverage]:'
flutter test --coverage test/vgv_weather_city_test.dart
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
