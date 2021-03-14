import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'package:vgv_theme/cubit/theme_cubit.dart';

enum AniProps { firstColor, secondColor, thirdColor }

class AnimatedBackground extends StatelessWidget {
  AnimatedBackground({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, themeState) {
      final _tween = MultiTween<AniProps>()
        ..add(
          AniProps.firstColor,
          themeState.prevColor[700]!.tweenTo(themeState.color[700]!),
          2.seconds,
        )
        ..add(
          AniProps.secondColor,
          themeState.prevColor[500]!.tweenTo(themeState.color[500]!),
          2.seconds,
        )
        ..add(
          AniProps.thirdColor,
          themeState.prevColor[300]!.tweenTo(themeState.color[300]!),
          2.seconds,
        );

      return PlayAnimation<MultiTweenValues<AniProps>>(
        tween: _tween,
        duration: _tween.duration,
        builder: (context, _, value) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.6, 0.8, 1.0],
                colors: [
                  value.get(AniProps.firstColor),
                  value.get(AniProps.secondColor),
                  value.get(AniProps.thirdColor),
                ],
              ),
            ),
            child: child,
          );
        },
      );
    });
  }
}
