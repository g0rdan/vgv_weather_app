import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vgv_theme/cubit/theme_cubit.dart';
import 'package:vgv_theme/repository/theme_repository.dart';
import 'package:vgv_theme/view/export.dart';

void main() {
  group('Animated bg', () {
    late ThemeCubit cubit;

    setUp(() {
      cubit = ThemeCubit(
        themeRepository: ThemeRepository(),
        initialState: const ThemeState(
          color: Colors.green,
          prevColor: Colors.red,
        ),
      );
    });

    testWidgets('renders animation background', (tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: cubit,
          child: MaterialApp(
            home: Scaffold(
              body: AnimatedBackground(
                child: Container(
                  width: 200,
                  height: 200,
                ),
              ),
            ),
          ),
        ),
      );
      expect(find.byKey(const Key('animated_background')), findsOneWidget);
    });
  });

  group('Static bg', () {
    late ThemeCubit cubit;

    setUp(() {
      cubit = ThemeCubit(
        themeRepository: ThemeRepository(),
        initialState: const ThemeState(
          color: Colors.green,
          prevColor: Colors.red,
        ),
      );
    });

    testWidgets('renders static background', (tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: cubit,
          child: MaterialApp(
            home: Scaffold(
              body: StaticBackground(
                child: Container(
                  width: 200,
                  height: 200,
                ),
              ),
            ),
          ),
        ),
      );
      expect(find.byKey(const Key('static_background')), findsOneWidget);
    });
  });
}
