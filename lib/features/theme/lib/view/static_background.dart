import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgv_theme/cubit/theme_cubit.dart';

class StaticBackground extends StatelessWidget {
  const StaticBackground({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        return Container(
          key: const Key('static_background'),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.6, 0.8, 1.0],
              colors: [
                themeState.color[700]!,
                themeState.color[500]!,
                themeState.color[300]!,
              ],
            ),
          ),
          child: child,
        );
      },
    );
  }
}
