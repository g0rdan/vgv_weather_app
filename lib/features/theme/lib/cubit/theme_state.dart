part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  const ThemeState({
    required this.color,
    required this.prevColor,
  });

  final MaterialColor color;
  final MaterialColor prevColor;

  @override
  List<Object> get props => [color, prevColor];
}
