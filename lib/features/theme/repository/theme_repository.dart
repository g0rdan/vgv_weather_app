import 'dart:async';

import 'package:flutter/material.dart';

class ThemeRepository {
  MaterialColor _color = Colors.lightBlue;

  // ignore: unnecessary_getters_setters
  MaterialColor get prevColor => _color;
  // ignore: unnecessary_getters_setters
  set prevColor(MaterialColor color) {
    _color = color;
  }
}
