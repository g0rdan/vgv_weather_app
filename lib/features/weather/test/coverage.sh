#!/bin/sh

echo '[Shows weather coverage]:'
flutter test --coverage test/vgv_weather_test.dart
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
