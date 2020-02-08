import 'package:equatable/equatable.dart';

class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class LightMode extends ThemeEvent {}

class DarkMode extends ThemeEvent {}
