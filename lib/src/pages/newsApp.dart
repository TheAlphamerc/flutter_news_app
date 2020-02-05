import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/commonWidget/bottomNavigationBar.dart';

import 'category/categoryPage.dart';
import 'homePage/homePage.dart';

class NewsApp extends StatefulWidget {
  NewsApp({Key key}) : super(key: key);

  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget(controller: _controller),
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          CategoryPage(
            controller: _controller,
          )
        ],
      ),
    );
  }
}
