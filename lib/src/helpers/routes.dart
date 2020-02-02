import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/pages/homePage/homePage.dart';
import 'package:flutter_news_app/src/pages/newsDetail/newsDetailPage.dart';

class Routes{
  static Map<String,WidgetBuilder> getRoute(){
    return  <String, WidgetBuilder>{
          '/': (_) => HomePage(),
          '/detail': (_) => NewsDetailPage()
        };
  }
}