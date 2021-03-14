import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgv_theme/cubit/theme_cubit.dart';
import 'package:vgv_theme/view/export.dart';

class MockThemeCubit extends MockCubit<ThemeState> implements ThemeCubit {}

void main() {
  group('Theme View', () {
    late ThemeCubit cubit;

    setUp(() {
      cubit = MockThemeCubit();
      when(cubit).calls(#state).thenReturn(ThemeState(
            color: Colors.green,
            prevColor: Colors.red,
          ));
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
      expect(find.byKey(Key(('animated_background'))), findsOneWidget);
    });
  });
}
