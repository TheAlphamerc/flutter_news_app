import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/theme/theme.dart';
import 'src/pages/homePage/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: MyHomePage(),
    );
  }
}
