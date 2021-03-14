import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum AniProps { firstColor, secondColor, thirdColor }

class AnimatedBackground extends StatelessWidget {
  AnimatedBackground({
    required this.color,
    required this.prevColor,
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final MaterialColor prevColor;
  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    final _tween = MultiTween<AniProps>()
      ..add(
        AniProps.firstColor,
        prevColor[700]!.tweenTo(color[700]!),
        2.seconds,
      )
      ..add(
        AniProps.secondColor,
        prevColor[500]!.tweenTo(color[500]!),
        2.seconds,
      )
      ..add(
        AniProps.thirdColor,
        prevColor[300]!.tweenTo(color[300]!),
        2.seconds,
      );

    return PlayAnimation<MultiTweenValues<AniProps>>(
      tween: _tween, // Pass in tween
      duration: _tween.duration, // Obtain duration from MultiTween
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
  }
}
