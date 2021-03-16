#!/bin/sh

echo '[Shows core coverage]:'
flutter test --coverage test/vgv_core_test.dart
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
