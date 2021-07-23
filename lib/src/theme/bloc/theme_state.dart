import 'package:equatable/equatable.dart';

class ThemeState extends Equatable {
  @override
  List<Object> get props => [];
}

class SelectedTheme extends ThemeState {
  final ThemeType themeType;

  SelectedTheme({this.themeType});

  @override
  List<Object> get props => [themeType];

  @override
  String toString() => 'Theme Selected ';
}

enum ThemeType { Light, Dark }
