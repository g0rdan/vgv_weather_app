#!/bin/sh

echo '[Shows theme coverage]:'
flutter test --coverage test/vgv_theme_test.dart
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
