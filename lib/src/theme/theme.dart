import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/theme/color/dark_color.dart';

import 'color/lightColor.dart';

class AppTheme {
  const AppTheme();
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    backgroundColor: LightColor.background,
    primaryColor: LightColor.purple,
    accentColor: LightColor.lightblack,
    primaryColorDark: LightColor.Darker,
    primaryColorLight: LightColor.brighter,
    cardTheme: CardTheme(color: LightColor.background),
    textTheme: ThemeData.light().textTheme,
    iconTheme: IconThemeData(color: LightColor.lightblack),
    bottomAppBarColor: LightColor.background,
    dividerColor: LightColor.lightGrey,
    disabledColor: LightColor.darkgrey,
    colorScheme: ColorScheme(
        primary: LightColor.purple,
        primaryVariant: LightColor.purple,
        secondary: LightColor.lightBlue,
        secondaryVariant: LightColor.darkBlue,
        surface: LightColor.background,
        background: LightColor.background,
        error: Colors.red,
        onPrimary: LightColor.Darker,
        onSecondary: LightColor.background,
        onSurface: LightColor.Darker,
        onBackground: LightColor.titleTextColor,
        onError: LightColor.titleTextColor,
        brightness: Brightness.dark),
  );
  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    backgroundColor: DarkColor.background,
    primaryColor: DarkColor.purple,
    accentColor: DarkColor.lightblack,
    primaryColorDark: DarkColor.Darker,
    primaryColorLight: DarkColor.brighter,
    cardTheme: CardTheme(color: DarkColor.background),
    textTheme: ThemeData.dark()
        .textTheme
        .copyWith(bodyText1: TextStyle(color: DarkColor.titleTextColor)),
    iconTheme: IconThemeData(color: DarkColor.lightblack),
    bottomAppBarColor: DarkColor.lightblack,
    dividerColor: LightColor.subTitleTextColor,
    colorScheme: ColorScheme(
        primary: DarkColor.purple,
        primaryVariant: DarkColor.purple,
        secondary: DarkColor.lightBlue,
        secondaryVariant: DarkColor.darkBlue,
        surface: DarkColor.background,
        background: DarkColor.background,
        error: Colors.red,
        onPrimary: DarkColor.white,
        onSecondary: DarkColor.Darker,
        onSurface: DarkColor.white,
        onBackground: DarkColor.titleTextColor,
        onError: DarkColor.titleTextColor,
        brightness: Brightness.dark),
  );

  static TextStyle titleStyle =
      const TextStyle(color: LightColor.titleTextColor, fontSize: 16);
  static TextStyle subTitleStyle =
      const TextStyle(color: LightColor.subTitleTextColor, fontSize: 12);

  static TextStyle h1Style =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style = const TextStyle(fontSize: 16);
  static TextStyle h6Style = const TextStyle(fontSize: 14);
}
