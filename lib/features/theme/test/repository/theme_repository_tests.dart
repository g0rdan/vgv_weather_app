import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vgv_theme/repository/theme_repository.dart';

void main() {
  group('ThemeRepository tests', () {
    late ThemeRepository repo;

    setUp(() {
      repo = ThemeRepository();
      repo.prevColor = Colors.amber;
    });

    test(
      'check if the repo keep the color',
      () async {
        expect(repo.prevColor, Colors.amber);
      },
    );
  });
}
