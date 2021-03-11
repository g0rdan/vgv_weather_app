part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  const ThemeState({required this.theme, required this.color});

  final ThemeData theme;
  final MaterialColor color;

  @override
  List<Object> get props => [theme, color];
}
